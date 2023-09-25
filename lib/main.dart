import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novalabs/HomePage.dart';
import 'package:novalabs/Test.dart';
import 'package:novalabs/camera.dart';
import 'package:novalabs/home.dart';
import 'package:novalabs/presistant.dart';
import 'package:novalabs/profilw.dart';
import 'package:novalabs/signin.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'firebase_options.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novalabs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null) ? HomePage() : Signin(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: Profile(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                icon: Icon(
                  Icons.person_pin_circle_rounded,
                  size: 33,
                  color: Color.fromARGB(255, 241, 194, 125),
                )),
          )
        ],
        elevation: 0,

        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "N",
              style: GoogleFonts.aBeeZee(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Image.asset(
              "images/nova.png",
              height: 30,
              width: 30,
            ),
            Text("va",
                style: GoogleFonts.kanit(
                  textStyle: TextStyle(fontSize: 25),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "l",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "a",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "bs",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(150, 255, 219, 172),
                        Color.fromARGB(255, 255, 219, 172),
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "images/disease.png",
                                    width: 100,
                                    height: 100,
                                    scale: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Center(
                                    child: Container(
                                        width: 110,
                                        child: Text(
                                          "you need personalized skin check up?",
                                          style: GoogleFonts.aBeeZee(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Image.asset(
                                    "images/diseases2.png",
                                    width: 120,
                                    height: 120,
                                    scale: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                      width: 120,
                                      child: Text(
                                        "Are you travelling daily to clinic?",
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    "images/diseases3.png",
                                    width: 120,
                                    height: 120,
                                    scale: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Container(
                                      width: 110,
                                      child: Text(
                                        "Are you confused? Dont worry!",
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 190),
                      child: Container(
                        width: 340,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrangeAccent,
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 3.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 238, 75, 43),
                            Colors.redAccent.shade200
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          "images/solution.png",
                                          width: 120,
                                          height: 120,
                                          scale: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Container(
                                            width: 190,
                                            child: Text(
                                              "Dont worry! Click the booster appears down and take pic of skin spot to get personalized report!",
                                              style: GoogleFonts.aBeeZee(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              textAlign: TextAlign.center,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Novalabs ai powered ",
                                      style: GoogleFonts.alef(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                      )),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.rocket_launch_rounded,
                                      color: Color.fromARGB(255, 255, 219, 172),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 57.0),
                  child: Column(
                    children: [
                      Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(CircleBorder()),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white), // <-- Button color
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.white;
                              }),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TakePictureScreen(
                                            cameras: cameras,
                                          )));
                            },
                            child: Image.asset(
                              "images/solu.png",
                              width: 50,
                              height: 50,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Boost🔥",
                          style: GoogleFonts.stylish(
                            textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Highlights",
                          style: GoogleFonts.stylish(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          )),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(220, 255, 219, 172),
                      Color.fromARGB(220, 255, 219, 172),
                    ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "images/location.png",
                              width: 155,
                              height: 155,
                              scale: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Container(
                                  width: 200,
                                  child: Text(
                                    "Find novalabs nearest dermatologists and get speacialized Treatment with our product especially for cancers!",
                                    style: GoogleFonts.aBeeZee(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(150, 198, 134, 66),
                      Color.fromARGB(150, 198, 134, 66),
                    ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "images/iot.png",
                              width: 155,
                              height: 155,
                              scale: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Center(
                              child: Container(
                                  width: 200,
                                  child: Text(
                                    "Buy nova product to get specialized skin care!",
                                    style: GoogleFonts.aBeeZee(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed:(){
      //
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
