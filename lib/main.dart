import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class SliderData extends ChangeNotifier {
  double _value = 0.0;
  double get value => _value;
  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

final sliderData = SliderData();

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  const SliderInheritedNotifier(
      {Key? key, required SliderData sliderData, required Widget child})
      : super(key: key, notifier: sliderData, child: child);

   static double of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
    ?.notifier
    ?.value ??
    0.0;
   }   
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SliderInheritedNotifier(
        sliderData: sliderData,
        child: Column(
          children: [
            Slider(value: 0, onChanged: (value) {}),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.yellow,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
              ].expandEqually().toList(),
            )
          ],
        ),
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((w) => Expanded(child: w));
}
