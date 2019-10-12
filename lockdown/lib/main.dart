import 'package:flutter/material.dart';
//import 'package:sms_retriever/sms_retriever.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sms_retriever/sms_retriever.dart';
void main() => runApp(MyApp()){

};

class MyApp extends StatelessWidget {
  // //This widget is the root of your application.
  @override
  _My//AppState createState() =>_MyAppstate();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOCKDOWN',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'LOCKDOWN'),
    );
  }
}

lass _MyAppState extends State<MyApp> {
String _smsCode = "";
bool isListening = false;

getCode(String sms) {
  if (sms != null) {
    final intRegex = RegExp(r'\d+', multiLine: true);
    final code = intRegex.allMatches(sms).first.group(0);
    return code;
  }
  return "NO SMS";
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

  String _smsCode = "";

  getCode(String sms) {
      if (sms != null) {
        final intRegex = RegExp(r'\d+', multiLine: true);
        final code = intRegex.allMatches(sms).first.group(0);
        return code;
    }
      return "NO SMS";
  }

  Future<String> listenSms() async
  {
      //String smsCode = await SmsRetriever.startListening();
      //_smsCode = getCode(smsCode);
      //return _smsCode;
  }

  void lock()
  {
      Future<String> sms = listenSms();
      if(sms == "0000")
          Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => RestrictedAccess()));
  }

  String correctPassword = "9024";
  //No database present yet so temporary password is 9024

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
              child: FadeAnimatedTextKit(
                duration: Duration(milliseconds: 5000),
                text: ["Log in", "LOCKDOWN"],
                alignment: Alignment.center,
                textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

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
          color: Colors.lightGreen[900],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.green,
              child: RotateAnimatedTextKit(
                duration: Duration(milliseconds: 10000),
                text: ["INITIATE LOCKDOWN", "RESTRICT ACCESS", "START LOCKDOWN"],
                alignment: Alignment.center,
                textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
              ),
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

  Future<bool> _onbackpressed(){
    return  showDialog(
        context: null,
        builder: (context)=>AlertDialog(
          title: Text("You cant go back"),
          actions: <Widget>[FlatButton(child: Text("go back"),
          onPressed: ()=>Navigator.pop(context,false),
          )
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: _onbackpressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
      backgroundColor : Colors.white,
      body: Center(
        child: Column(

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
              width: 500,
              alignment: Alignment.center,
              child: ColorizeAnimatedTextKit(
                text: [
                  "Your device is under lockdown",
                  "Your access is restricted",
                  "Enter password to continue",
                ],alignment: Alignment.center,
                textStyle: TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Horizon"
                ),
                colors: [
                  Colors.white,
                  Colors.green[50],
                  Colors.green[100],
                  Colors.green[200],
                ],
              ),
            ),

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
          Slider(

          )
          ],
        ),
      ),
    )

    );
  }
}