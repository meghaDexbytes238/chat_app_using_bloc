import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
enum Timing {
  Today,
  Hourly,
  Daily,
}
class _HomeScreenState extends State<HomeScreen> {
  Timing timingView = Timing.Today;
  int selectedIndex = 0;
  List degreeNum = [74, 80, 78, 74, 80, 78];
  List weather = ['Morning', 'Afternoon','Evening','Morning', 'Afternoon','Evening'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 40,
          color: Colors.white,
          child: SearchBar(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
            leading: Icon(Icons.search_rounded, size: 30, weight: 5),
            backgroundColor: MaterialStatePropertyAll(
              Colors.white,
            ),
            side: MaterialStatePropertyAll(
                BorderSide(width: 2, color: Colors.black)),
          ),
        ),
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
      ),
      drawer: Drawer(
        width: 200,
      ),
      bottomSheet: Row(
        children: [
          bottomNavigationBarItem(title: 'Home'),
          bottomNavigationBarItem(title: 'Home'),
          bottomNavigationBarItem(
              title: 'Home',
              boxDecoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2, color: Colors.black, style: BorderStyle.solid)),
              icon: Icons.location_on,
              height: 80,
              mainaxisalign: MainAxisAlignment.center),
          bottomNavigationBarItem(title: 'Home'),
          bottomNavigationBarItem(title: 'Account'),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(right: 50, left: 50, top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textwidget(fontSz: 65, degree: '80°'),
                  // space(height: 20),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 120,
                      child: wirelessFrame(
                          horizontalPadding: 50,
                          verticalPadding: 50,
                          buttonName: "Forcost"),
                    ),
                  )
                ],
              ),
              space(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SegmentedButton<Timing>(
                    style: SegmentedButton.styleFrom(
                        selectedBackgroundColor: Colors.lightBlue.shade50,
                        shape: RoundedRectangleBorder()),
                    segments: [
                      ButtonSegment(value: Timing.Today, label: Text('Today')),
                      ButtonSegment(
                          value: Timing.Hourly, label: Text('Hourly')),
                      ButtonSegment(value: Timing.Daily, label: Text('Daily')),
                    ],
                    selected: <Timing>{timingView},
                    showSelectedIcon: false,
                    onSelectionChanged: (Set<Timing> value) {
                      setState(() {
                        timingView = value.first;
                      });
                    }),
              ),
              space(height: 10),
              Container(
                height: 130,
                //color: Colors.lightBlueAccent,
                alignment: Alignment.center,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  //   shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          textwidget(degree: '${weather[index]}',fontSz: 13),
                          textwidget(
                              fontSz: 40, degree: '${degreeNum[index]}°'),
                          svgimage(img: 'assets/image/cloud-svgrepo-com.svg'),
                        ],
                      ),
                    );
                  },
                  itemCount: degreeNum.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return VerticalDivider(color: Colors.black,thickness: 2,endIndent: 5,indent: 25,);
                    // return Container(
                    //   width: 2,
                    //   color: Colors.black,
                    //   margin: EdgeInsets.symmetric(vertical: 10),
                    // );
                  },
                ),
              ),
              space(),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return textwidget(
                      degree: 'Weather Data Information :  ##',
                      fontSz: 17,
                      fontWeight: FontWeight.w800);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(bottom: 5));
                },
                itemCount: 3,
              ),
              space(),
              Container(
                  height: 120,
                  margin: EdgeInsets.only(bottom: 100),
                  width: MediaQuery.of(context).size.width,
                  child: wirelessFrame(
                      buttonName: 'Weather Map', horizontalPadding: 80)),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBarItem(
      {required String title,
      BoxDecoration? boxDecoration,
      IconData? icon,
      double? height,
      MainAxisAlignment? mainaxisalign}) {
    return InkWell(
      onTap: () {
        print('selected');
      },
      child: Container(
        margin: EdgeInsets.all(2),
        height: height == null ? 65.0 : height,
        width: (MediaQuery.of(context).size.width / 5) - 4,
        alignment: Alignment.center,
        decoration: boxDecoration == null
            ? BoxDecoration(
                color: Colors.grey[350],
                shape: BoxShape.rectangle,
                border: Border.all(
                    width: 2, color: Colors.black, style: BorderStyle.solid)) : boxDecoration, child: Column(
          mainAxisAlignment:
              mainaxisalign == null ? MainAxisAlignment.start : mainaxisalign,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Text(
              '$title',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget textwidget({String? degree, double? fontSz, FontWeight? fontWeight}) {
    return Text(
      '$degree',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSz ?? 40),
    );
  }

  Widget svgimage({required String img}) {
    return SvgPicture.asset(
      img,
      width: 50,
      height: 50,
    );
  }

  Widget space({double? height}) {
    return SizedBox(
      height: height ?? 30,
    );
  }

  Widget wirelessFrame(
      {double? horizontalPadding,
      double? verticalPadding,
      String? buttonName}) {
    return Placeholder(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 50,
            vertical: verticalPadding ?? 45),
        child: MaterialButton(
          onPressed: () {},
          child: textwidget(
              degree: buttonName, fontSz: 12, fontWeight: FontWeight.bold),
          color: Colors.grey[50],
          // height: 30,
          //minWidth: 40,
          shape: RoundedRectangleBorder(),
        ),
      ),
    );

    //   Container(
    //   height: 120,
    //   margin: EdgeInsets.only(bottom: 100),
    //   width: MediaQuery.of(context).size.width,
    //
    // );
  }
}
