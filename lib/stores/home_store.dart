import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/pages/creat_page.dart';
import 'package:patterns_mobx/pages/update_page.dart';
import 'package:patterns_mobx/services/http_request.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
   @observable List <Post> items = new List();
   @observable bool isLoading= false;

  Future apiPostList () async {
    isLoading = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null ) {
      items = Network.parsePostList(response);
    } else {
      print ("No info");
    }
    isLoading = false;
  }

  Future <bool> apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    isLoading = false;
    return response != null;
  }

   Future apiCreatePost(BuildContext context) async{
     String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatPage()));
     items.add(Network.parsePost(result));
   }

   Future apiUpdatePost(BuildContext context, Post post) async{
     String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
     Post post2 = Network.parsePost(result);
     items[items.indexWhere((element) => element.id == post2.id)] = post2;
   }

}