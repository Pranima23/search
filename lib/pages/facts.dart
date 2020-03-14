import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:search/pages/quiz.dart'; 


//import 'package:splashscreen/quizpage.dart';
String changeToQuiz(String langFactName) {
  String langName;
  if (langFactName == "EYES") {
    langName = "eyes1";
  } else if (langFactName == "NOSE") {
    langName = "nose1";
  } else {
    langName = "heart1";
  }
  return langName;
}

class Getfactjson extends StatelessWidget {
  final langFactName;

  Getfactjson(this.langFactName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("FACTS"),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/" +
                this.langFactName.toLowerCase() +
                "_fact" +
                ".jSON"),
            builder: (context, snapshot) {
              List mydata = json.decode(snapshot.data.toString());

              return ListView(
                children: <Widget>[ new ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Card(
                          color: Colors.purple[50],
                          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    mydata[index]['*'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                ]),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Container(
                    color: Colors.white,
                    child: MaterialButton(
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                      minWidth: 150,
                      elevation: 10.0,
                      child: Text(
                        'Play Quiz!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder:(context)=>GetJson(langFactName),
         // builder: (context ,' /facts')
            ));
                      },
                      ),
                  ),
                )
                ],
              );
            },
          ),
          
        ),
      ),
    );
  }
}
