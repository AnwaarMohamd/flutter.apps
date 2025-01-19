import 'package:dio/dio.dart';
import 'package:prog_api/user.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUserById(@Path('id') int id); // path هي حاجه من retrofit

  @POST('users')
  Future<User> createNewUser(@Body() User newuser, @Header('Authorization') String token );

  @DELETE('users/{id}')
  Future<dynamic> deleteUser(@Path() String id , @Header('Authorization') String token );

}
// اي حاجه بنعملها هنا بنعدل فيها او كدا بنعملها generate تاني
