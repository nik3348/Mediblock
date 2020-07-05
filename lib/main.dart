import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediblock/transitions/ButtonPulse.dart';
import 'package:mediblock/transitions/FadeIn.dart';

void main() {
  //Makes sure that flutter engine and widget bindings are initialized!
  WidgetsFlutterBinding.ensureInitialized();

  //Changes the color of the overlay
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediblock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // Define the default font family.
        fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Mediblock'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.3),
            ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: FadeIn(
                  child: Text(
                    'MediBlocks',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: FadeIn(
                  child: Text(
                    'A blockchain application to store your medical records',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  delay: 1.05,
                ),
              ),
              Divider(
                height: 75,
              ),
              Center(
                heightFactor: 0,
                child: FadeIn(
                  child: ButtonPulse(
                    child: Icon(Icons.keyboard_arrow_up),
                    startRadius: 65,
                    finishRadius: 80,
                  ),
                  delay: 1.2,
                ),
              ),
              Divider(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
