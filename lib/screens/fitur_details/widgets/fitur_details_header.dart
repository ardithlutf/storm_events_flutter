import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:stormeventslima/data/models/fitur.dart';
import '../../../constants.dart';

class FiturDetailsHeader extends StatelessWidget {
  final Fitur designPattern;

  const FiturDetailsHeader({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              designPattern.title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 32.0,
                  ),
            ),
          ],
        ),
        const SizedBox(height: spaceL),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                designPattern.description,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 99,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
