import 'dart:convert';
import 'package:blog_mobile/business/models/user.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:get_storage/get_storage.dart';

class BlogLocalNetworkServiceImpl implements BlogLocalService {
  GetStorage? box;
  BlogLocalNetworkServiceImpl({this.box});


  @override
  Future<bool> sauvergarderUser(User user) async {
    var data = user.toMap();
    await box?.write("user",jsonEncode((data)));

    return true;

  }



}