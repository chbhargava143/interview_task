// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/models/user_model.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  List<UserModel> sortList = <UserModel>[];
  var sortString = '';
  Future<List<UserModel>> fetchAllusers() async {
    return await _db.collection('users').get().then((value) =>
        value.docs.map((item) => UserModel.fromJson(item.data())).toList());
  }

  Future<List<UserModel>> sortUsersByName() async {
    List<UserModel> result = [];
    if (sortString.isEmpty) {
      result = sortList;
    } else {
      result = sortList
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    return result;
  }

  Future<List<UserModel>> sortUsersByAge() async {
    List<UserModel> result = [];
    if (sortString.isEmpty) {
      result = sortList;
    } else {
      result = sortList
        ..sort((a, b) => a.age.toLowerCase().compareTo(b.age.toLowerCase()));
    }

    return result;
  }

  Future<List<UserModel>> sortUsersByCity() async {
    List<UserModel> result = [];
    if (sortString.isEmpty) {
      result = sortList;
    } else {
      result = sortList
        ..sort((a, b) => a.city.toLowerCase().compareTo(b.city.toLowerCase()));
    }

    return result;
  }

  Future<List<UserModel>> fetchAllusersList() async {
    return sortList = await _db.collection('users').get().then((value) =>
        value.docs.map((item) => UserModel.fromJson(item.data())).toList());
  }
}
