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

import 'constants.dart';
import 'l10n/app_localizations.dart';

/// Implements the look of a single slide presented by WSL splash screen.
class Slide extends StatelessWidget {
  static const kInSlideSpacing = 3 * kContentSpacing;
  const Slide({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  final ImageProvider image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(kInSlideSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: image,
                  fit: BoxFit.fitHeight,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kInSlideSpacing),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white70, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// TODO: update this to match the real design when it gets complete.
List<Slide> theSlides(BuildContext context) {
  final lang = AppLocalizations.of(context);
  const theSameAsset = AssetImage('assets/ubuntu-on-wsl.png');
  return [
    Slide(
      image: theSameAsset,
      title: lang.welcome,
      text: lang.ubuntuOnWsl,
    ),
    Slide(
      image: theSameAsset,
      title: 'WSL S2 Ubuntu',
      text: lang.ubuntuOnWsl,
    ),
    Slide(
      image: theSameAsset,
      title: 'So do I',
      text: lang.ubuntuOnWsl,
    ),
  ];
}
