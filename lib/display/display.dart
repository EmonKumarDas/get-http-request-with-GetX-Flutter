import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_covidapi/controller/controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Covidpage extends StatefulWidget {
  const Covidpage({Key key}) : super(key: key);

  @override
  _CovidpageState createState() => _CovidpageState();
}

class _CovidpageState extends State<Covidpage> {
  Widget heading() {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/v05h14-removebg-preview.png",
              height: 70,
            ),
            Text(
              "COVID19",
              style: GoogleFonts.bebasNeue(
                  shadows: [
                    BoxShadow(color: Colors.grey, offset: Offset(2, 2))
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xFFEB9D9D)),
            ),
          ],
        ),
      ),
    );
  }

  Widget Cards({image, country, todaycases}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                    left: 30,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(1, 0),
                            color: Colors.grey)
                      ]),
                      child: Image.network(
                        image,
                        height: 50,
                        width: 50,
                      ),
                    )),
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 100),
                child: Column(
                  children: [
                    Text(
                      country,
                      style: GoogleFonts.bebasNeue(),
                    ),
                    Text(
                      todaycases,
                      style: GoogleFonts.bebasNeue(),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  final CovidProvider CP = Get.put(CovidProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          heading(),
          Expanded(
            child: Container(child: Obx(() {
              return ListView.builder(
                  itemCount: CP.datalist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cards(
                        image: CP.datalist[index].countryInfo.flag,
                        country: CP.datalist[index].country.toString(),
                        todaycases: CP.datalist[index].todayCases.toString());
                  });
            })),
          )
        ],
      ),
    );
  }
}
