
import 'dart:io';

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

  @PUT("/profile")
  @MultiPart()
  Future<ProfileModifyResponse> getProfileResponse(
      @Header("token") String token,
      @Part() File image,
      @Part() bool is_replace,
      @Part() String name,
      @Part() String introduce
      );

  @GET("/system/banner")
  Future<BannerResponse> getBannerResponse(
      @Header("token") String token
      );

  @GET("/event/all")
  Future<MeetingListResponse> getMeetingListResponse(
      @Header("token") String token
      );
  @POST("/event")
  @MultiPart()
  Future<CreateMeetingResponse> getCreateMeetingResponse(
      @Header("token") String token,
      @Part() File image,
      @Part() String title,
      @Part() String type,
      @Part() String date,
      @Part() String start_time,
      @Part() String end_time,
      @Part() String address,
      @Part() String place,
      @Part() int register_number,
      @Part() String introduce,
      );

  @GET("/event")
  Future<MeetingDetailResponse> getMeetingDetailResponse(
      @Header("token") String token,
      @Query("event_idx") int event_idx,
      );
  @POST("/event/register")
  Future<MeetingParticipateResponse> getMeetingParticipateResponse(
      @Header("token") String token,
      @Body() MeetingParticipateRequest meetingParticipateRequest
      );
  @DELETE("/event/register")
  Future<MeetingCancelResponse> getMeetingCancelResponse(
      @Header("token") String token,
      @Body() MeetingCancelRequest meetingCancelRequest
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
  String? token;

  LoginData({
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
  String? token;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.token
});
  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

//------------------프로필 설정/수정 api

@JsonSerializable()
class ProfileModifyBody{
  String? image;
  bool? is_replace;
  String? name;
  String? introduce;
  ProfileModifyBody({
    required this.image,
    required this.is_replace,
    required this.name,
    required this.introduce
});
  factory ProfileModifyBody.fromJson(Map<String, dynamic> json) => _$ProfileModifyBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModifyBodyToJson(this);
}

@JsonSerializable()
class ProfileModifyResponse{
  bool? success;
  String? message;
  ProfileModifyResponse({
    required this.success,
    required this.message
});
  factory ProfileModifyResponse.fromJson(Map<String, dynamic> json) => _$ProfileModifyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModifyResponseToJson(this);
}

//------------배너api
@JsonSerializable()
class BannerResponse{
  bool? success;
  String? message;
  BannerResponseList data;

  BannerResponse({
    required this.success,
    required this.message,
    required this.data
});


  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class BannerResponseList{
  List<BannerResponseData>? result;

  BannerResponseList({
    required this.result
});

  factory BannerResponseList.fromJson(Map<String, dynamic> json) => _$BannerResponseListFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseListToJson(this);
}

@JsonSerializable()
class BannerResponseData{
  int? banner_idx;
  String? image;

  BannerResponseData({
    required this.banner_idx,
    required this.image
});
  factory BannerResponseData.fromJson(Map<String, dynamic> json) => _$BannerResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseDataToJson(this);
}


//----------------모임목록api

@JsonSerializable()
class MeetingListResponse{
  bool? success;
  String? message;
  MeetingListResponseList? data;
  MeetingListResponse({
    required this.success,
    required this.message,
    required this.data
});
  factory MeetingListResponse.fromJson(Map<String, dynamic> json) => _$MeetingListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingListResponseToJson(this);
}

@JsonSerializable()
class MeetingListResponseList{
  List<MeetingListResponseData>? result;
  MeetingListResponseList({
    required this.result
});
  factory MeetingListResponseList.fromJson(Map<String, dynamic> json) => _$MeetingListResponseListFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingListResponseListToJson(this);
}

@JsonSerializable()
class MeetingListResponseData{
  int? event_idx;
  String? title;
  List<String> image;
  String? type;
  String? date;
  String? status;
  String? place;
  MeetingListResponseData({
    required this.event_idx,
    required this.title,
    required this.image,
    required this.type,
    required this.date,
    required this.status,
    required this.place
});

  factory MeetingListResponseData.fromJson(Map<String, dynamic> json) => _$MeetingListResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingListResponseDataToJson(this);
}

//---------------------모임개설 api


@JsonSerializable()
class CreateMeetingResponse{
  bool? success;
  String? message;
  CreateMeetingResponse({
    required this.success,
    required this.message
});
  factory CreateMeetingResponse.fromJson(Map<String, dynamic> json) => _$CreateMeetingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateMeetingResponseToJson(this);
}

//------------------모임 상세보기api
@JsonSerializable()
class MeetingDetailResponse{
  bool? success;
  String? message;
  MeetingDetailData? data;

  MeetingDetailResponse({
    required this.success,
    required this.message,
    required this.data,


});
  factory MeetingDetailResponse.fromJson(Map<String, dynamic> json) => _$MeetingDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingDetailResponseToJson(this);
}

@JsonSerializable()
class MeetingDetailData{
  int? account_idx;
  bool? is_register;
  List<MeetingDetailDataRegister> register;
  List<String>? image;
  String? title;
  String? type;
  String? date;
  String? status;
  String? address;
  String? place;
  String? introduce;
  MeetingDetailData({
    required this.account_idx,
    required this.is_register,
    required this.register,
    required this.image,
    required this.title,
    required this.type,
    required this.date,
    required this.status,
    required this.address,
    required this.place,
    required this.introduce,
});
  factory MeetingDetailData.fromJson(Map<String, dynamic> json) => _$MeetingDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingDetailDataToJson(this);
}

@JsonSerializable()
class MeetingDetailDataRegister{
  String? image;
  MeetingDetailDataRegister({
    required this.image
});
  factory MeetingDetailDataRegister.fromJson(Map<String, dynamic> json) => _$MeetingDetailDataRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingDetailDataRegisterToJson(this);
}

//---------------모임참가 api
@JsonSerializable()
class MeetingParticipateResponse{
  bool? success;
  String? message;
  MeetingParticipateResponse({
    required this.success,
    required this.message,
});
  factory MeetingParticipateResponse.fromJson(Map<String, dynamic> json) => _$MeetingParticipateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingParticipateResponseToJson(this);
}

@JsonSerializable()
class MeetingParticipateRequest{
  int? event_idx;
  MeetingParticipateRequest({
    required this.event_idx,
});
  factory MeetingParticipateRequest.fromJson(Map<String, dynamic> json) => _$MeetingParticipateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingParticipateRequestToJson(this);
}


//---------------모임참가 취소 api
@JsonSerializable()
class MeetingCancelResponse{
  bool? success;
  String? message;
  MeetingCancelResponse({
    required this.success,
    required this.message
});
  factory MeetingCancelResponse.fromJson(Map<String, dynamic> json) => _$MeetingCancelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingCancelResponseToJson(this);
}

@JsonSerializable()
class MeetingCancelRequest{
  int? event_idx;
  MeetingCancelRequest({
    required this.event_idx,
  });
  factory MeetingCancelRequest.fromJson(Map<String, dynamic> json) => _$MeetingCancelRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingCancelRequestToJson(this);
}
