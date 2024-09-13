

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _dialogiOS(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you went to logout"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Cancel"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
        CupertinoDialogAction(
        isDefaultAction: true,
        child: Text("Confirm"),
        onPressed: (){
        Navigator.of(context).pop();
        },
        ),
          ],
        );

      }
    );
  }

  _dialogAndroid(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you went to logout"),
          actions: [
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pop();
                print("Cancel");
              },
              child: Text("Cancel"),
            ),
        MaterialButton(
        onPressed: (){
        Navigator.of(context).pop();
        print("Confirm");
        },
        child: Text("Confirm"),
           ),
          ],
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            if(Platform.isAndroid){
              _dialogAndroid();
            }else if(Platform.isIOS){
              _dialogiOS();
            }
          },
          child: Text("Open Dialog"),
        ),
      ),
    );
  }
}
