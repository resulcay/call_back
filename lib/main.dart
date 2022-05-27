import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cityInfo = "City 1";

  void changeCity(String newCity) {
    cityInfo = newCity;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CallBack Usage'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: LeftWidgetA(cityInfo: cityInfo)),
            Expanded(
                child: SingleChildScrollView(
              child: RightWidgetA(
                cityInfo: cityInfo,
                tempFunction: changeCity,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class LeftWidgetA extends StatelessWidget {
  final String? cityInfo;

  const LeftWidgetA({Key? key, this.cityInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            const Text(
              'Left Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "City: $cityInfo",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class RightWidgetA extends StatelessWidget {
  final String? cityInfo;
  final Function? tempFunction;
  const RightWidgetA({Key? key, this.cityInfo, this.tempFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      color: Colors.green,
      child: Column(children: [
        const Text(
          'Right Widget A',
          style: TextStyle(fontSize: 20),
        ),
        RightWidgetB(
          cityInfo: cityInfo,
          tempFunction: tempFunction,
        )
      ]),
    );
  }
}

class RightWidgetB extends StatelessWidget {
  final String? cityInfo;
  final Function? tempFunction;
  const RightWidgetB({Key? key, this.cityInfo, this.tempFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        const Text(
          'Right Widget B',
          style: TextStyle(fontSize: 20),
        ),
        RightWidgetC(
          cityInfo: cityInfo,
          tempFunction: tempFunction,
        )
      ]),
    );
  }
}

class RightWidgetC extends StatelessWidget {
  final String? cityInfo;
  final Function? tempFunction;
  const RightWidgetC({Key? key, this.cityInfo, this.tempFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(
        children: [
          const Text(
            'Right Widget C',
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            'City:',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            onChanged: (response) {
              tempFunction!(response);
            },
          )
        ],
      ),
    );
  }
}
