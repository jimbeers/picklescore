import 'package:flutter/material.dart';
import 'package:picklescore/screens/side_score.dart';
import 'package:picklescore/screens/two_digit_num.dart';
import 'package:provider/provider.dart';

import '../models/score.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServeButton(0),
              Expanded(child: SizedBox(width: 100)),
              ServeButton(2),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TwoDigitNumber(
                    number: Provider.of<Score>(context, listen: false).score1),
                TwoDigitNumber(
                    number: Provider.of<Score>(context, listen: false).score3),
                SideScore(
                    side1server: Provider.of<Score>(context, listen: false)
                        .curState
                        .sideOneServer,
                    number:
                        Provider.of<Score>(context, listen: false).scoreSide),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServeButton(1),
              Expanded(child: SizedBox(width: 100)),
              ServeButton(3),
            ],
          ),
        ),
      ],
    );
  }
}

class ServeButton extends StatelessWidget {
  final int server;

  const ServeButton(this.server);

  @override
  Widget build(BuildContext context) {
    Color color =
        Provider.of<Score>(context, listen: false).getButtonColor(server);
    return Container(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: FilledButton(
          onPressed: () {
            Provider.of<Score>(context, listen: false)
                .hitButton([0, 1].contains(server));
          },
          child: Text(
              '${(Provider.of<Score>(context, listen: false).getElement(server))} ${server}'),
          style: FilledButton.styleFrom(
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
