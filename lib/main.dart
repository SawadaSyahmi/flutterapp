import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primaryColor: const Color(0xff075E54),
      ),
      home: const HomePage(), //only when we start the app the thing that changing
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  Color _color = Colors.green;
  double _size = 50.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme();
  }


  Scaffold ScaffoldTheme() {  //reused this scaffold class set of theme asset 
    return Scaffold(
    appBar: AppBar(
      elevation: 0.7,
      actions: const <Widget>[
        Icon(Icons.search),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0),
        ),
        Icon(Icons.more_vert),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
      ],
      title: const Text(
        "WhatsApp",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      bottom: TabBar(
        indicatorColor: Colors.white,
        controller: tabController,
        tabs: <Widget>[
          Container(
            width: 30.0,
            child: const Tab(
              icon: Icon(Icons.camera_alt), //default image that you can use 
            ),
          ),
          const Tab(
            child: Text("CHATS",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Tab(
              child: Text(
            "STATUS",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const Tab(
            child: Text(
              "CALLS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),


    body: TabBarView( // page page will change corespond to the selected tab
      controller: tabController,
      children:  <Widget>[
        Center(child: Text("Camera",style: TextStyle(color:_color,fontSize: _size),),),
        Center(child: Text("Chats",style: TextStyle(color:_color,fontSize: _size),),),
        Center(child: Text("Status",style: TextStyle(color:_color,fontSize: _size),),),
        Center(child: Text("Calls",style: TextStyle(color:_color,fontSize: _size),),),],

       
    ),

    floatingActionButton: Row( //floating action button
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton.extended(
          onPressed: () {
            setState(() {
            _color = Colors.red;
            } );
          },
          label: Text('Red'),
          backgroundColor: Colors.red,

          ),
         FloatingActionButton.extended(
          onPressed: () {
            setState(() {
            _color = Colors.green;
            });
          },
          label: Text('Green'),
          backgroundColor: Colors.green,
          ),
      ], 
    ),

    
    bottomSheet: SizedBox(
      height: 100.0,
      child: Slider(
        value: _size,
        min: 10.0,
        max: 100.0,
        onChanged: (value) => setState(() => _size = value),
      ),
    ),

    );

  }
}