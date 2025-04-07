import 'package:blog_mobile/business/models/user.dart';

abstract class BlogLocalService{
  Future<bool> sauvergaderUser(User user);
}