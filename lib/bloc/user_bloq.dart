import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/user_events.dart';
import 'package:to_do_list/bloc/user_states.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/servises/user_repositori.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepositori userRepositori;

  UserBloc(this.userRepositori) : super(UserEmptyState()) {
    on<UserAddEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> loadedUserserlist = await userRepositori.getAllUser();
        emit(UserLoadedState(loadedUser: loadedUserserlist));
      } catch (_) {}
    });
    on<UserClaerEvent>((event, emit) async {
      emit(UserClearState());
    });
  }
}
