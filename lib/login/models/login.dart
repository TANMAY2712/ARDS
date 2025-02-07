
class OtpResponse {
  final int responseCode;
  final String successMessage;
  final OtpData data;

  OtpResponse({
    required this.responseCode,
    required this.successMessage,
    required this.data,
  });

  // Factory constructor to create an instance from JSON
  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      responseCode: json['ResponseCode'],
      successMessage: json['SuccessMessage'],
      data: OtpData.fromJson(json['Data']),
    );
  }
}

class OtpData {
  final int otp;
  final String username;
  final String countryCode;
  final int isCouponCodeAvailable;

  OtpData({
    required this.otp,
    required this.username,
    required this.countryCode,
    required this.isCouponCodeAvailable,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) {
    return OtpData(
      otp: json['OTP'],
      username: json['Username'],
      countryCode: json['CountryCode'],
      isCouponCodeAvailable: json['IsCouponCodeAvailable'],
    );
  }
}
