import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final TextEditingController firstNumberTFController = TextEditingController();
  final TextEditingController secondNumberTFController =
      TextEditingController();
  int _operationValue = 0;
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                "الحاسبة",
                style: TextStyle(fontSize: 50, color: Colors.greenAccent),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            controller: firstNumberTFController,
                          ),
                        ),
                        const Expanded(flex: 3, child: Text("الرقم الاول"))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            controller: secondNumberTFController,
                          ),
                        ),
                        const Expanded(flex: 3, child: Text("الرقم الاول"))
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              const Text(
                "الرجاء اختيار العملية الحسابية",
                style: TextStyle(fontSize: 50, color: Colors.greenAccent),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: _operationValue,
                        onChanged: (int? value) {
                          setState(() {
                            _operationValue = value!;
                          });
                        },
                      ),
                      const Text("جمع"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: _operationValue,
                        onChanged: (int? value) {
                          setState(() {
                            _operationValue = value!;
                          });
                        },
                      ),
                      const Text("طرح"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 2,
                        groupValue: _operationValue,
                        onChanged: (int? value) {
                          setState(() {
                            _operationValue = value!;
                          });
                        },
                      ),
                      const Text("ضرب"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 3,
                        groupValue: _operationValue,
                        onChanged: (int? value) {
                          setState(() {
                            _operationValue = value!;
                          });
                        },
                      ),
                      const Text("قسمة"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () async {
                    String apiOperation = _operationValue == 0
                        ? "add"
                        : _operationValue == 1
                            ? "sub"
                            : _operationValue == 2
                                ? "mul"
                                : "div";
                    final http.Response response = await http.get(
                        Uri.parse(
                            'http://0.0.0.0:3000/api/$apiOperation?fnumber=${firstNumberTFController.text}&snumber=${secondNumberTFController.text}'),
                        headers: {
                          "Accept": "application/json",
                          "Access-Control_Allow_Origin": "*"
                        });
                    setState(() {
                      result = double.parse(response.body);
                    });
                  },
                  child: const Text("احسب", style: TextStyle(fontSize: 50)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$result",
                    style: const TextStyle(
                        fontSize: 50, color: Colors.greenAccent),
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                  ),
                  const Text(
                    "النتيجة",
                    style: TextStyle(fontSize: 50, color: Colors.greenAccent),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
