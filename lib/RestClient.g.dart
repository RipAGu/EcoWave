// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      pw: json['pw'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pw': instance.pw,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      account_idx: json['account_idx'] as int?,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'account_idx': instance.account_idx,
      'token': instance.token,
    };

EmailRequest _$EmailRequestFromJson(Map<String, dynamic> json) => EmailRequest(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$EmailRequestToJson(EmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

EmailResponse _$EmailResponseFromJson(Map<String, dynamic> json) =>
    EmailResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : EmailCertificationNumber.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmailResponseToJson(EmailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

EmailCertificationNumber _$EmailCertificationNumberFromJson(
        Map<String, dynamic> json) =>
    EmailCertificationNumber(
      certification_number: json['certification_number'] as String?,
    );

Map<String, dynamic> _$EmailCertificationNumberToJson(
        EmailCertificationNumber instance) =>
    <String, dynamic>{
      'certification_number': instance.certification_number,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String?,
      pw: json['pw'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pw': instance.pw,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://15.165.175.81:3000/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> getLoginData(loginRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmailResponse> getEmailResponse(emailRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(emailRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<EmailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/system/email',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterResponse> getRegisterResponse(registerRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
