import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: App,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/image/chat.png',
              width: 35,
              height: 35,
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              weight: 50,
              opticalSize: 30,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
                Expanded(
                  child: Container(
                    //     width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                // ClipPath(
                //   clipper: MessageClipper(),
                //   child: Container(
                //     height: 40,
                //     width: MediaQuery.of(context).size.width,
                //     color: Colors.purple,
                //   ),),
              ],
            ),
            /*Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(35.0)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ClipPath(
                    clipper: MessageClipper(),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            )*/
          ],
        ),
      ),
    );
  }
}

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstOffset = Offset(size.width * 0.10, 0.0);
    var secondPoint = Offset(size.width * 0.20, size.height);
    var lastPoint = Offset(size.width * 0.20, 0.0);
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();
    return path;
  }

  // Path getClip(Size size) {
  //   var firstOffset = Offset(size.width * 0.1, 1.0);
  //   var secondPoint = Offset(size.width * 0.15, size.height );
  //   var lastPoint = Offset(size.width * 0.2, 1.0);
  //   var path = Path()
  //     ..moveTo(firstOffset.dx, firstOffset.dy)
  //     ..lineTo(secondPoint.dx, secondPoint.dy)
  //     ..lineTo(lastPoint.dx, lastPoint.dy)
  //     ..close();
  //   return path;
  // }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
