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

import 'package:flutter/material.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import 'slide.dart';

/// Implements a slide show in which all slides have a common background image.
/// Control comes from the SlideShow widget from ubuntu_widgets package.
/// An 'installation status' is (planned to be) shown at the bottom of the page.
class SlidesPage extends StatelessWidget {
  final List<Slide> slides;

  const SlidesPage(this.slides, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.scaleDown,
                ),
                SlideShow(
                  slides: slides,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
