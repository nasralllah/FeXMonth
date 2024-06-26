import 'package:fexmonths/Constens.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);


  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}
class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  dynamic Valuee = 1;
  RangeValues _currentRangeValues =  const RangeValues(2.0, 3.0);
  RangeValues _current2RangeValues = const RangeValues(2500,4500);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 200,
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    color: KBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                  child: Text("Product Filtering",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),

                Column(
                  children: [
                    Container(

                      alignment: Alignment.centerLeft,
                      child: Text("Catogry",
                          style: TextStyle(
                              color: KBlueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      margin: EdgeInsets.only(left: 60, top: 20),
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: KBlueColor,
                          value: 1,
                          groupValue: Valuee,
                          onChanged: (value) {
                            setState(() {
                              Valuee = value;
                            });
                          },
                        ),
                        Text("1")
                      ],
                    ),Row(
                      children: [
                        Radio(
                        activeColor: KBlueColor,
                         //fillColor: MaterialStateColor.resolveWith((states) => KBlueColor),
                          value: 2,
                          groupValue: Valuee,
                          onChanged: (value) {
                            setState(() {
                              Valuee = value;
                            });
                          },
                        ),
                        Text("2")
                      ],
                    ),Row(
                      children: [
                        Radio(
                          activeColor: KBlueColor,
                          value: 3,
                          groupValue: Valuee,
                          onChanged: (value) {
                            setState(() {
                              Valuee = value;
                            });
                          },
                        ),
                        Text("3")
                      ],
                    ),Row(
                      children: [
                        Radio(
                          activeColor: KBlueColor,
                          value: 4,
                          groupValue: Valuee,
                          onChanged: (value) {
                            setState(() {
                              Valuee = value;
                            });
                          },
                        ),
                        Text("4")
                      ],
                    ),Row(
                      children: [
                        Radio(
                          activeColor: KBlueColor,
                          value: 5,
                          groupValue: Valuee,
                          onChanged: (value) {
                            setState(() {
                              Valuee = value;
                            });
                          },
                        ),
                        Text("5")
                      ],
                    ),
                  ],
                ),
              /*Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Status",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    margin: EdgeInsets.only(left: 60, top: 20),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("1")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("2")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("3")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("4")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 5,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("5")
                    ],
                  ),
                ],
              ),*/
              /*Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Color",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    margin: EdgeInsets.only(left: 60, top: 20),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("1")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("2")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("3")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("4")
                    ],
                  ),Row(
                    children: [
                      Radio(
                        value: 5,
                        groupValue: Valuee,
                        onChanged: (value) {
                          setState(() {
                            Valuee = value;
                          });
                        },
                      ),
                      Text("5")
                    ],
                  ),
                ],
              ),*/

              Container(

                alignment: Alignment.centerLeft,
                child: Text("Price",
                    style: TextStyle(
                        color: KBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                margin: EdgeInsets.only(left: 60, top: 20),
              ),
              RangeSlider(
                activeColor: KBlueColor,

                values: _current2RangeValues,
                min: 5.0,
                max: 10000.0,
                divisions: 20000,
                labels: RangeLabels(
                  _current2RangeValues.start.round().toString(),
                  _current2RangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _current2RangeValues = values;
                    print(_current2RangeValues);
                  });
                },
              ),
              Container(

                alignment: Alignment.topLeft,
                child: Text("Price: \$100.00 to \$2500.00",
                    style: TextStyle(
                        color: KGreyColor2,
                        fontSize: 12)),
                margin: EdgeInsets.only(left: 25),

              ),
              Container(

                alignment: Alignment.centerLeft,
                child: Text("Rate",
                    style: TextStyle(
                        color: KBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                margin: EdgeInsets.only(left: 60, top: 20),
              ),
              RangeSlider(
                activeColor: KBlueColor,
                values: _currentRangeValues,
                min: 0.0,
                max: 5.0,
                divisions: 10,
                labels: RangeLabels(

                  _currentRangeValues.start.toString(),
                  _currentRangeValues.end.toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    print(_currentRangeValues);
                  });
                },
              ),
              Container(

                alignment: Alignment.topLeft,
                child: Text("Rate: 0.0 to 5.0",
                    style: TextStyle(
                        color: KGreyColor2,
                        fontSize: 12)),
                margin: EdgeInsets.only(left: 25),

              ),



            ],
          ),
        ),
      ),
    );
  }
}
