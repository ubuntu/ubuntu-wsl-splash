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

import 'constants.dart';

class InstallerStatus extends StatelessWidget {
  const InstallerStatus({
    Key? key,
    required this.title,
    required this.statusIcon,
    required this.log,
    required this.maxLines,
    this.subtitle,
  }) : super(key: key);
  final Widget title;
  final Widget statusIcon;
  final Widget? subtitle;
  final Stream<String> log;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpanElementSize),
      child: ExpansionTile(
        title: title,
        leading: statusIcon,
        subtitle: subtitle,
        controlAffinity: ListTileControlAffinity.trailing,
        childrenPadding: const EdgeInsets.only(left: 3 * kSpanElementSize),
        expandedAlignment: Alignment.topLeft,
        children: [
          LogView(
            log: log,
            maxLines: maxLines,
            padding: const EdgeInsets.symmetric(horizontal: kContentSpacing),
            style: TextStyle(
              inherit: false,
              fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
              fontFamily: 'Ubuntu Mono',
              textBaseline: TextBaseline.alphabetic,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: kContentSpacing / 2),
            ),
            background: BoxDecoration(color: Theme.of(context).shadowColor),
          ),
        ],
        maintainState: true,
      ),
    );
  }
}
