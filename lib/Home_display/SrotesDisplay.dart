import 'package:dio/dio.dart';
import 'package:fexmonths/Home_display/The_App_Bar.dart';
import 'package:fexmonths/Home_display/the_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../API_Backend/Models/StorsDisplayModel.dart';
import '../API_Backend/Provider/PStoresDisplayProvider.dart';
import '../Components/Rating_Widget.dart';
import '../Prudoct_display/Prudocts_Display.dart';
import '../Prudoct_display/SideBar_menu_Products.dart';
import 'Carsoul_loading.dart';

class Stroes extends StatefulWidget {
  const Stroes({Key? key}) : super(key: key);

  @override
  State<Stroes> createState() => _StroesState();
}

class _StroesState extends State<Stroes> {
  List<StoresDisplay>? StoreList;

  @override
  void initState() {
    StoresDetailsProvider(Dio()).getAll().then((value) {
      StoreList = [];
      StoreList!.addAll(value);
      print("___________________________________________");
      print(value);
      print("___________________________________________");
      print(value.length);
      setState(() {});

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  leading: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      icon = true;
                    },
                    child: Container(),
                  ),
                  backgroundColor: Colors.white,
                  flexibleSpace: App_Baar(),
                )
              ],
          body: SingleChildScrollView(
            child: Column(
              children: [

                if(StoreList== null)
                  cardsLoading()
                else
                  Container(
                  height: 465,
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.80,
                      crossAxisSpacing: 5.50,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        padding: EdgeInsets.only(left: 5),
                        /*decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1.0,
                              blurRadius: 10.0,
                              offset: Offset(0, 20.0)
                            )]

                          ),*/
                        child: Card(
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(65.0),
                                  topLeft: Radius.circular(65.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0))),
                          // shadowColor: Colors.grey,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:  EdgeInsets.only(
                                    top: 4, left: 2, right: 2),
                                child:  CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.indigo,
                                  child: CircleAvatar(
                                    radius: 53.0,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 51,
                                      backgroundColor: Colors.black,
                                      child: StoreList == null? cardsLoading():
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "http://10.0.2.2:8000${StoreList![index].profile.logourl}"

                                        ),
                                        radius: 50.0,
                                        backgroundColor: Colors.grey,
                                        foregroundColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   shape: BoxShape.circle,
                                //   boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,spreadRadius: 3)]
                                // ),
                              ),
                              const Spacer(),
                              Center(
                                child: Text("${StoreList![index].attributes.name}",
                                    style: TextStyle(color: Colors.blue.shade800)),
                              ),
                              const Spacer(),
                               Center(
                                child: Text("${StoreList![index].attributes.storename}",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 30, bottom: 5),
                                    child: Rating_widget(
                                      ignoreGestures: true,
                                      direction: Axis.horizontal,
                                      itemSizw: 15.0,
                                      semetricPadding: 2.0,
                                      onRatingUpdate: (value) =>null,
                                      initialRating:3 ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5, right: 5),
                                    child: Text(
                                     /* Rating != null ? Rating.toString() :*/ "",
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration:  BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              border: Border.all(
                  color: Colors.grey.shade400),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    //offset: Offset(0, -1),
                    spreadRadius: 4,
                    blurRadius: 30
                )
              ]
          ),
          height: 80.0.h,
          child: Row(
            children: [
              SizedBox(
                width: 40.w,
              ),
              IconButton(
                  onPressed: () {
                    print(StoreList![1].attributes.name.toString());
                      },
                  icon: Icon(
                    FontAwesomeIcons.tags,
                    color: Colors.grey,
                    size: 30,
                  )),
              SizedBox(
                width: 181.w,

              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const prudoctsDisplay()));
                  },
                  icon: Icon(
                    FontAwesomeIcons.houseChimneyUser,
                    color: Colors.grey,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 90.h,
        width: 60.w,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                icon = false;
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Stroes(),
                //     ));
              },
              splashColor: Colors.blue,
              child: const Center(
                child: Icon(
                  Icons.store_mall_directory_outlined,
                  size: 40,
                ),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      /*FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.blue,

        child: const Icon(Icons.house),*/
    );
  }
}
