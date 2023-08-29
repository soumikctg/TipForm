import 'package:flutter/material.dart';
import 'package:tipcalculateform/Screens/inputfield.dart';



class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();

}


class _TipCalculatorState extends State<TipCalculator>{

  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xFFEFEFEF);  // Light Gray
  static const Color textBlock = Color(0xFF333333);       // Dark Gray
  static const Color textlightBlock = Color(0xFF666666);  // Medium Gray
  static const Color clearButtonColor = Color(0xFFFFA500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Tip Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text("Total Bill", style: TextStyle(color: textlightBlock)),
                      Text("\$ ${totalBillController.text}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700,color: textBlock)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Person", style: TextStyle(color: textlightBlock)),
                          Text("Tip Amount", style: TextStyle(color: textlightBlock)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("05",  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: textBlock)),
                          Text("\$ 20.0",  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: textBlock)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount per person ", style: TextStyle(color: textlightBlock)),
                      Text("\$ 20.0",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color: textBlock)),
                    ],
                  ),
                ),

                SimpleInputField(
                    controller: totalBillController,
                    title: "Total Bill",
                    iconData: Icons.attach_money,
                    hintText: "Please Enter the Bill"),
                SimpleInputField(
                    controller: totalTipController,
                    title: "Tip Percentage",
                    iconData: Icons.percent,
                    hintText: "Please enter the tip"),
                SimpleInputField(
                    controller: totalPeopleController,
                    title: "Number of people",
                    iconData: Icons.people,
                    hintText: "Pleae enter total number "),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          formKey.currentState!.validate();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          alignment: Alignment.center,
                          child: const Text("calculate", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(width:10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                        decoration: BoxDecoration(
                            color: clearButtonColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text("clear", style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      ),

    );
  }



}