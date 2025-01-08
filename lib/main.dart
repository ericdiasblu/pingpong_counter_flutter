import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  int countBlue = 0;
  int countRed = 0;

  increment(String team) {
    setState(() {
      if (team == 'red') {
        countRed++;
      }
      if (team == 'blue') {
        countBlue++;
      }
    });
  }

  decrement(String team) {
    setState(() {
      if (team == 'red' && countRed > 0) {
        countRed--;
      }
      if (team == 'blue' && countBlue > 0) {
        countBlue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(children: [
            Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.redAccent,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$countRed',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => increment('red'),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => decrement('red'),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.blueAccent,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$countBlue',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            onPressed: () => increment('blue'),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => decrement('blue'),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logotipo.png'),
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
