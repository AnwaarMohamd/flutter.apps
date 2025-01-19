// part of 'my_cubit.dart';

// @immutable
// sealed class MyState {}

// class MyInitial extends MyState {
  // إضافة جسم الكلاس
// }

// class GetAllUsers extends MyState {
//   final List<User> allUsersList;
//   GetAllUsers(this.allUsersList);
// }

// class GetUserDetails extends MyState {
//   final User userDetails;
//   GetUserDetails(this.userDetails);
// }

// class CreateNewUser extends MyState {
//   final User newuser;
//   CreateNewUser(this.newuser);
// }

// class DeleteUser extends MyState {
//   final dynamic data;
//   DeleteUser(this.data);
// }
import 'package:json_annotation/json_annotation.dart';
import 'package:prog_api/network_exception.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T>{
  const factory ResultState.idle() = Idle<T>;
  const factory ResultState.loading() = Loading<T>;
  const factory ResultState.success(T data) = Success<T>;
  const factory ResultState.error(NetworkExceptions networkExceptions) = Error<T>;

}
