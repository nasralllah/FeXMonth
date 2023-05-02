import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class carsoulLoadin extends StatelessWidget {
  const carsoulLoadin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: Colors.blue.shade100,
          highlightColor: Colors.white,

          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  color: Colors.grey,
                ),

              ),

            ),

          )

      ),
    );




    /*Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: AspectRatio(
                aspectRatio: 16/9,
              child: Container(
                color: Colors.grey,
              ),

            ),

          ),

        )
      ],
    );*/
  }
}

class cardsLoading extends StatelessWidget {
  const cardsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.blue.shade100,
          highlightColor: Colors.white,
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(2))
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.blue.shade100,
          highlightColor: Colors.white,
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(2))
            ),
          ),
        )
      ],
    );
  }
}

class phptosLoading extends StatelessWidget {
  const phptosLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.blue.shade100,
            highlightColor: Colors.white,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular( 10))
              ),
            ),
          ),
        ]
    );
  }
}

