import 'package:blog_mobile/business/models/authentification.dart';

import '../models/user.dart';

abstract class BlogNetworkService{
  Future<User> authentifier(Authentication data);

}