import 'package:flutter/material.dart';

import 'calc.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مثال الحاسبة',
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "السلام عليكم",
              style: TextStyle(fontSize: 50, color: Colors.greenAccent),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalcScreen(),
                    ),
                  );
                },
                child: const Text("دخول", style: TextStyle(fontSize: 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
