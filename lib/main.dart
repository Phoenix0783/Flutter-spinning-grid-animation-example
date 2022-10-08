import 'package:flutter/material.dart';
import './widgets/note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}





















class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  double maxCrossAxisEnt = 200;
  final List<Map> myProducts =
      List.generate(50, (index) => {"id": index, "name": "Note $index"})
          .toList();

  void changeGridTo2() {
    setState(() {
      maxCrossAxisEnt = 200;
    });
  }

  void changeGridTo3() {
    setState(() {
      maxCrossAxisEnt = 140;
    });
  }

  void changeGridTo4() {
    setState(() {
      maxCrossAxisEnt = 100;
    });
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.repeat(reverse: false);
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Rotation Transition Animation",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      maxCrossAxisEnt, // triple grid 140 // 200 double grid // 120 four grid
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return RotationTransition(
                  turns: turnsTween.animate(_controller),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //     borderRadius: BorderRadius.circular(15)),
                    child: Note(myProducts[index]["name"]),
                  ),
                );
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: changeGridTo2,
                        child: const Text('2 Grid'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: changeGridTo3,
                          child: const Text('3 Grid')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: changeGridTo4,
                          child: const Text('4 Grid')),
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
