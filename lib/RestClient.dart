
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://15.165.175.81:3000/")

abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/account/login")
  Future<LoginResponse> getLoginData(
      @Body() LoginRequest loginRequest
      );

  @POST("/system/email")
  Future<EmailResponse> getEmailResponse(
      @Body() EmailRequest emailRequest
      );

  @POST("/account")
  Future<RegisterResponse> getRegisterResponse(
      @Body() RegisterRequest registerRequest
      );

}


//----------------------로그인 api

@JsonSerializable()
class LoginRequest{
  String? email;
  String? pw;

  LoginRequest({
    required this.email,
    required this.pw
});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse{
  bool? success;
  String? message;
  LoginData? data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data
});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}

@JsonSerializable()
class LoginData{
  int? account_idx;
  String token;

  LoginData({
    required this.account_idx,
    required this.token
});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

//----------------------------인증 이메일 보내기 api
@JsonSerializable()
class EmailRequest{
  String? email;

  EmailRequest({
    required this.email
});

  factory EmailRequest.fromJson(Map<String, dynamic> json) => _$EmailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EmailRequestToJson(this);
}

@JsonSerializable()
class EmailResponse{
  bool? success;
  String? message;
  EmailCertificationNumber? data;

  EmailResponse({
    required this.success,
    required this.message,
    required this.data
});
  factory EmailResponse.fromJson(Map<String, dynamic> json) => _$EmailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmailResponseToJson(this);

}


@JsonSerializable()
class EmailCertificationNumber{
  String? certification_number;

  EmailCertificationNumber({
    required this.certification_number
});
  factory EmailCertificationNumber.fromJson(Map<String, dynamic> json) => _$EmailCertificationNumberFromJson(json);
  Map<String, dynamic> toJson() => _$EmailCertificationNumberToJson(this);
}


//-----------------회원가입 인증번호api
@JsonSerializable()
class RegisterRequest{
  String? email;
  String? pw;

  RegisterRequest({
    required this.email,
    required this.pw
});
  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse{
  bool? success;
  String? message;

  RegisterResponse({
    required this.success,
    required this.message
});
  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
