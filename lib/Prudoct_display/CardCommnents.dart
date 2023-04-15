import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/DynamicComments.dart';
import 'Single_Product.dart';
final myController = TextEditingController();
class cardComments extends StatefulWidget {
  const cardComments({
    Key? key,
  }) : super(key: key);

  @override
  State<cardComments> createState() => _cardCommentsState();
}

class _cardCommentsState extends State<cardComments> {


  List<DynamicComments> listComments = [];
  addComment(){
    listComments.add(DynamicComments(widget: Text("12th Feb, 2018 at 05:56 pm",style: TextStyle(fontSize: 9),), Texts: Text(myController.text == null?"" : myController.text),));
    setState(() {

    });
  }

  /*@override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cardVisibleComments,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 305,
                    height: 40,
                    margin: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
                    child:  TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(30.0),
                                left: Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: "A new Comment"),
                    ),
                  ),
                  Blue_Button(ButtonText: 'Send', height: 30, width: 60, Margintop: 20, Marginleft: 260,onTap: addComment,)
                ],
              )
            ],
          ),
         Container(
           width: double.infinity,
           height: 200,
           child: ListView.builder(
             shrinkWrap: false,
              primary: true,
              itemCount: listComments.length,
                itemBuilder: (_,index)=>listComments[index]),
         )
        ],
      )),
    );
  }
}
