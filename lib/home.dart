import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var input ='';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(

                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(input, style: TextStyle(color: Colors.white,fontSize: 20)),
                      SizedBox(height: 20,),
                      Text(answer, style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.w500)),
                      Row(),

                      SizedBox(height: 40,)
                    ],
                  ),
                ) ),
            Expanded(
              flex: 2,
              child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   children: [
                     MyButton(title: 'AC',onPress: (){
                       setState(() {
                         input = '';
                         answer = '';
                       });
                     }),
                     MyButton(title: '+/-',onPress: (){}),
                     MyButton(title: '%',onPress: (){
                       setState(() {
                         input += '%';
                       });
                     }),
                     MyButton(title: '/',color: Colors.orange,onPress: (){
                       setState(() {
                         input += '/';
                       });
                     }),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   children: [
                     MyButton(title: '7',onPress: (){
                       setState(() {
                         input += '7';});
                     }),
                     MyButton(title: '8',onPress: (){
                       setState(() {
                         input += '8';
                       });
                     }),
                     MyButton(title: '9',onPress: (){
                       setState(() {
                         input += '9';
                       });
                     }),
                     MyButton(title: 'x',color: Colors.orange,onPress: (){
                       setState(() {
                         input += 'x';
                       });
                     }),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   children: [
                     MyButton(title: '4',onPress: (){
                       setState(() {
                         input += '4';
                       });
                     }),
                     MyButton(title: '5',onPress: (){
                       setState(() {
                         input += '5';
                       });
                     }),
                     MyButton(title: '6',onPress: (){
                       setState(() {
                         input += '6';
                       });
                     }),
                     MyButton(title: '-',color: Colors.orange,onPress: (){
                       setState(() {
                         input += '-';
                       });
                     }),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   children: [
                     MyButton(title: '1',onPress: (){
                       setState(() {
                         input += '1';
                       });
                     }),
                     MyButton(title: '2',onPress: (){
                       setState(() {
                         input += '2';
                       });
                     }),
                     MyButton(title: '3',onPress: (){
                       setState(() {
                         input += '3';
                       });
                     }),
                     MyButton(title: '+',color: Colors.orange,onPress: (){
                       setState(() {
                         input += '+';
                       });
                     }),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   children: [
                     MyButton(title: '0',onPress: (){
                       setState(() {
                         input += '0';
                       });
                     }),
                     MyButton(title: '.',onPress: (){
                       setState(() {
                         input += '.';
                       });
                     }),
                     MyButton(title: 'DEL',onPress: (){
                       setState(() {
                         input = input.substring(0,input.length-1);
                       });
                     }),
                     MyButton(title: '=',color: Colors.orange,onPress: (){
                       setState(() {
                         equalPress();
                       });
                     }),
                   ],
                 ),
               ),
              ],
            ),)


          ],
        ),
      ),
    );
  }

  void equalPress(){

    String finalInput = input;
    finalInput = input.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression= p.parse(finalInput);
    ContextModel contextModel= ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL,contextModel );
    answer = eval.toString();
  }

}
