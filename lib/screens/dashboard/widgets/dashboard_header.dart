import 'package:flutter/material.dart';
import 'package:stormeventslima/widgets/heartbeat_animation.dart';

import '../../../constants.dart';

class MainMenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'LIMA\nStorm Events',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: spaceM),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kelompok 3',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(width: spaceM),
              Padding(
                padding: const EdgeInsets.only(bottom: paddingS),
                child: HeartbeatAnimation(
                  child: Text(
                    '❤️',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
