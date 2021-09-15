// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreatStore on _CreatStore, Store {
  final _$isLoadingAtom = Atom(name: '_CreatStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$titleControllerAtom = Atom(name: '_CreatStore.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$postControllerAtom = Atom(name: '_CreatStore.postController');

  @override
  TextEditingController get postController {
    _$postControllerAtom.reportRead();
    return super.postController;
  }

  @override
  set postController(TextEditingController value) {
    _$postControllerAtom.reportWrite(value, super.postController, () {
      super.postController = value;
    });
  }

  final _$apiCreatPostAsyncAction = AsyncAction('_CreatStore.apiCreatPost');

  @override
  Future apiCreatPost(BuildContext context) {
    return _$apiCreatPostAsyncAction.run(() => super.apiCreatPost(context));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
titleController: ${titleController},
postController: ${postController}
    ''';
  }
}
