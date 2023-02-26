import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double selectedprincipal = 1000;
  double selectedyear = 1;
  double selectedrate = 1;
  double answer = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Icon(Icons.menu, color: Colors.white),
          title: Text("EMI CALCULATOR"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Text("Your Loan EMI is",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Text(
                      "\$ ${answer.toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "per Month",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 2, spreadRadius: 3)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Text(
                          "Principal Amount: ${selectedprincipal.toInt()}",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Slider(
                          value: selectedprincipal,
                          onChanged: (value) {
                            setState(() {
                              selectedprincipal = value;
                            });
                          },
                          max: 100000,
                          min: 1000,
                          label: "Amount",
                          activeColor: Colors.teal.shade900,
                          inactiveColor: Colors.teal,
                          divisions: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Text("Year: ${selectedyear.toInt()}",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Slider(
                          value: selectedyear,
                          onChanged: (value) {
                            setState(() {
                              selectedyear = value;
                            });
                          },
                          max: 10,
                          min: 1,
                          label: "Year",
                          activeColor: Colors.teal.shade900,
                          inactiveColor: Colors.teal,
                          divisions: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Text("Rate: ${selectedrate.toInt()}",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Slider(
                          value: selectedrate,
                          onChanged: (value) {
                            setState(() {
                              selectedrate = value;
                            });
                          },
                          max: 10,
                          min: 1,
                          label: "Rate",
                          activeColor: Colors.teal.shade900,
                          inactiveColor: Colors.teal,
                          divisions: 20),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          double interest = (selectedprincipal*selectedyear*selectedrate)/100;
                          answer = ((selectedprincipal+interest)/(12*selectedyear)) as double;
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Calculate",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
