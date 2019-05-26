import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //import images or linking the images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage rupee = AssetImage("images/rupee.png");
  AssetImage sadFace = AssetImage("images/sadFace.png");

  //get an array
  List<String> itemArray;
  int luckyNumber;

  //init array with 25 elements
  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }
  generateRandomNumber(){
    int random = Random().nextInt(25);
    print(random);
    setState(() {
      luckyNumber = random;
    });
  }

  //define a getImage method
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "rupee":
        return rupee;
        break;
      case ('sadFace'):
        return sadFace;
        break;
      default:
    }
    return circle;
  }

  //play game method
  playGame(int index){
    if(luckyNumber == index){
      setState(() {
        itemArray[index] = "rupee";
      });
    } else{
      setState(() {
        itemArray[index] = "sadFace";
      });
    }
  }

  //show all
  showAll(){
    setState(() {
      itemArray = List<String>.filled(25, "sadFace");
      itemArray[luckyNumber] = "rupee";
    });
  }

  //reset all
  resetGame(){
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and Win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (content, i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  splashColor: Color(0xFFE74292),
                ),
              )
            ),
          ),
          Container(
            margin: EdgeInsets.all(11.0),
            child: RaisedButton(
              onPressed: () {
                this.showAll();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Show All', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              splashColor: Color(0xFFE74292),
            ),
          ),
          Container(
            margin: EdgeInsets.all(11.0),
            child: RaisedButton(
              onPressed: () {
                this.resetGame();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              splashColor: Color(0xFFE74292),
            ),
          ),
          Container(
            child: Text(
              'LearnCodeOnline',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Trajan Pro',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            color: Colors.black,
            padding: EdgeInsets.all(15.0),
          )
        ],
      ),
    );
  }
}