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
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
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
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
    };

ProfileModifyBody _$ProfileModifyBodyFromJson(Map<String, dynamic> json) =>
    ProfileModifyBody(
      image: json['image'] as String?,
      is_replace: json['is_replace'] as bool?,
      name: json['name'] as String?,
      introduce: json['introduce'] as String?,
    );

Map<String, dynamic> _$ProfileModifyBodyToJson(ProfileModifyBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'is_replace': instance.is_replace,
      'name': instance.name,
      'introduce': instance.introduce,
    };

ProfileModifyResponse _$ProfileModifyResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileModifyResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProfileModifyResponseToJson(
        ProfileModifyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: BannerResponseList.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

BannerResponseList _$BannerResponseListFromJson(Map<String, dynamic> json) =>
    BannerResponseList(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => BannerResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerResponseListToJson(BannerResponseList instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

BannerResponseData _$BannerResponseDataFromJson(Map<String, dynamic> json) =>
    BannerResponseData(
      banner_idx: json['banner_idx'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BannerResponseDataToJson(BannerResponseData instance) =>
    <String, dynamic>{
      'banner_idx': instance.banner_idx,
      'image': instance.image,
    };

MeetingListResponse _$MeetingListResponseFromJson(Map<String, dynamic> json) =>
    MeetingListResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MeetingListResponseList.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingListResponseToJson(
        MeetingListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MeetingListResponseList _$MeetingListResponseListFromJson(
        Map<String, dynamic> json) =>
    MeetingListResponseList(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) =>
              MeetingListResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeetingListResponseListToJson(
        MeetingListResponseList instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

MeetingListResponseData _$MeetingListResponseDataFromJson(
        Map<String, dynamic> json) =>
    MeetingListResponseData(
      event_idx: json['event_idx'] as int?,
      title: json['title'] as String?,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      place: json['place'] as String?,
    );

Map<String, dynamic> _$MeetingListResponseDataToJson(
        MeetingListResponseData instance) =>
    <String, dynamic>{
      'event_idx': instance.event_idx,
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
      'date': instance.date,
      'status': instance.status,
      'place': instance.place,
    };

CreateMeetingResponse _$CreateMeetingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateMeetingResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateMeetingResponseToJson(
        CreateMeetingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

MeetingDetailResponse _$MeetingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    MeetingDetailResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MeetingDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingDetailResponseToJson(
        MeetingDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MeetingDetailData _$MeetingDetailDataFromJson(Map<String, dynamic> json) =>
    MeetingDetailData(
      account_idx: json['account_idx'] as int?,
      is_register: json['is_register'] as bool?,
      register: (json['register'] as List<dynamic>)
          .map((e) =>
              MeetingDetailDataRegister.fromJson(e as Map<String, dynamic>))
          .toList(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String?,
      type: json['type'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      address: json['address'] as String?,
      place: json['place'] as String?,
      introduce: json['introduce'] as String?,
    );

Map<String, dynamic> _$MeetingDetailDataToJson(MeetingDetailData instance) =>
    <String, dynamic>{
      'account_idx': instance.account_idx,
      'is_register': instance.is_register,
      'register': instance.register,
      'image': instance.image,
      'title': instance.title,
      'type': instance.type,
      'date': instance.date,
      'status': instance.status,
      'address': instance.address,
      'place': instance.place,
      'introduce': instance.introduce,
    };

MeetingDetailDataRegister _$MeetingDetailDataRegisterFromJson(
        Map<String, dynamic> json) =>
    MeetingDetailDataRegister(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MeetingDetailDataRegisterToJson(
        MeetingDetailDataRegister instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

MeetingParticipateResponse _$MeetingParticipateResponseFromJson(
        Map<String, dynamic> json) =>
    MeetingParticipateResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MeetingParticipateResponseToJson(
        MeetingParticipateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

MeetingParticipateRequest _$MeetingParticipateRequestFromJson(
        Map<String, dynamic> json) =>
    MeetingParticipateRequest(
      event_idx: json['event_idx'] as int?,
    );

Map<String, dynamic> _$MeetingParticipateRequestToJson(
        MeetingParticipateRequest instance) =>
    <String, dynamic>{
      'event_idx': instance.event_idx,
    };

MeetingCancelResponse _$MeetingCancelResponseFromJson(
        Map<String, dynamic> json) =>
    MeetingCancelResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MeetingCancelResponseToJson(
        MeetingCancelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

MeetingCancelRequest _$MeetingCancelRequestFromJson(
        Map<String, dynamic> json) =>
    MeetingCancelRequest(
      event_idx: json['event_idx'] as int?,
    );

Map<String, dynamic> _$MeetingCancelRequestToJson(
        MeetingCancelRequest instance) =>
    <String, dynamic>{
      'event_idx': instance.event_idx,
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

  @override
  Future<ProfileModifyResponse> getProfileResponse(
    token,
    image,
    is_replace,
    name,
    introduce,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'is_replace',
      is_replace.toString(),
    ));
    _data.fields.add(MapEntry(
      'name',
      name,
    ));
    _data.fields.add(MapEntry(
      'introduce',
      introduce,
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProfileModifyResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileModifyResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BannerResponse> getBannerResponse(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BannerResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/system/banner',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BannerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MeetingListResponse> getMeetingListResponse(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MeetingListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/event/all',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeetingListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateMeetingResponse> getCreateMeetingResponse(
    token,
    image,
    title,
    type,
    date,
    start_time,
    end_time,
    address,
    place,
    register_number,
    introduce,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'title',
      title,
    ));
    _data.fields.add(MapEntry(
      'type',
      type,
    ));
    _data.fields.add(MapEntry(
      'date',
      date,
    ));
    _data.fields.add(MapEntry(
      'start_time',
      start_time,
    ));
    _data.fields.add(MapEntry(
      'end_time',
      end_time,
    ));
    _data.fields.add(MapEntry(
      'address',
      address,
    ));
    _data.fields.add(MapEntry(
      'place',
      place,
    ));
    _data.fields.add(MapEntry(
      'register_number',
      register_number.toString(),
    ));
    _data.fields.add(MapEntry(
      'introduce',
      introduce,
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateMeetingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/event',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateMeetingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MeetingDetailResponse> getMeetingDetailResponse(
    token,
    event_idx,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'event_idx': event_idx};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MeetingDetailResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/event',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeetingDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MeetingParticipateResponse> getMeetingParticipateResponse(
    token,
    meetingParticipateRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(meetingParticipateRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MeetingParticipateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/event/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeetingParticipateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MeetingCancelResponse> getMeetingCancelResponse(
    token,
    meetingCancelRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(meetingCancelRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MeetingCancelResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/event/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeetingCancelResponse.fromJson(_result.data!);
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
