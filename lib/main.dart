import 'package:flutter/material.dart';
import 'MoneyBox.dart';
import 'package:http/http.dart' as http;

void main() {
  // var app = MaterialApp(
  //   title: "My app",
  //   home: Scaffold(
  //     appBar: AppBar(
  //       title: Text("Hello Flutter"),
  //     ),
  //     body: Text("Bossza"),
  //   ),
  //   theme: ThemeData(primarySwatch: Colors.green),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //กลุ่มข้อมูล
  // List<FoodMenu> menu = [
  //   FoodMenu("ข้าวผัดกะเพรา", "35", "assets/images/ผัดกะเพราหมูสับ.jpg"),
  //   FoodMenu("ข้าวผัด", "35", "assets/images/ข้าวผัด.jpg"),
  //   FoodMenu("ส้มตำ", "30", "assets/images/ส้มตำ.jpg")
  // ];
  @override
  void initState() {
    super.initState();
    getExchange();
  }

  Future<void> getExchange() async {
    var res = await http
        .get("https://api.exchangeratesapi.io/latest?symbols=USD,GBP");
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "อัตราการแลกเปลี่ยนสกุลเงิน",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              MoneyBox("ยอดคงเหลือ", 10000, Colors.blue, 150),
              SizedBox(
                height: 10,
              ),
              MoneyBox("รายรับ", 2500, Colors.orange, 100)
            ],
          ),
        ));
  }
}
