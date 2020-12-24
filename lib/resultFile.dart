import 'package:bmicalculatorurdu/constantFile.dart';
import 'package:flutter/material.dart';
import 'constantFile.dart';
import 'ContainerFile.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {

  ResultScreen(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleStyles2,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatContainerCode(colors: activeColorMale,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                  style: kResultText,
                  ),
                  Text(bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,

                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:    GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
              },
              child: Container(
                child: Center(
                  child: Text('ReCalculate',style: kLargeButtonStyle,
                  ),
                ),

                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 20.0,
              ),
            ),
          ),

        ],
      )
    );
  }
}
