import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/services/http_request.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class _UpdateStore with Store {

 @observable bool isLoading = false;
 @observable var titleController = TextEditingController();
 @observable var bodyController = TextEditingController();
 @observable Post oldPost;

  getOldPost(Post post) {
    oldPost = post;
    titleController.text = oldPost.title;
    bodyController.text = oldPost.body;
  }

  apiCreatePost(BuildContext context) async{
    isLoading = true;

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await Network.PUT(Network.API_UPDATE + oldPost.id.toString(), Network.paramsUpdate(post));
    print(response);
    isLoading = false;
    if(response != null) {
      Navigator.pop(context, response);
    } else {
      print("Error");
    }
  }

}