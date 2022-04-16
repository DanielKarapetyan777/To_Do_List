import 'package:to_do_list/servises/user_add.dart';

class UserRepositori {
  final AddText _userProvaider = AddText();
  getAllUser() => _userProvaider.usertodo;
}
