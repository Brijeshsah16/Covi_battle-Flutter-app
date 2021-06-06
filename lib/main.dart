import 'dart:convert';
import 'dart:ui';
import 'package:covi_battle/slot.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'slot.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:  Colors.teal,
      ),
      home:Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pincodeController=TextEditingController();
  TextEditingController dayController=TextEditingController();
  String dropdownValue = '01';
  List slots=[];
 fetchslots() async{
         await http.get(Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode='+pincodeController.text +'&date='+dayController.text+'-'+dropdownValue+'-2021')).then((value){
           Map result=jsonDecode(value.body);
           setState(() {
             slots=result['sessions'];
           });
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Slots(slots:slots)));
         });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title :Text('COVI VACCINATOR APP')
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.all(10) ,
          height:MediaQuery.of(context).size.height ,
          width :MediaQuery.of(context).size.height ,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                child: Image.asset('assests/coid_battleimage.jpg'),
              ),
              TextField(
                       controller: pincodeController,
                       decoration: InputDecoration(hintText:'ENTER PINCODE'),
                       keyboardType: TextInputType.number,
                       maxLength: 6,
              ),
            Row(
              children: [
                Expanded(child: Container(
                  height: 60,
                  child: TextField(
                    controller: dayController,
                    decoration: InputDecoration(hintText:'ENTER DAY'),
                  ),
                ),
                ),
               SizedBox(width: 10,),
               Expanded(child: Container(
                 height: 54,
                 child: DropdownButton<String>(
                          isExpanded: true ,
                           value: dropdownValue,
                           icon: const Icon(Icons.arrow_drop_down_circle_sharp,color: Colors.teal,),
                            iconSize: 24,
                           elevation: 16,
                           style: const TextStyle(color: Colors.teal),
                             underline: Container(
                           height: 2,
                           color: Colors.teal,
                        ),
                          onChanged: (String newValue) {
                        setState(() {
                       dropdownValue = newValue;
                         });
                       },
                  items: <String>[ '01',
                    '02',
                    '03',
                    '04',
                    '05',
                    '06',
                    '07',
                    '08',
                    '09',
                    '10',
                    '11',
                    '12',

                  ].map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(
                    value: value,
                     child: Text(value),
                   );
                 }).toList(),
             ),
               ))
              ],
            ),
             SizedBox(height:20),
             Container(
               width: double.infinity,
              height: 45,
              child:ElevatedButton(
                child: Text('find the slots'),
                onPressed: (){  fetchslots();      },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                ),
              ),
             )
            ],),
        ),
      ),
    );
  }
}
