import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuickPicksScreen extends StatefulWidget {
  const QuickPicksScreen({super.key});

  @override
  State<QuickPicksScreen> createState() => _QuickPicksScreenState();
}

List options = [  "Great",
  "Ok",
  "Poor",];
List <dynamic>spotTodayIcons = [  Icons.thumb_up_off_alt_outlined,Icons,'OK',Icons.thumb_down_off_alt_outlined
 ];
var selectiionIndex = 0;
var selectiionIndexForTodaySpot = 0;

class _QuickPicksScreenState extends State<QuickPicksScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left)),),
      body: Column(
        children: [
        Text('Quick Picks', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),) ,
        Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: Colors.black,),borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('is the a good spot today?',style: TextStyle(fontWeight: FontWeight.w800),),
                Center(
                  child: Wrap(
                    //alignment: WrapAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10.0,
                    //alignment: WrapAlignment.start,
                    runSpacing: 10,
                    //direction: Axis.horizontal,
                    //crossAxisAlignment: WrapCrossAlignment.end,
                    children: List<Widget>.generate(spotTodayIcons.length,
                          (int index) {
                        return ChoiceChip(
                          labelStyle: const TextStyle(
                            // color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                          selectedColor: Colors.green[50],
                          label: spotTodayIcons == Icons ? Icon(spotTodayIcons[index]) : Text(spotTodayIcons[index]),

                          showCheckmark: false,

                          // selectedShadowColor: Colors.cyan,
                          shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.black) ),
                          selected: selectiionIndexForTodaySpot == index,
                          //  iconTheme: IconThemeData(color: Colors.white) ,
                          // pressElevation: 50,
                          // labelPadding: EdgeInsets.only(left: 5),
                          //clipBehavior: Clip.hardEdge,

                          onSelected: (bool selected) {
                            setState(() {
                              selectiionIndexForTodaySpot = (selected ? index : null)!;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                Text('Spot Roting..',style: TextStyle(fontWeight: FontWeight.w800),),
                Center(
                  child: Wrap(
                    //alignment: WrapAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10.0,
                    //alignment: WrapAlignment.start,
                    runSpacing: 10,
                    //direction: Axis.horizontal,
                    //crossAxisAlignment: WrapCrossAlignment.end,
                    children: List<Widget>.generate(options.length,
                          (int index) {
                        return ChoiceChip(
                          labelStyle: const TextStyle(
                            // color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          //backgroundColor: Colors.cyan,
                          // tooltip: 'this is selected',
                          // avatar: Icon(Icons.add_call),
                          // padding: EdgeInsets.all(5),
                          selectedColor: Colors.green[50],
                          label: Text(options[index]),
                          // autofocus: false,
                          // elevation: 5,
                          //shadowColor: Colors.pinkAccent,
                          //checkmarkColor: Colors.white,
                          //surfaceTintColor: Colors.teal,
                          // disabledColor: Colors.limeAccent,
                          showCheckmark: false,

                          // selectedShadowColor: Colors.cyan,
                          shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.black) ),
                          selected: selectiionIndex == index,
                          //  iconTheme: IconThemeData(color: Colors.white) ,
                          // pressElevation: 50,
                          // labelPadding: EdgeInsets.only(left: 5),
                          //clipBehavior: Clip.hardEdge,

                          onSelected: (bool selected) {
                            setState(() {
                              selectiionIndex = (selected ? index : null)!;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],),
    );
  }
}
