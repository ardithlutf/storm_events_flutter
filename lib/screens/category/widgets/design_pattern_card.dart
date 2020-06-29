import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:stormeventslima/data/models/fitur.dart';
import 'package:stormeventslima/widgets/selection_card.dart';
import '../../../constants.dart';


class DesignPatternCard extends StatelessWidget {
  final Fitur designPattern;

  const DesignPatternCard({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      designPattern.title,
      style: Theme.of(context).textTheme.headline6.copyWith(
            fontSize: 26.0,
          ),
      overflow: TextOverflow.ellipsis,
    );
    var contentText = Text(
      designPattern.description,
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
    var onSelectionCardTap = () => Navigator.pushNamed(
          context,
          designPattern.route,
          arguments: designPattern,
        );

    return SelectionCard(
      backgroundColor: lightBackgroundColor,
      backgroundHeroTag: "${designPattern.id}_background",
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
