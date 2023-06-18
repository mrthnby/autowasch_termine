import 'package:autowasch_termine/view/user/model/autowash_model.dart';


abstract class IUserService {
  Future<List<Autowash>?> fetchAutowashList();
}
