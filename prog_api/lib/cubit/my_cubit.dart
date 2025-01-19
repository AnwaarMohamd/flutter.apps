import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prog_api/cubit/result_state.dart';
import 'package:prog_api/my_repo.dart';
import 'package:prog_api/user.dart';

// part 'my_state.dart';

class MyCubit extends Cubit<ResultState<dynamic>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(Idle());

  void emitGetAllUsers() {
    // myRepo.getAllUsers().then((usersList) {
    //   emit(GetAllUsers(usersList));
    // });
  }

  void emitGetUserDetails(int userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) {
    myRepo.createNewUser(newUser).then((newUser) {
      emit(CreateNewUser(newUser));
    });
  }

  void emitDeleteUser(String id) {
    myRepo.deleteUser(id).then((data) {
      emit(DeleteUser(data));
    });
  }
}
