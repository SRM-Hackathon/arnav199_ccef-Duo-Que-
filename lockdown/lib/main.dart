import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOCKDOWN',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'LOCKDOWN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController passwordin = TextEditingController();
  TextEditingController usernamein = TextEditingController();
  var correctPassword = "9024";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.tealAccent[400],
                shape: BoxShape.rectangle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.lightGreen, Colors.green]
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: usernamein,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    decoration:
                    InputDecoration(labelText: 'Username')),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.tealAccent[400],
                shape: BoxShape.rectangle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Colors.lightGreen, Colors.green])
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordin,
                    keyboardType: TextInputType.visiblePassword,

                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    obscureText: true,
                    decoration:
                    InputDecoration(labelText: 'Password')),
              ),
            ),
            FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.green,
              onPressed: ()
              {
                if(passwordin.text == correctPassword && usernamein.text != "")
                  Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => SecondRoute()),);
                else print("Please check your username or password");
              },
              child: Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RestrictedAccess()));
          },
          child: Text('INITIATE LOCKDOWN'),
        ),
      ),
    );
  }
}
*/
class SecondRoute extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    //String smsCode = await SmsRetriever.startListening();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
          color: Colors.lightGreen,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.green,
              child: Text('INITIATE LOCKDOWN'),
              onPressed: ()
              {
                Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => RestrictedAccess()));
              }
                  ),

            FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.green,
              onPressed: (){
                Navigator.pop(context

                );
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}

class RestrictedAccess extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: null,
      child: Scaffold(
      backgroundColor : Colors.white,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.tealAccent[400],
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.lightGreen, Colors.green]
                  )
              ),
              width: 300,
              alignment: Alignment.center,
              child: Text("Your device is under lockdown",
                  style: TextStyle(fontSize: 15, color: Colors.white))),
            FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.green,
              onPressed: (){
                Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => SecondRoute()),

                );
              },
              child: Text('Deactivate'),
            ),
          ],
        ),
      ),
    )
    );
  }
}