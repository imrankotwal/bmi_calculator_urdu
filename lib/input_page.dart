import 'package:bmicalculatorurdu/constantFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconTextFile.dart';
import 'ContainerFile.dart';
import 'constantFile.dart';
import 'resultFile.dart';
import 'calculatorFile.dart';


enum  Gender {
  male,
  female,
}




class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender selectGender;
  int sliderHeight = 180;
  int sliderWeight = 60;
  int sliderAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Row(
            children:<Widget> [
              Expanded(
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  colors: selectGender==Gender.male?activeColorMale:deActiveColorMale,
                  cardWidget:  RepeatTextAndIconWidget(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),

                ),

              ),
              Expanded(

                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  colors: selectGender==Gender.female?activeColorFeMale:deActiveColorFemale,
                  cardWidget:  RepeatTextAndIconWidget(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                  ),
              ),
            ],
          ),),
          Expanded(child:  new RepeatContainerCode(
            colors: Colors.blueGrey,
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('HEIGHT',style: kLabelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      sliderHeight.toString(),
                    style: kNumberStyle),
                    Text(
                        'cm',
                        style: kLabelStyle),

                  ],
                ),
                Slider(
                  value: sliderHeight.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Colors.purpleAccent,
                  inactiveColor: Colors.red,
                  onChanged: (double newValue){
                    setState(() {
                      sliderHeight = newValue.round();

                    });
                  },
                ),
              ],
            ),
          ),
          ),
          Expanded(
            child: Row(
            children: <Widget> [
              Expanded(child:  new RepeatContainerCode(
                  colors: Colors.deepOrangeAccent,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      'Weight',
                      style: kLabelStyle,
                    ),

                    Text(
                      sliderWeight.toString(),
                      style: kNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        RoundIcon(
                          iconData: FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderWeight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,
    ),
                        RoundIcon(
    iconData: FontAwesomeIcons.plus ,
    onPress: (){
    setState(() {
    sliderWeight++;
    });
    },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(
                child:  new RepeatContainerCode(colors: Colors.lightBlue,

                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      'Age',
                      style: kLabelStyle,
                    ),

                    Text(
                      sliderAge.toString(),
                      style: kNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        RoundIcon(
                          iconData: FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderAge--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,
                        ),
                        RoundIcon(
                          iconData: FontAwesomeIcons.plus ,
                          onPress: (){
                            setState(() {
                              sliderAge++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),

              ),

              ),
            ],
          ),),

         GestureDetector(
           onTap: (){
             CalculatorBrain calc = CalculatorBrain(height: sliderHeight, weight: sliderWeight);
             Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(
               bmiResult: calc.calculateBMI(),
               resultText: calc.getResult(),
               interpretation: calc.getInterpretation(),
             )));
           },
         child: Container(
            child: Center(
              child: Text('Calculate',style: kLargeButtonStyle,
              ),
            ),

            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 60.0,
          ),
         ),
        ],
      ),
    );
  }
}


class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.iconData, @required this.onPress});
  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 36.0,
        width: 36.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
