import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color appBarColor = Color(0XFFBB2CD9);
  final Color backGroundColor = Color(0XFF1287A5);
  final TextEditingController heightHandler = TextEditingController();
  final TextEditingController weightHandler = TextEditingController();
  var statusColor = Colors.white;
  var height = 0.0;
  var weight = 0.0;
  var bmi = 0.0;
  int groupKey = 5;
  String status = "";
  String displayBMI = "";
  radioHandler(value) {
    setState(() {
      groupKey = value;
      switch (groupKey) {
        case 0:
          bmiCalculat();
          if (bmi < 18.5) {
            status = "Underweight";
            statusColor = Color(0XFFDFAF2B);
          } else if (bmi > 18.5 && bmi < 26) {
            status = "Normal";
            statusColor = Color(0XFF45CE30);
          } else {
            status = "Overweight";
            statusColor = Color(0XFFE71C23);
          }
          displayBMI = bmi.toStringAsFixed(1);
          break;

        case 1:
          bmiCalculat();
          if (bmi < 19.5) {
            status = "Underweight";
            statusColor = Color(0XFFDFAF2B);
          } else if (bmi > 20.5 && bmi < 27) {
            status = "Normal";
            statusColor = Color(0XFF45CE30);
          } else {
            status = "Overweight";
            statusColor = Color(0XFFE71C23);
          }
          displayBMI = bmi.toStringAsFixed(1);
          break;
      }
    });
  }

  bmiCalculat() {
    setState(() {
      height = double.parse(heightHandler.text);
      weight = double.parse(weightHandler.text);
      bmi = weight / (height * height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      backgroundColor: backGroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              "images/gym.png",
              height: 100.0,
              width: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: heightHandler,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter your height in m",
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 17.0)),
                ),
              ),
              decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: weightHandler,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter your weight in kg",
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 17.0)),
                ),
              ),
              decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 20.0),
                child: Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color(0XFF2B2B52)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        groupValue: groupKey,
                        value: 0,
                        onChanged: radioHandler,
                        activeColor: Colors.blue,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Radio<int>(
                        groupValue: groupKey,
                        onChanged: radioHandler,
                        value: 1,
                        activeColor: Colors.pink,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: status.isEmpty
                    ? Text(
                        "Enter the Details",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )
                    : Text(
                        "Status : $status",
                        style: TextStyle(
                            color: statusColor,
                            fontSize: 25.0,
                            fontFamily: "SFCompact",
                            fontWeight: FontWeight.w700),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: displayBMI.isEmpty
                    ? Text("")
                    : Text(
                        "BMI : $displayBMI",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "SFCompact",
                            fontWeight: FontWeight.w700),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
