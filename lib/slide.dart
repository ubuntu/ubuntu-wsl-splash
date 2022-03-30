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
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';
import 'l10n/app_localizations.dart';

/// Implements the look of a single slide presented by WSL splash screen.
class Slide extends StatelessWidget {
  static const kInSlideLeftSpacing = 1 * kContentSpacing;
  static const kInSlideSpacing = 5 * kContentSpacing;
  const Slide({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.text,
  }) : super(key: key);

  final Widget image;
  final String title;
  final String subtitle;
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
          height: kSlideContentHeight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              kInSlideLeftSpacing,
              kInSlideSpacing,
              kInSlideSpacing,
              kInSlideSpacing,
            ),
            child: Row(
              children: [
                Expanded(
                  child: image,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white70,
                            fontSize: 32,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        text,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
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

List<Slide> theSlides(BuildContext context) {
  final lang = AppLocalizations.of(context);
  final theSameAsset = SvgPicture.asset('assets/1-Ubuntu on WSL.svg');
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
