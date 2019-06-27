import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors/sensors.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 String mn="Ready";
 int i=0,k=1,count=0; // k is used to make it know when to change Text character
  List<String> characters = ['Virat K','Dhoni','Sachin','Sourav','Mahatma Gandhi','Nelson Mandela'];
  void initState(){
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    accelerometerEvents.listen((AccelerometerEvent event) {

        String x,y,z;
       
        x=(event.x).toStringAsFixed(0);
        y=(event.y).toStringAsFixed(0);
        z=(event.z).toStringAsFixed(0);

        // Correct
        // Pass
        // onHead ->  Change Value 

        if(z=='-10'){
      
        setState(() {
         if(k==2){ 
            k=1;
            count++;
            mn="Correct"; 
            print("Correct Value i=$i");
        }
        });
        }

        else if (z=='9')
        {
        
        setState(() {
         if(k==2){
            k=1;
            mn="Pass"; 
            print("Pass Value i=$i");
        }
        });
        }

        else if (x=='10')
        {
        if(k==1){
            setState(() {
            i++;
            print(characters[i]);
            mn=characters[i];  
            print("onHead Value =$i");
             k=2;
            });
           
            }
        }

        else{
            //Testing coordinates
            print("$x, $y, $z");
        }

        });
        super.initState();
  }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heads Up'),),
      body: ListView(
        children: <Widget>[
          Center(
        
        child: Card(
        child: showtxt(),
            ),),
            Container(
              alignment: Alignment.bottomRight,
              child: Text("Score: $count",style: TextStyle(fontSize: 50),),
            )
             
         

        ],
      )
            );
          }
        
          Widget showtxt() {
            return Text("$mn",style: TextStyle(fontSize: 80),);
          }
}