import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/services/http_request.dart';

part 'creat_store.g.dart';

class CreatStore = _CreatStore with _$CreatStore;

abstract class _CreatStore with Store {

  @observable bool isLoading = false;

  @observable var titleController = TextEditingController();
  @observable var postController = TextEditingController();

  @action

  apiCreatPost(BuildContext context) async {
    isLoading = true;
    String title = titleController.text.trim().toString();
    String body = postController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    isLoading = false;
    Navigator.pop(context, response);
  }
}