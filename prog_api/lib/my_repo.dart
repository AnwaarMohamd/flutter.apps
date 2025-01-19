import 'package:prog_api/user.dart';
import 'package:prog_api/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    // await متنزلش للسطر اللى بعد غير لما تخلص ده
    return await webServices.getAllUsers();

    // retrofit بتعمل اللى تحت ده فال auto generate
    // singleUserDataFromJson =>> اوبجيكت واحد من الليسته
    // .map((singleUserDataFromJson) =>
    //     User.fromJson(singleUserDataFromJson.toJson()))
    // .toList(); // اهم سطر
  }

  Future<User> getUserById(int userId) async {
    return await webServices.getUserById(userId);

    // return User.fromJson(response.toJson()); // اوبجكت واحد راجعلي
  }

  Future<User> createNewUser(User newuser) async {
    return await webServices.createNewUser(newuser,
        'Bearer aa3b17ba18bf575b9bf66c9297f2bf3d16d3406706d47a50e4b82efa50ff9ee7'); // as a security thats wrong
  }

  Future<dynamic> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer aa3b17ba18bf575b9bf66c9297f2bf3d16d3406706d47a50e4b82efa50ff9ee7'); // as a security thats wrong
  }
}
