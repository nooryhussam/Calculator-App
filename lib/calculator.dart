import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0";
  String value1 = "";
  String operator = "";

  void onNumber(String n) {
    setState(() {
      if (display == "0") {
        display = n;
      } else {
        display += n;
      }
    });
  }

  void onOperator(String op) {
    setState(() {
      value1 = display;
      operator = op;
      display = "0";
    });
  }

  void onEqual() {
    double a = double.parse(value1);
    double b = double.parse(display);
    double result = 0;

    switch (operator) {
      case "+":
        result = a + b;
        break;
      case "-":
        result = a - b;
        break;
      case "x":
        result = a * b;
        break;
      case "/":
        result = a / b;
        break;
    }

    setState(() {
      display = result.toString();
    });
  }

  void onClear() {
    setState(() {
      display = "0";
      value1 = "";
      operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: 600,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(
            width: 10,
            color: const Color.fromARGB(255, 248, 137, 183),
          ),
          color: const Color.fromARGB(255, 255, 198, 222),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Text(
                display,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(color: const Color.fromARGB(255, 155, 148, 148)),
            ButtonCustomized(
              text1: '7',
              text2: '8',
              text3: '9',
              text4: '+',
              onPress1: () => onNumber('7'),
              onPress2: () => onNumber('8'),
              onPress3: () => onNumber('9'),
              onPress4: () => onOperator('+'),
            ),
            const SizedBox(height: 20),
            ButtonCustomized(
              text1: '4',
              text2: '5',
              text3: '6',
              text4: '/',
              onPress1: () => onNumber('4'),
              onPress2: () => onNumber('5'),
              onPress3: () => onNumber('6'),
              onPress4: () => onOperator('/'),
            ),
            const SizedBox(height: 20),
            ButtonCustomized(
              text1: '1',
              text2: '2',
              text3: '3',
              text4: '-',
              onPress1: () => onNumber('1'),
              onPress2: () => onNumber('2'),
              onPress3: () => onNumber('3'),
              onPress4: () => onOperator('-'),
            ),
            const SizedBox(height: 20),
            ButtonCustomized(
              text1: '0',
              text2: '=',
              text3: 'C',
              text4: 'x',
              onPress1: () => onNumber('0'),
              onPress2: () => onEqual(),
              onPress3: () => onClear(),
              onPress4: () => onOperator('x'),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCustomized extends StatelessWidget {
  const ButtonCustomized({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.onPress1,
    required this.onPress2,
    required this.onPress3,
    required this.onPress4,
  });

  final String text1;
  final String text2;
  final String text3;
  final String text4;

  final VoidCallback onPress1;
  final VoidCallback onPress2;
  final VoidCallback onPress3;
  final VoidCallback onPress4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildButton(text1, onPress1),
        buildButton(text2, onPress2),
        buildButton(text3, onPress3),
        buildButton(text4, onPress4),
      ],
    );
  }

  Widget buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 234, 117, 169),
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
