import 'package:bmi_calculator_app/components/ui_components.dart';
import 'package:flutter/material.dart';
class BmiCalScreen extends StatefulWidget {
  const BmiCalScreen({super.key});

  @override
  State<BmiCalScreen> createState() => _BmiCalScreenState();
}

class _BmiCalScreenState extends State<BmiCalScreen> {

   TextEditingController ftController = TextEditingController();
   TextEditingController wtController = TextEditingController();
   TextEditingController inController = TextEditingController();

   String result = "";

   var myColor = Colors.indigo.withOpacity(0.2);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("BMI Calculator App",style:  TextStyle(
          fontWeight: FontWeight.w700,
        color: Colors.white
        ),),

      ),
      body: Container(
        color: myColor,
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const  Text("YOUR BMI",style:  TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),),
              const   SizedBox(height: 20,),
               uiHelper.customTextFormField(
                   text: "Enter Your Weight Here(kg)",
                   iconData: Icons.line_weight,
                   controller: wtController),
                uiHelper.customTextFormField(
                    text: "Enter Your Height Here(feet)",
                    iconData: Icons.height,
                    controller: ftController),
                uiHelper.customTextFormField(
                    text: "Enter Your Weight Here(inch)",
                    iconData: Icons.height,
                    controller: inController),
                const   SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,


                    ),
                      onPressed: (){
                      var ft = ftController.text.toString();
                      var wt = wtController.text.toString();
                      var inch = inController.text.toString();

                      if(ft != "" && wt!="" && inch!=""){

                        var ift = int.parse(ft);
                        var iwt = int.parse(wt);
                        var iInch = int.parse(inch);

                        var tInch = (ift*12) + iInch;
                        var tcm = tInch*2.54;
                        var tm = tcm/100;

                        var bmi = iwt/(tm*tm);
                        var message;
                        if(bmi>25){
                          message = "Your Are OverWeighted!!";
                          myColor = Colors.orange.withOpacity(0.2);
                        }else if(bmi<18){
                          message = "Your Are UnderWeighted!!";
                          myColor = Colors.red.withOpacity(0.2);

                        }else{
                          message = "Your Are Fit!!";
                          myColor = Colors.green.withOpacity(0.2);
                        }

                        setState(() {
                          result = "$message \n Your BMI Is: ${bmi.toStringAsFixed(2)}";
                        });

                      }else{
                        setState(() {
                          result = "Please Fill all the required blanks!!";
                        });

                      }

                      },
                      child:const  Text('Calculate',style:  TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        fontSize: 20
                      ))),
                ),
               const  SizedBox(height: 20,),

                Text(result,textAlign: TextAlign.center,style: const TextStyle(
                            color: Colors.black,
                  fontSize: 15,
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
