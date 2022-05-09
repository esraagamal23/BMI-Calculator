import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
          color: Colors.black12,
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  String height = "";
  String weight = "";
  String index = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String calculateBmi(double height, double weight) {
    double bmi = weight / (height * height / 10000);

    setState(() {
      result = bmi.toStringAsFixed(2);
    });
    return result;
  }

  String indexing(double resulte) {
    if (resulte < 18.50) {
      return "Under Weight";
    }
    if (resulte >= 18.50 && resulte < 24.90) {
      return "Normal";
    }
    if (resulte >= 25.00 && resulte < 29.90) {
      return "Over Weight";
    }
    if (resulte >= 30.00 && resulte < 34.90) {
      return "Obese";
    } else {
      return "Extermely Obses";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.black45,
      ),
      body: Container(
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
               const SizedBox( height: 20,),
               const Text(
                  "Your Height in Cm",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  decoration: InputDecoration(
                      hintText: "Your height in cm",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none)),
                ),
               const SizedBox(
                  height: 20,
                ),
               const Text(
                  "Your Weight in Kg",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                      hintText: "Your Weight in Kg",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20.0,
                ),

             const   Text(
                  "Your BMI is",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

              const  SizedBox(
                  height: 20.0,
                ),

                Text(
                  result,
                  style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
             const   SizedBox(
                  height: 20,
                ),
                //calculation button
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {
                      height = heightController.value.text;
                      weight = weightController.value.text;
                      result = calculateBmi(
                          double.parse(height), double.parse(weight));
                      index = indexing(double.parse(result));
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child:const Text(
                      "calulate",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                Text(
                  index,
                  style:const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
