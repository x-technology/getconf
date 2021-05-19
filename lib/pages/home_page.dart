import 'package:flutter/material.dart';
import 'package:get_conf/style/theme.dart' as Style;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:get_conf/widgets/occasions_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Get Conf"),
        actions: [
          IconButton(
              icon: Icon(
                EvaIcons.searchOutline,
                color: Colors.white,
              ),
              onPressed: () {
                // showSearch(context: (context), delegate: MovieSearch());
              })
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          color: Style.Colors.white,
          child: Container(
            child: OccasionsCalendar(),
          ),
        ),
      ),
    );
  }
}
