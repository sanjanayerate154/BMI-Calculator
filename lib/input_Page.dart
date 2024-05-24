import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'Resuable_card.dart';
import 'constant.dart';
import 'Button_button.dart';
import 'Round_icon.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 20;

  Color malecardcolor = inactivecardcolor;
  Color femalecardcolor = inactivecardcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: Resuablecard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: Resuablecard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  )),
                ],
              )),
              Expanded(
                  child: Resuablecard(
                colour: activecardcolor,
                cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGTH',
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: Knumbertextstyle),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8DBE98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newvalue) {
                              setState(() {
                                height = newvalue.round();
                              });
                            },
                          ),
                        ),
                      )
                    ]),
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: Resuablecard(
                    colour: activecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: Knumbertextstyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Resuablecard(
                    colour: activecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: Knumbertextstyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              )),
              Bottombutton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain cal =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  bmiresult: cal.CalculateBMI(),
                                  resulttext: cal.getResult(),
                                  interpretation: cal.interpretation(),
                                )));
                  }),
            ]));
  }
}
