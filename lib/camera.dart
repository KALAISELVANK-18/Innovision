import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:novalabs/main.dart';
import 'package:novalabs/profilw.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final user = FirebaseAuth.instance.currentUser;

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  int post = 0;
  final Map<String, dynamic>? result;

  DisplayPictureScreen(
      {super.key, required this.imagePath, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Save report'))),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Color.fromARGB(255, 253, 229, 219),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          height: 100,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(imagePath),
                              ),
                            ),
                          ),
                          child: SizedBox()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(
                            "Explore the Top-3 results and choose most similar",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        Text(
                          "to your symptoms to get personal advice.",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        (result!['result'].length > 1)
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: result!["result"].length,
                                itemBuilder: (context, ind) {
                                  return (ind == 0)
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 20),
                                          child: Container(
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                                            // ),

                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.95,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Color.fromARGB(
                                                  255, 253, 229, 219),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child:
                                                      new CircularPercentIndicator(
                                                    radius: 35.0,
                                                    lineWidth: 5.0,
                                                    percent: double.parse(
                                                        result!["result"][ind]
                                                            [1]),
                                                    center: new Text(
                                                        "${double.parse(result!["result"][ind][1])}%"),
                                                    progressColor: Colors.green,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                            result!["result"]
                                                                [ind][0],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurpleAccent,
                                                                fontSize: 16),
                                                          )),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          //Text("No Pathologies",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        "Description",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                  size: 30,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18, top: 30),
                                              child:
                                                  new CircularPercentIndicator(
                                                radius: 25.0,
                                                lineWidth: 5.0,
                                                percent: double.parse(
                                                    result!["result"][ind][1]),
                                                center: new Text(
                                                    "${double.parse(result!["result"][ind][1])}%"),
                                                progressColor: Colors.green,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      width: 200,
                                                      child: Text(
                                                        result!["result"][ind]
                                                            [0],
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Benign Lesions",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  )
                                                ],
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.grey,
                                              size: 25,
                                            )
                                          ],
                                        );
                                })
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 200,
                                        child: Text(
                                          result!["result"][0],
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        )),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //Text("No Pathologies",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //Text("Description",style: TextStyle(color: Colors.deepOrangeAccent),)
                                  ],
                                ),
                              ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "New check",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Skivine does not diagnose. If in doubt,",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "seek the advice of a specialist doctor.",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "User Agreement",
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  )
                ],
              ),
            ),
            Container(
              width: 140,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  onPressed: () async {
                    if (post == 0) {
                      post = 1;
                      try {
                        final c = DateTime.timestamp();

                        final refe = FirebaseStorage.instance
                            .ref()
                            .child(FirebaseAuth.instance.currentUser!.uid)
                            .child(c.toString())
                            .child("tum");

                        await refe.putFile(File(imagePath),
                            SettableMetadata(contentType: "image/png"));

                        final downloadUrl1 = await FirebaseStorage.instance
                            .ref()
                            .child(FirebaseAuth.instance.currentUser!.uid)
                            .child(c.toString())
                            .child("tum")
                            .getDownloadURL();
                        final String url1 = downloadUrl1.toString();

                        await FirebaseFirestore.instance
                            .collection(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .doc("posts")
                            .collection("posts")
                            .add({
                          "time": DateTime.timestamp(),
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "title": result!["result"][0],
                          "picture_url": url1,
                        });
                        post = 2;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.greenAccent,
                            content: Text('Saved!'),
                          ),
                        );

                        Navigator.pop(context);
                        Navigator.pop(context);
                      } catch (error) {
                        post = 0;
                        print(post);
                        print(error);
                      }
                    }
                  },
                  child: Center(
                    child: Text("save",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.stylish(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class TakePictureScreen extends StatefulWidget {
  List<CameraDescription>? cameras;
  TakePictureScreen({super.key, required this.cameras});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen>
    with TickerProviderStateMixin {
  late CameraController _controller;
  late FutureOr<void> _initializeControllerFuture;
  late TabController tabController;
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController conpass = new TextEditingController();
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  void onTabChange() {
    setState(() {
      currentTabIndex = tabController.index;
    });
  }

  Map<String, dynamic> responsee = {};
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
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: (_controller.value.isInitialized)
                    ? Container(
                        child: Center(
                        child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: CameraPreview(_controller)),
                        ),
                      ))
                    : CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Click!"),

        // Provide an onPressed callback.
        onPressed: () async {
          //!email.text.isEmpty && !pass.text.isEmpty
          if (email.text.isEmpty && pass.text.isEmpty) {
            try {
              // Attempt to take a picture and get the file `image`
              // where it was saved.
              final image = await _controller.takePicture();
              var request;

              request = http.MultipartRequest(
                  'POST', Uri.parse('http://192.168.192.64:8000/upload'))
                ..files.add(
                    await http.MultipartFile.fromPath('image', image.path));

              var response = await request.send();

              if (response.statusCode == 200) {
                // Handle success

                Map<String, dynamic>? dataMap = (await response.stream
                    .transform(utf8.decoder)
                    .transform(json.decoder)
                    .first) as Map<String, dynamic>?;

                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                          imagePath: image.path, result: dataMap)),
                );

                // showDialog<String>(
                //   context: context,
                //   builder: (BuildContext context) => AlertDialog(
                //     title: Text('there is ${dataMap?["result"][0]}'),
                //
                //     actions: <Widget>[
                //       TextButton(
                //         onPressed: () => Navigator.pop(context, 'Cancel'),
                //         child: const Text('Cancel'),
                //       ),
                //       TextButton(
                //         onPressed: () => Navigator.pop(context, 'OK'),
                //         child: const Text('OK'),
                //       ),
                //     ],
                //   ),
                // );

              } else {
                // Handle error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.greenAccent,
                    content: Text('Failed to get result, try again!'),
                  ),
                );
              }
              // Ensure that the camera is initialized.

              if (!mounted) return;
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Issue in connecting cameras'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              ));
            }
          }
        },
        icon: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FutureOr<void> _showMyDialog(String targ, String val) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
