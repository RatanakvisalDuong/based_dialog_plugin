import 'package:base_dialog_plugin/base_dialog_plugin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Plugin Example App', home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _baseDialogPlugin = BaseDialogPlugin();
  DialogStyling dialogStyling = DialogStyling(
    title: 'Hello',
    message: 'This is a native dialog',
    buttonText: 'OK',
    titleColor: Colors.black,
    messageColor: Colors.black,
    buttonColor: Colors.blue,
    function: () {},
    backgroundColor: Colors.white,
  );
  String cancel = "Cancel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin Example App')),
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                _baseDialogPlugin.alertDialogBasedOnPlatform(
                  context,
                  title: dialogStyling.title,
                  message: dialogStyling.message,
                  buttonText: dialogStyling.buttonText,
                  titleColor: dialogStyling.titleColor,
                  messageColor: dialogStyling.messageColor,
                  buttonColor: dialogStyling.buttonColor,
                  function: dialogStyling.function,
                  backgroundColor: dialogStyling.backgroundColor,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Show Native Dialog Alert",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: InkWell(
              onTap: () {
                _baseDialogPlugin.actionDialogBasedOnPlatform(
                  context,
                  title: dialogStyling.title,
                  message: dialogStyling.message,
                  buttonTextLeft: cancel,
                  buttonTextRight: dialogStyling.buttonText,
                  titleColor: dialogStyling.titleColor,
                  messageColor: dialogStyling.messageColor,
                  buttonColorLeft: dialogStyling.buttonColor,
                  buttonColorRight: dialogStyling.buttonColor,
                  leftFunction: dialogStyling.function,
                  rightFunction: dialogStyling.function,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Show Native Dialog Action",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
