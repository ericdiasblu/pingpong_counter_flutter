import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pingpong_counter_flutter/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
                      child: Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TransparentButton(
                              onPressed: () => increment('red'),
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TransparentButton(
                              onPressed: () => decrement('red'),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
                      child: Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TransparentButton(
                              onPressed: () => increment('blue'),
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TransparentButton(
                              onPressed: () => decrement('blue'),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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

class TransparentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TransparentButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero),
      child: child,
    );
  }
}
