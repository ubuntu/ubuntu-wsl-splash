#include "flutter_window.h"

#include <optional>

#include "flutter/standard_method_codec.h"
#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  windowCloseChannel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      flutter_controller_->engine()->messenger(),
      "splash_window_close",
      &flutter::StandardMethodCodec::GetInstance());



  // WIN32 default behavior is:
  // case WM_CLOSE: DestroyWindow(hwnd); return 0; // pressed close? destroy window.
  // case WM_DESTROY: PostQuitMessage(0); return 0; // destroyed window? quit message loop.
  // WM_QUIT isn't associated with a window, so isn't sent to the window procedure
  // So we hook into WM_CLOSE to let Flutter code react,
  // Return from Flutter by default with WM_DESTROY (by caling DestroyWindow)
  // And in the most dramatic case we post WM_QUIT.
  windowCloseChannel->SetMethodCallHandler(
      [handle = GetHandle()](const flutter::MethodCall<flutter::EncodableValue> &call,
                             std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
      {
        if (call.method_name().compare("closeWindow") == 0) {
          PostMessage(handle, WM_CLOSE, 0, 0);
          result->Success(flutter::EncodableValue(nullptr));
        }
        if (call.method_name().compare("hideWindow") == 0) {
          ShowWindow(handle, SW_HIDE);
          result->Success(flutter::EncodableValue(nullptr));
        }
        else if (call.method_name().compare("destroyWindow") == 0) {
          DestroyWindow(handle);
          result->Success(flutter::EncodableValue(nullptr));
        }
        else if (call.method_name().compare("quitWindow") == 0) {
          PostMessage(handle, WM_QUIT, 0, 0);
          result->Success(flutter::EncodableValue(nullptr));
        }
        else {
          result->NotImplemented();
        }
      });

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;

    case WM_CLOSE:
        windowCloseChannel->InvokeMethod("onWindowClose", nullptr);
        return 0;
    
    case WM_USER+7:
        windowCloseChannel->InvokeMethod("onCustomCloseEvent", nullptr);
        return 0;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
