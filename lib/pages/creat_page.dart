import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/stores/creat_store.dart';

class CreatPage extends StatefulWidget {

  static final String id = "creat_page";

  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {

  CreatStore creatStore = new CreatStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Creat Post"),
        ),
        body: Observer(
          builder: (_) => Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(

                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        controller: creatStore.titleController,
                        decoration: InputDecoration(
                          labelText: "Title",
                          border: OutlineInputBorder (),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 100,
                      width: double.infinity,
                      child: TextField(
                        controller: creatStore.postController,
                        decoration: InputDecoration(
                          labelText: "Post",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: (){
                        creatStore.apiCreatPost (context);
                      },
                      child: Text("Creat post"),
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              creatStore.isLoading ? Center (
                child: CircularProgressIndicator(),
              ) : SizedBox.shrink(),

            ],
          ),
        )
    );
  }
}