import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController people = TextEditingController();
  final TextEditingController amount = TextEditingController();
  double perAmount =  0;
  void calMoney(){
    perAmount = int.parse(amount.text) / int.parse(people.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Split Money'))),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: people,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    icon: Icon(Icons.people),
                    labelText: 'No Of People',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                  ),
                  icon: Icon(Icons.attach_money),
                  labelText: 'Total Amount',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: ElevatedButton(
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 50))
                ),
                onPressed: (){
                  setState(() {
                    calMoney();
                  });
                }, 
                child: const Text('Calculate', style: TextStyle(fontSize: 15),)),
            ),
            DottedBorder(
              color: Colors.grey,
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              child: SizedBox(
                width: 300,
                height: 50,
                child: Center(child: Text('$perAmount MMK per person', style: const TextStyle(fontSize: 15),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
