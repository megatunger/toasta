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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: darkMode ? Colors.white : Colors.black),
                    child: Text('Title & Subtitle',
                        style: TextStyle(
                            color: darkMode ? Colors.black : Colors.white)),
                    onPressed: () {
                      toastTitleSubtitle(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: darkMode ? Colors.white : Colors.black),
                    child: Text('Without Fade In Subtitle',
                        style: TextStyle(
                            color: darkMode ? Colors.black : Colors.white)),
                    onPressed: () {
                      toastNoFadeIn(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: darkMode ? Colors.white : Colors.black),
                    child: Text('Custom Duration',
                        style: TextStyle(
                            color: darkMode ? Colors.black : Colors.white)),
                    onPressed: () {
                      toastCustomDuration(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2, primary: Colors.green),
                    child:
                        Text('Success', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      toastSuccess(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2, primary: Colors.red),
                    child:
                        Text('Failed', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      toastFailed(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2, primary: Colors.yellow),
                    child:
                        Text('Warning', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      toastWarning(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2, primary: Colors.blue),
                    child: Text('Info', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      toastInfo(context);
                    },
                  ),
                ),
              ),
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

  void toastTitleSubtitle(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }

  void toastNoFadeIn(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        darkMode: darkMode,
        fadeInSubtitle: false);
    Toasta(context).toast(toast);
  }

  void toastSuccess(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
        status: ToastStatus.success,
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }

  void toastFailed(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
        status: ToastStatus.failed,
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }

  void toastWarning(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
        status: ToastStatus.warning,
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }

  void toastInfo(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        subtitle:
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
        status: ToastStatus.info,
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }

  void toastCustomDuration(BuildContext context) {
    final toast = Toast(
        title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        duration: const Duration(seconds: 5),
        darkMode: darkMode);
    Toasta(context).toast(toast);
  }
}
