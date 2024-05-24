import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'Resuable_card.dart';
import 'Button_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
      @required this.bmiresult,
      @required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Expanded(
              child: Container(
                padding: EdgeInsets.all(11.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULTS',
                  style: kTitleText,
                ),
              ),
            )),
            Expanded(
                flex: 5,
                child: Resuablecard(
                  colour: activecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resulttext.toUpperCase(),
                        style: kresulttextstyle,
                      ),
                      Text(
                        bmiresult,
                        style: kBMITextstyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kbodyTextstyle,
                      )
                    ],
                  ),
                )),
            Bottombutton(
                buttonTitle: 'RECALCULATE',
                onTap: () {
                  Navigator.pop(context);
                }),
          ]),
    );
  }
}
