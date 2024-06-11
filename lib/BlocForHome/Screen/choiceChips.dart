
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List<String> fruits = ['apple' , 'banana' , 'mango' , 'orange' ,
  'kivi' , 'papaya' ,'grapes' , 'blueberry'];

List<String> suggetion = <String>[];
List<String> toping = <String>[fruits.first];

class Chips_InputDemo extends StatefulWidget {
  const Chips_InputDemo({super.key});

  @override
  State<Chips_InputDemo> createState() => _Chips_InputDemoState();
}

class _Chips_InputDemoState extends State<Chips_InputDemo> {
  bool iselected = false;
  bool iselected1 = false;
  int? tag = 1;
  bool choiceSelect = false;
  int selectiionIndex = 1;
  int selectiionIndexforinput = 1;
  //int deletevalue = true;


  List<String> options = ['Opt', 'Optio', 'Option 3  Option 3 Option 3',
    'Option 4 Option 3', 'Option 5', 'Option 6' ,
    'Option 7', 'Option 8 Option 3', 'Option 9'];

  //final List<String> options;
  // MultiSelectChip(this.options);
  List<String> selectedChoices = [];
  //String selectedChoice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //primary: false,
      //backgroundColor: Colors.red,

      appBar: AppBar(title: Text('input chips demo'),),
      body: Column(
        children: [
          InputChip(
            label: Text('input chips'),
            avatar: Icon(Icons.remove),
            //avatarBorder: ShapeBorder(Shape),

          ),
          SizedBox(height: 20,),
          Text('filter chips widget'),
          FilterChip(
            avatar: CircleAvatar(child: Icon(Icons.circle_outlined, color: Colors.grey,)),
            selectedColor: Colors.tealAccent,

            label: Text('filterchips'),
            selected: iselected,
            tooltip: 'this is filter',


            onSelected: (bool value) {
              setState(() {
                iselected =!iselected;
              });
            },


          ),
          SizedBox(height: 20,),
          Text('Choice chips  widget'),
          ChoiceChip(
            label: Text('choice button'),
            selected: iselected1,

            avatar: CircleAvatar(child: Icon(Icons.account_balance)),
            onSelected: (value) {
              setState(() {
                iselected1 = value;
              });
            },

          ),
          ChoiceChip(label: Text('choicechips1 '), selected: false),
          ChoiceChip(label: Text('choicechips1 '), selected: true),
          ActionChip(label: Text('actionChips'),
            avatar: Icon(Icons.add_shopping_cart),
          ),
          SizedBox(height: 20,),
          Text('Choice chips  widget'),
          SizedBox(height: 20,),

          // Wrap(
          //   spacing: 5.0,
          //   children: List<Widget>.generate(
          //     5,
          //         (int index) {
          //       return ChoiceChip(
          //         label: Text('Item $index'),
          //         selected: _value == index,
          //         onSelected: (bool selected) {
          //           setState(() {
          //           _value = selected ? index : null;
          //           print(_value);
          //           //  _value = selected
          //           });
          //         },
          //       );
          //     },
          //   ).toList(),
          // ),



          ChoiceChip(
            label: Text('selectChoice'),
            selected: choiceSelect ,
            onSelected: (selected){
              return setState(() {
                choiceSelect = selected;
              });
            },),
          Text('Choice chips  single selection  widget'),

          Wrap(
            spacing: 10.0,
            //alignment: WrapAlignment.start,
            runSpacing: 10,
            //direction: Axis.horizontal,
            //crossAxisAlignment: WrapCrossAlignment.end,
            children: List<Widget>.generate(
              options.length,
                  (int index) {
                return ChoiceChip(
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
//backgroundColor: Colors.cyan,
                  tooltip: 'this is selected',
                  avatar: Icon(Icons.add_call),
                  //  padding: EdgeInsets.all(5),
                  selectedColor: Colors.orange,
                  label: Text(options[index]),
                  autofocus: false,
                  elevation: 5,
                  shadowColor: Colors.pinkAccent,
                  checkmarkColor: Colors.white,
                  surfaceTintColor: Colors.teal,
                  disabledColor: Colors.limeAccent,
                  showCheckmark: false,
                  selectedShadowColor: Colors.cyan,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.black87) , borderRadius: BorderRadius.circular(10)),
                  selected: selectiionIndex == index,
                  iconTheme: IconThemeData(color: Colors.white) ,
                  pressElevation: 50,
                  labelPadding: EdgeInsets.only(left: 5),
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
          Text('Choice chips  multiple selection  widget'),
          Wrap(
            spacing: 10.0,
            children: List<Widget>.generate(
              options.length,
                  (int index) {
                return ChoiceChip(
                  label: Text(options[index]),

                  selected:  selectedChoices.contains(options[index]),
                  onSelected: (selected) {
                    print('value of selected ${selected} and index is $index');
                    setState(() {
                      if(selected){
                        selectedChoices.add(options[index]);
                      }else{
                        selectedChoices.remove(options[index]);
                      }
                    });

                  },
                );
              },
            ).toList(),
          ),
          Text('input chips widget'),
          Wrap(
            spacing: 10.0,
            runSpacing: 10,
            children: List<Widget>.generate(
              fruits.length,
                  (int index) {
                return InputChip(
                  deleteIcon: Icon(Icons.delete),

                  selected: selectiionIndexforinput == index,
                  onSelected: (bool selected) {

                    setState(() {
                      print('$selected');

                      selectiionIndexforinput = (selected ? index : null)!;
                    });
                  },
                  onDeleted: (){
                    setState(() {
                      fruits.removeAt(index);
                    });
                  },
                  label: Text('${fruits[index]}'),
                );
              },
            ).toList(),
          ),





        ],
      ),
    );
  }
}
