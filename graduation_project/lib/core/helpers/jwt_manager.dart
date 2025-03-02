import 'package:jwt_decoder/jwt_decoder.dart';

class JwtModel {
  final String email;
  final String userName;
  final String userId;
  final String phoneNumber;
  final String emailVerified;
  final String roles;
  final String userType;
  final String instructorId;

  JwtModel({
    required this.email,
    required this.userName,
    required this.userId,
    required this.phoneNumber,
    required this.emailVerified,
    required this.roles,
    required this.userType,
    required this.instructorId,
  });

  factory JwtModel.fromDecodedToken(Map<String, dynamic> decodedToken) {
    return JwtModel(
      email: decodedToken['Email'] ?? '',
      userName: decodedToken['UserName'] ?? '',
      userId: decodedToken['UserId']?.toString() ?? '',
      phoneNumber: decodedToken['PhoneNumber'] ?? '',
      emailVerified: decodedToken['EmailVerified'] ?? '',
      roles: decodedToken['roles'] ?? '',
      userType: decodedToken['UserType'] ?? '',
      instructorId: decodedToken['InstructorId']?.toString() ?? '',
    );
  }
}

class JwtManager {
  static JwtModel? jwtModelData;

  //تخزين بيانات الـ JWT
  static void setJwtModel(JwtModel jwtModel) {
    jwtModelData = jwtModel;
    print("JWT Model has been set: ${jwtModel.email}");
  }

  static JwtModel getJwtModel(String jwt) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
    print("Decoded JWT: $decodedToken");

    JwtModel model = JwtModel.fromDecodedToken(decodedToken);

    // لازم يتم تخزينه هنا عشان يبقى متاح في كل التطبيق
    jwtModelData = model;

    return model;
  }

  static void removeJwtModel() {
    jwtModelData = null;
  }
}
