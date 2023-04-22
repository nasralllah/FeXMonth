import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}
class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  dynamic Valuee = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 200,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child: Text("Store Filtering",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Brand",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              margin: EdgeInsets.only(left: 60, top: 20),
            ),

        Row(
          children: <Widget>[
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: Valuee,
              onChanged: (value) {
                setState(() {
                  Valuee = value;
                });
              },
            ),
            Radio(
              value: 2,
              groupValue: Valuee,
              onChanged: (value) {
                setState(() {
                  Valuee = value;
                });
              },
            ),
            Radio(

              value: 3,
              groupValue: Valuee,
              onChanged: (value) {
                setState(() {
                  Valuee = value;
                });
              },
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Option 1'),
            Text('Option 2'),
            Text('Option 3'),
          ],
        ),
          ],
        )





          ],
        ),
      ),
    );
  }
}
