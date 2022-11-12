

import 'package:flutter/material.dart';
import 'package:metah/activityService.dart';
import 'package:metah/models/user.dart';

class ActivityController extends ChangeNotifier{
  final ActivityService activityService;

  User? user;

  ActivityController({this.activityService = const ActivityService()});

  Future<void> getUser(String userId) async{
    //user = await activityService.getUserByCode(userId);
    notifyListeners();
  }
}