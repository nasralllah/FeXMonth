import 'package:flutter/material.dart';



class textWithButtondeleted extends StatelessWidget {

  const textWithButtondeleted(
      {Key? key,
      required this.labelText,
      required this.MarginleftButton,
      required this.MargintopButton,
      required this.MarginbottomButton,
      required this.onTap,
      required this.ButtonText,
      required this.textStyle,
      required this.ButtonText1,
      required this.ButtonText2,
      required this.textStyle2,
      required this.textStyle1, required this.ontapContainer})
      : super(key: key);

  final String labelText;
  final double MarginleftButton;
  final double MargintopButton;
  final double MarginbottomButton;
  final VoidCallback onTap;
  final String ButtonText;
  final TextStyle textStyle;
  final String ButtonText1;
  final TextStyle textStyle1;
  final String ButtonText2;
  final TextStyle textStyle2;
  final VoidCallback ontapContainer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 412,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Row(
              children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(left: 13),
              child: Text("${index+1} ."),
            ),
            Stack(
                children: [
              Container(
                width: 310,
                height: 50,
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.blue)
                ),
                child:  Container(
                    margin: EdgeInsets.only(left: 270),

                    child: IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)
                    )
                ),
              ),

              GestureDetector(
                onTap: ontapContainer,
                child: Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30.0), left: Radius.circular(30.0))),
                    margin: EdgeInsets.only(top: 0, bottom: 10, left: 0, right: 0),
                    child: Container(
                        margin: EdgeInsets.only(left: 60, top: 10),
                        child: Text(
                          labelText,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                    )
                ),
              ),
              Container(
                  width: 80,
                  height: 39,
                  margin: EdgeInsets.only(
                      left: MarginleftButton, top: MargintopButton, bottom: MarginbottomButton),
                  child: TextButton(
                    onPressed: ()=>Null,
                    onLongPress: ()=>Null,
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(3),
                        shadowColor: MaterialStatePropertyAll(Colors.blue.shade800),
                        //  side: MaterialStatePropertyAll(BorderSide(color: Colors.blue)),
                        backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                        shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                    right: Radius.circular(30)
                                )
                            )
                        )
                    ),
                    child: Text(ButtonText, style: textStyle),
                  )
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 30),

                          child: Text(ButtonText1, style: textStyle1)),
                      SizedBox(
                        width: 20,
                      ),

                      Container(
                          margin: EdgeInsets.only( top: 30),

                          child: Text(ButtonText2, style: textStyle2)),
                    ],
                  )
                ],
              )
            ]
            ),
          ]
          );

      },),
    );
  }
}
