import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Glow test',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Glow test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  //for the flutter_glow dependency
  bool checkboxSelected = false;
  bool switchSelected = false;
  bool radioSelected = false;
  bool iconSelected = false;

  //customized glow with animation
  late AnimationController _animationController;
  late Animation _animation;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 20.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // GlowButton(
            //   onPressed: _incrementCounter,
            //   color: Colors.amberAccent,
            //   child: const Icon(Icons.add),
            // ),
            // const SizedBox(height: 32),
            // GlowCheckbox(
            //   value: checkboxSelected,
            //   enable: true,
            //   color: Colors.amberAccent,
            //   onChange: (bool value) {
            //     setState(() {
            //       checkboxSelected = !checkboxSelected;
            //     });
            //   },
            // ),
            // const SizedBox(height: 32),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       iconSelected = !iconSelected;
            //     });
            //   },
            //   child: GlowIcon(
            //     iconSelected ? Icons.wb_cloudy : Icons.cloud_queue,
            //     color: Colors.amberAccent,
            //     glowColor:
            //         iconSelected ? Colors.amberAccent : Colors.transparent,
            //     size: 64,
            //     blurRadius: 9,
            //   ),
            // ),
            // const SizedBox(height: 32),
            // const GlowText(
            //   'Glow Text',
            //   style: TextStyle(fontSize: 40, color: Colors.amberAccent),
            // ),
            // const SizedBox(height: 32),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     GlowRadio<bool>(
            //       value: true,
            //       groupValue: radioSelected,
            //       color: Colors.amberAccent,
            //       onChange: (value) {
            //         setState(() {
            //           radioSelected = value;
            //           log(value.toString());
            //         });
            //       },
            //     ),
            //     const SizedBox(width: 32),
            //     GlowRadio<bool>(
            //       value: false,
            //       color: Colors.amberAccent,
            //       groupValue: radioSelected,
            //       onChange: (value) {
            //         setState(() {
            //           radioSelected = value;
            //           log(value.toString());
            //         });
            //       },
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 32),
            // GlowSwitch(
            //   onChanged: (value) {
            //     setState(() {
            //       switchSelected = value;
            //     });
            //   },
            //   value: switchSelected,
            //   activeColor: Colors.amberAccent.withOpacity(0.6),
            //   blurRadius: 4,
            // ),
            // const SizedBox(height: 32),
            // const GlowLineProgress(
            //   blurRadius: 12,
            //   glowColor: Colors.amberAccent,
            // ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(shape: BoxShape.circle,
                  // color: Color.fromARGB(0, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(130, 75, 211, 232),
                        blurRadius: _animation.value,
                        spreadRadius: _animation.value)
                  ]),
              child: const Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
