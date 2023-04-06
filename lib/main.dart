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
      body: Column(
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
    );
  }
}



extension ExpandEqually on Iterable<Widget>{
  Iterable<Widget> expandEqually() => map((w) => Expanded(child: w));
}
