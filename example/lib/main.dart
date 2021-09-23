import 'package:flutter/material.dart';
import 'package:toasta/toasta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToastaContainer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              toastTitleSubtitle(context),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 1,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    child: Text(darkMode ? 'Light Mode' : 'Dark Mode',
                        style: TextStyle(
                            color: darkMode ? Colors.white : Colors.black)),
                    onPressed: () {
                      setState(() {
                        darkMode = !darkMode;
                      });
                    },
                  ),
                ),
              )
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget toastTitleSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 2, primary: darkMode ? Colors.white : Colors.black),
          child: Text('Title & Subtitle',
              style: TextStyle(color: darkMode ? Colors.black : Colors.white)),
          onPressed: () {
            final toast = Toast(
                title: "This is iPhone 13",
                subtitle: "Okay",
                darkMode: darkMode);
            Toasta(context).toast(toast);
          },
        ),
      ),
    );
  }
}
