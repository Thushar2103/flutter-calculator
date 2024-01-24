import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else if (btnText == '0') {
      if (result != '0') {
        result = result + btnText;
        finalResult = result;
      }
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    // Implementation of FilledButton is not provided, assuming it's a custom button.
    // Make sure you have it defined or replace it with a suitable button widget.
    return FilledButton(
      onPressed: () {
        calculation(btntxt);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        fixedSize: const MaterialStatePropertyAll(Size.fromRadius(42)),
        backgroundColor: MaterialStatePropertyAll(btncolor),
        padding: const MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
      ),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 25,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          text,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 90),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    'AC',
                    const Color.fromARGB(255, 99, 141, 255),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                  calcbutton(
                    '+/-',
                    const Color.fromARGB(255, 99, 141, 255),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                  calcbutton(
                    '%',
                    const Color.fromARGB(255, 99, 141, 255),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                  calcbutton(
                    '/',
                    const Color.fromARGB(255, 50, 87, 188),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    '7',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '8',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '9',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    'x',
                    const Color.fromARGB(255, 50, 87, 188),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    '4',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '5',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '6',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '-',
                    const Color.fromARGB(255, 50, 87, 188),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    '1',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '2',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '3',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '+',
                    const Color.fromARGB(255, 50, 87, 188),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    '0',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '00',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '.',
                    const Color.fromARGB(255, 145, 142, 142),
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  calcbutton(
                    '=',
                    const Color.fromARGB(255, 50, 87, 188),
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              const SizedBox(height: 10)
            ],
          )),
    );
  }
}

//Calculator logic
dynamic text = '0';
double numOne = 0;
double numTwo = 0;

dynamic result = '';
dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';

String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String doesContainDecimal(dynamic result) {
  if (result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if (!(int.parse(splitDecimal[1]) > 0)) {
      return result = splitDecimal[0].toString();
    }
  }
  return result;
}
