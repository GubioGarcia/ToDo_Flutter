import 'package:flutter/material.dart';

import 'home_page.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  static const IconData list_rounded = IconData(
    0xf85e,
    fontFamily: 'MaterialIcons',
    matchTextDirection: true,
  );

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    print("Inicalizou");
    navegar();
  }

  void navegar() {
    Future.delayed(Duration(seconds: 5), () {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo - Organize suas tarefas",
      color: Colors.deepPurple,
      navigatorKey: navigatorKey,

      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Splashpage.list_rounded, size: 150, color: Colors.white),
              Text(
                "My ToDo",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Container(height: 50),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
