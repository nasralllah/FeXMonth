import 'package:flutter/material.dart';
import 'Constens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Menu_Cards extends StatelessWidget {
  const Menu_Cards({
    Key? key, required this.onpress, required this.Icons, required this.CardName,
  }) : super(key: key);

  final VoidCallback onpress;
 final IconData Icons;
 final String CardName;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 100),
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onpress,
          child: SizedBox(
            height: 50,
            width: 500,
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(Icons,color: Colors.white,)
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(CardName,style: KTextCardStyled,)),

              ],
            ),

          ),
        )
    );
  }
}
