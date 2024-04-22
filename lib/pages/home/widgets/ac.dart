import 'package:flutter/material.dart';
import 'package:iot_ui_challenge/utils/string_to_color.dart';

class MyWidget extends StatefulWidget {
 final String value;
  final String color;
  const MyWidget({Key? key, required this.value, required this.color}) : super(key: key);
    
  @override
  _MyWidgetState createState() => _MyWidgetState();
  
}

class _MyWidgetState extends State<MyWidget> {
  
String? dropval; // Change type to String?
  List<String> drplist = ["Start", "End"];
  String time = '00:00:00';
  bool showcontainer=false;
  void updateTime(String selectedValue) {
    setState(() {
      if (selectedValue == 'Start') {
          time = 'Start Time'; // You can replace getCurrentTime() with your logic to get start time
      } else if (selectedValue == 'End') {
        time = 'End Time'; // You can replace getCurrentTime() with your logic to get end time
      }
    });
  }
  late String _receivedValue;
  late String _receivedcolor;

  @override
  void initState() {
    super.initState();
    _receivedValue = widget.value;
    _receivedcolor=widget.color;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: _receivedcolor.toColor(),
      ),
      body: SizedBox(
         height: height,
          width: width,
          child: SingleChildScrollView(
            child: Container(
              color: _receivedcolor.toColor(),
              child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:  _receivedcolor.toColor()
                ),
                height: height * 0.17,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        '$_receivedValue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                margin: EdgeInsets.only(left: 7.0),
                height: height * 0.75,
                width: width,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        'Power Consumption : 21',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(

                     // padding: EdgeInsets.only(left: 50,right: 50),
                     margin: EdgeInsets.only(top:60),
                      width: 300.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color:  _receivedcolor.toColor()
                                                
                      ),
                      
                      child: DropdownButton(
                        itemHeight: 50.00,
                        hint: Text('Schedule',style: TextStyle(fontWeight: FontWeight.bold),),
                        dropdownColor: _receivedcolor.toColor(),
                        iconSize: 40,
                        isExpanded: true,
                        value: dropval,
                        alignment: Alignment.center,
                        items: drplist.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value,style: TextStyle(fontWeight: FontWeight.bold),),
                            alignment: Alignment.center,
                          );
                        }).toList(),
                        onChanged: (newdrpval) {
                          setState(() {
                            dropval = newdrpval.toString();
                            if(dropval=='Start'||dropval=='End'){
                              showcontainer=true;
                            }else{
                              showcontainer=false;
                            }
                            updateTime(dropval!);
                          });
                        },
                      ),
                    ),
                    Visibility(
                      visible:showcontainer ,
                      child:Container(
                      padding: EdgeInsets.only(top:30,bottom: 30,right: 50,left: 50),
                      margin: EdgeInsets.only(top:50),
                      decoration: BoxDecoration(
                        color:  _receivedcolor.toColor(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(children: [
                        Text('$time',style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),),
                        Container(
                          width: 170,
                          child:  TextField(
                        
                          decoration:  InputDecoration(hintText: "00:00:00",hintStyle: TextStyle(
                            fontSize: 20,
                          ), contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 40,)),
                          
                        )
                        ),
                        // Text('End Time : 00:00:00',style: TextStyle(
                        //   fontWeight: FontWeight.normal,
                        //   fontSize: 25,
                        // ),),
                        Container(
                          margin: EdgeInsets.only(top:20),
                          child: TextButton(
                          onPressed:(){} ,
                         child: Text("Done",style:TextStyle(color: Colors.white
                         ),),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.only(right: 25,left: 25),
                            alignment: Alignment(0, 0)
                            
                          ),
                         ),
                        )
                      ],),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
            )
          ),
      ),
    );
  }
}
