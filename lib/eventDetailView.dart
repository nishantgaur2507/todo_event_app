import 'package:events_app_snapwork/localDb/database.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EventDetailView extends StatefulWidget {
  EventDetailView({Key key, this.year, this.month, this.day}) : super(key: key);
  final String year;
  final String month;
  final int day;


  @override
  _EventDetailViewState createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  String time = "${DateTime.now().hour}:${DateTime.now().minute}";
  TextEditingController todoTitle = new TextEditingController();
  TextEditingController todoDescription = new TextEditingController();
  StoreData storeData = StoreData();


  @override
  void initState() {
    super.initState();
    if(storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"] != null){
      todoDescription.text = storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"]["Description"];
      todoTitle.text = storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"]["title"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "EVENT DETAIL",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),backgroundColor: Colors.indigo,
            centerTitle: true,
            leading: TextButton(
              child: Text(
                "Back",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.all(15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "DateTime",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalDivider(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, spreadRadius: 3),
                      ],
                    ),
                    height: 40,
                    width: 80.0,
                    child: TextButton(
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              onConfirm: (date) {
                            setState(() {
                              time = "${date.hour}:${date.minute}";
                            });
                            print('confirm $date');
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          time,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "${widget.day}-${widget.month}-${widget.year}",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Title",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalDivider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: new TextFormField(
                        controller: todoTitle,
                        decoration: new InputDecoration(
                          fillColor: Colors.black,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "DateTime",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new TextFormField(
                    controller: todoDescription,
                    maxLines: 10,
                    minLines: 5,
                    decoration: new InputDecoration(
                      fillColor: Colors.black,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.indigo,
            child: TextButton(
                onPressed: () {
                  storeData.eventDetail(pwaVariable: {
                    "${widget.year}${widget.month}${widget.day}": {
                      "time": time,
                      "title": todoTitle.text,
                      "Description": todoDescription.text
                    }
                  });
                  Navigator.pop(context);
                  print(storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"]["time"]);
                  print(storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"]["title"]);
                  print(storeData.fetchEventDetail()["${widget.year}${widget.month}${widget.day}"]["Description"]);
                },
                child: Text(
                  "SAVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )),
          )),
    );
  }
}
