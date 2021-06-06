import 'package:flutter/material.dart';
class Slots extends StatefulWidget {
  final List slots;

  const Slots({Key key, this.slots}) : super(key: key);
  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RESULTS'),),
      body: Container(
        padding:EdgeInsets.all(10) ,
        height:MediaQuery.of(context).size.height ,
        width :MediaQuery.of(context).size.height ,
        child:ListView.builder(
            itemCount: widget.slots.length,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal.shade200,
                ),
                padding:EdgeInsets.all(10) ,
                  margin: EdgeInsets.all(10),
                  height: 350,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Center ID - '+widget.slots[index]['center_id'].toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                    Divider(),
                    Text(
                      'Center Name - '+widget.slots[index]['name'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Text(
                      'Center Address - '+widget.slots[index]['address'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Text(
                      'Vaccine type - '+widget.slots[index]['vaccine'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),

                    Divider(),
                    Text(
                      'Minimum Age - '+widget.slots[index]['min_age_limit'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Text(
                      'Capacity Dose 1  - '+widget.slots[index]['available_capacity_dose1'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Text(
                      'Capacity Dose 2  - '+widget.slots[index]['available_capacity_dose2'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Text(
                      'Fee Type  - '+widget.slots[index]['fee_type'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }
        ) ,

      ),
    );
  }
}
