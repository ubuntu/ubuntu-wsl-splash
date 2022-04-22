# Technical explanation

This project is meant to be very small and simple. It consists of a slide show inspired in previous versions of Ubuntu desktop installers (aka ubiquity-slide-show), but with content focused on the use cases for Ubuntu on WSL and must run only during first distribution setup.

Even though it's written in Flutter, there is some Windows-specific code in C++ and Dart as well, thus it is not meant to work in other operating systems, which makes sense since there is no WSL outside of Windows.

When compiled in release mode, this application reads from the WSL launcher standard output and displays that content in the log view area in the bottom part of the window. Also, it comunicates with the launcher using named pipe at startup, so invoking this app alone when compiled in release mode will display a non-responsive application. The launcher also control this application lifecycle by sending messages.

In debug mode it writes predefined messages to exercise the application states and the IPC mentioned above is skipped, so developers should not need to interact with WSL to experiment with this slide show. Error messages displayed by this application when running in this mode are intentional and should not worry developers.

The continous integration workflow triggered by new pull requests (or updates to existing pull requests) apply some well known best practices:

- Linting with Flutter lints
- Running unit tests
- Format checking

One can easily inspect the workflow [looking here](../.github/workflows/flutter-ci.yaml) to reproduce the relevant steps locally before pushing new code.

> Beware of those steps before pushing code to this repository to avoid red emails from GitHub actions. :smile:

---

## Not sure what to do to start contributing to this project?


### Consider translating some texts

> As with anything else in life, this will require some very basic git skills.

Consider translating the `arb` files contained in [lib/l10n](../lib/l10n/). Those are plain text files encoded in JSON, so its very easy to work with. Let's say you want to make translations to Czech. The locale code is `cs`, thus you can copy the `app_en.arb` file into `app_cs.arb` and translate the texts at right of the `:`. Keep the symbols at left as they are. Please compare the original `app_en.arb` to one of the existing translations (`app_pt.arb` for instance) for further reference. When doing translations have your focus on the `arb` files. Dart files are automatically generated, so when you're done:

1. Commit your changes
1. Run the flutter app to regenerate the Dart localization files
1. Commit the generated files.
1. Open a pull request on GitHub.

### Report bugs

Issues and bug reports are also welcome. Just make sure to understand the project characteristcs mentioned above before misinterpreting an expected behavior with a bug.

### Flutter code

If you're a skilled Flutter developer you can contribute with test code, or even improve the design and performance of the application.