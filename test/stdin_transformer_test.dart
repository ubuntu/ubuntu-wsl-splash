/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'dart:async';
import 'dart:io';

import 'package:test/test.dart';
import 'package:ubuntu_wsl_splash/stdin_transformer.dart';

void main() {
  group('Stdin Transformer', () {
    test('Broken string should be reassembled', () {
      const brokenStdin = ["I", "nstalling..."];
      final repaired = [brokenStdin.join()];
      _transformerAssert(input: brokenStdin, output: repaired);
    });

    test('Multiple broken strings should also be reassembled', () {
      const brokenStdin = ["I", "nstalling...", "D", "one"];
      const repaired = ["Installing...", "Done"];

      _transformerAssert(input: brokenStdin, output: repaired);
    });

    test('Non-broken string should be preserved', () {
      const nonBrokenStdin = ["Installing...", "Done"];

      _transformerAssert(input: nonBrokenStdin, output: nonBrokenStdin);
    });
  });
}

void _transformerAssert(
    {required Iterable<String> input, required Iterable<String> output}) {
  final fakeStdin = StreamController<List<int>>();
  final stringStdin = Stream.fromIterable(input);
  fakeStdin.addStream(stringStdin.transform(systemEncoding.encoder));

  final resultStream = fakeStdin.stream.transform(StdinTransformer());

  expect(resultStream, emitsInOrder(output));
}
