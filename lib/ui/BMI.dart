import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIstate();
  }
}

class BMIstate extends State<BMI> {
  final agecontroller=new TextEditingController();
  final heightcontroller=new TextEditingController();
  final weightcontroller=new TextEditingController();
  int radiovalue = 0;
  var X=['images/bmi_logo.png','images/fat_gif.gif','images/normal_gif.gif','images/thin_gif.gif'];
  int gif=0;
  void gender(int value) {
    setState(() {
      radiovalue = value;
      print(radiovalue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff474747),
        title: Text("BMI"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'images/bmi_logo.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Center(
                       child: Image.asset(
                          X[gif],
                          height: 200,
                          width: 200,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: const Color(0xff474747),
                              primaryColorDark: const Color(0xff474747),
                            ),
                            child: TextField(
                              controller: agecontroller,
                              decoration: InputDecoration(
                                hintText: "Enter Your Age",
                                icon: Icon(
                                  Icons.filter_9_plus,
                                  color: const Color(0xff474747),
                                ),
                                hintStyle: TextStyle(
                                    color: const Color(0xff474747),
                                    fontSize: 15.0,
                                    fontFamily: 'norwester'),
                                suffixText: "Years",
                              ),
                              cursorColor: const Color(0xff474747),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: 'norwester',
                                  color: const Color(0xff474747),
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: const Color(0xff474747),
                              primaryColorDark: const Color(0xff474747),
                            ),
                            child: TextField(
                              controller: heightcontroller,
                              decoration: InputDecoration(
                                hintText: "Enter Your Height",
                                icon: Icon(
                                  Icons.person,
                                  color: const Color(0xff474747),
                                ),
                                hintStyle: TextStyle(
                                    color: const Color(0xff474747),
                                    fontSize: 15.0,
                                    fontFamily: 'norwester'),
                                suffixText: "CM",
                              ),
                              cursorColor: const Color(0xff474747),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: 'norwester',
                                  color: const Color(0xff474747),
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: const Color(0xff474747),
                              primaryColorDark: const Color(0xff474747),
                            ),
                            child: TextField(
                              controller: weightcontroller,
                              decoration: InputDecoration(
                                hintText: "Enter Your Weight",
                                icon: Icon(
                                  Icons.line_weight,
                                  color: const Color(0xff474747),
                                ),
                                hintStyle: TextStyle(
                                    color: const Color(0xff474747),
                                    fontSize: 15.0,
                                    fontFamily: 'norwester'),
                                suffixText: "KG",
                              ),
                              cursorColor: const Color(0xff474747),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: 'norwester',
                                  color: const Color(0xff474747),
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio<int>(
                                  value: 1,
                                  groupValue: radiovalue,
                                  onChanged: gender,
                                  activeColor: const Color(0xff474747)),
                              Text(
                                "Male",
                                style:
                                    TextStyle(color: const Color(0xff474747)),
                              ),
                              Radio<int>(
                                  value: 2,
                                  groupValue: radiovalue,
                                  onChanged: gender,
                                  activeColor: const Color(0xff474747)),
                              Text(
                                "Female",
                                style:
                                    TextStyle(color: const Color(0xff474747)),
                              ),
                              Radio<int>(
                                  value: 3,
                                  groupValue: radiovalue,
                                  onChanged: gender,
                                  activeColor: const Color(0xff474747)),
                              Text(
                                "Others",
                                style:
                                    TextStyle(color: const Color(0xff474747)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: calculate,
                                textColor: Colors.white,
                                color: const Color(0xff474747),
                                child: Text("Calculate"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: clear,
                                textColor: Colors.white,
                                color: const Color(0xff474747),
                                child: Text("Clear"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculate(){
  setState(() {
    double bmi,weight,height;
    try{
      weight=double.parse(weightcontroller.text);
      height=double.parse(heightcontroller.text)/100;
      bmi=weight/(height*height);
      bmi=double.parse(bmi.toStringAsFixed(2));
      if (bmi>=1 && bmi<18.5 && radiovalue>0)
      {
        gif=3;
        _showDialog('$bmi : Your Are Underweight, Kuch Khaya Karo');
      }
      else if(bmi>=18.5 && bmi<25 && radiovalue>0){
        gif=2;
        _showDialog('$bmi : Your Are Normal (healthy weight), Jaise Chal Rha Hai Waise Chalne De');
      }
      else if(bmi>=25 && radiovalue>0){
        gif=1;
        _showDialog('$bmi : Your Are Overweight, Kam Khaya Karo');
      }
     else{
        throw Exception;
      }
    }
    catch(Exception){
      _showDialog("Wrong Input");
    }
  });
  }

  void clear(){
   setState(() {
     weightcontroller.text="";
     heightcontroller.text="";
     agecontroller.text="";
     gif=0;
     radiovalue=0;
   });
  }

  void _showDialog(String st) {
    // flutter defined function
  setState(() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Your BMI (Body Mass Index)"),
          content: new Text(st),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  });
  }
}
