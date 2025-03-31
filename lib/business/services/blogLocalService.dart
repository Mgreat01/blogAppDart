import '../models/user.dart';

abstract class BlogLocalService {
  Future <bool> sauvergarderUser ( User user);

}