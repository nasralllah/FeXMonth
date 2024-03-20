import 'package:flutter/material.dart';


import '../view/base_widget/Chose_Colores_Cirlcle.dart';
import 'Single_Product.dart';
class CardVarints extends StatelessWidget {
  const CardVarints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: cadrVisibleVarents,

        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15,top: 10),
                child: const Text(
                  "Colors",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                children: [
                  Cirical_Widget_Color(
                      Image: SelectColor == circleColor.red? Image.asset("Images/Path 577.png",opacity: const AlwaysStoppedAnimation(.5),fit: BoxFit.fill,):Container(),
                      GradientColor: LinearGradient(
                          begin:Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.red,
                            Colors.red.shade50,
                          ]
                      ),
                      Visible: true,
                      onTap: null,
                      height: 45,
                      width: 45, paddingLeft: 2,

                  ), Cirical_Widget_Color(
                      Image: SelectColor == circleColor.blue? Image.asset("Images/Path 577.png",opacity: const AlwaysStoppedAnimation(.5),fit: BoxFit.fill,):Container(),
                      GradientColor: LinearGradient(
                          begin:Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue,
                            Colors.blue.shade50,
                          ]
                      ),
                      Visible: true, onTap: null,height: 45,width: 45, paddingLeft: 2,

                  ), Cirical_Widget_Color(
                      Image: SelectColor == circleColor.green? Image.asset("Images/Path 577.png",opacity: const AlwaysStoppedAnimation(.5),fit: BoxFit.fill,):Container(),
                      GradientColor: LinearGradient(
                          begin:Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.green,
                            Colors.green.shade50,
                          ]
                      ),
                      Visible: true, onTap:null, height: 45,width: 45, paddingLeft: 2,


                  ),

                ],
              )
            ],
          ),
        )
    );
  }
}

