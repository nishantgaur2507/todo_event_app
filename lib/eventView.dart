import 'package:flutter/material.dart';

import 'constants/constantYear.dart';
import 'eventDetailView.dart';
import 'localDb/database.dart';

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  String year = DateTime.now().year.toString();
  int month = DateTime.now().month-1;
  StoreData storeData = StoreData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "EVENTS",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            FittedBox(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    width: 120.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors.indigo)),
                      onPressed: () {
                        _yearlistView(context);
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text(year.toUpperCase(),
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    width: 120.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors.indigo)),
                      onPressed: () {
                        _monthlistView(context);
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text(monthList[month],
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(padding: EdgeInsets.all(10.0)),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                  shrinkWrap: true,
                  itemCount: DateTime(int.parse(year), month + 1, 0).day,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () async {
                        final result = await
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventDetailView(
                                    year: year,
                                    month: monthList[month],
                                    day: index + 1,
                                  )),
                        ).whenComplete(() => {
                          setState(()=>{
                            print("test")
                          }),
                          print("nishant test ${index+1}")
                        });
                      },
                      leading: listTileLeading(index),
                      title: Text(storeData.fetchEventDetail()[
                                  "${year}${monthList[month]}${index+1}"] ==
                              null
                          ? ""
                          : "${index+1}-${monthList[month]}-${year} : ${storeData.fetchEventDetail()[
                      "${year}${monthList[month]}${index+1}"]["time"]}\n${storeData.fetchEventDetail()[
                      "${year}${monthList[month]}${index+1}"]["title"]}"),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }

  Widget listTileLeading(int index) {
    return SizedBox(
      width: 90.0,
      // height: 150.0,
      child: Row(
        children: [
          Text(
            "${index + 1}\n${monthList[month]}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  void _yearlistView(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        // backgroundColor: Colors.,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                shrinkWrap: true,
                itemCount: yearsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      print(yearsList[index]);
                      Navigator.pop(context);
                      setState(() {
                        year = yearsList[index];
                      });
                    },
                    title: Text(
                      "${yearsList[index]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          );
        });
  }

  void _monthlistView(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                shrinkWrap: true,
                itemCount: monthList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      // print(monthList[index]);
                      Navigator.pop(context);
                      setState(() {
                        month = index;
                        print(monthList[index]);
                        print(index+1);
                      });
                    },
                    title: Text(
                      "${monthList[index]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          );
        });
  }
}
