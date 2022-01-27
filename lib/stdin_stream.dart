import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

Stream<String> stdinStream() {
  if (kDebugMode) {
    return _debugStream();
  }
  return _prodStream();
}

Stream<String> _debugStream() {
  const stdoutMessages = [
    "Installing, this may take a few minutes...",
    "Installation successful!",
    "Launching the OOBE",
    "flutter: INFO ubuntu_wsl_setup: Logging to /var/log/installer/ubuntu_wsl_setup.log",
    "Error: OOBE not found.",
  ];

  return Stream.periodic(const Duration(seconds: 2),
      (index) => stdoutMessages[index % stdoutMessages.length]);
}

Stream<String> _prodStream() =>
    stdin.transform(systemEncoding.decoder).transform(const LineSplitter());
