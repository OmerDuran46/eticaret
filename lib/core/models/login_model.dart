

class LoginModel {
  LoginModel({
   required this.success,
   required this.data,
  });

  final bool success;
  final List<Datum> data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  Datum({
   required this.id,
   required this.name,
   required this.surname,
   required this.email,
   required this.identityNumber,
   required this.onay,
   required this.gender,
   required this.birthdate,
   required this.mobilePhone,
   required this.company,
   required this.mailNotify,
   required this.smsNotify,
   required this.phoneNotify,
   required this.kvkk,
   required this.kvkkApprovalTime,
   required this.customerGroupId,
   required this.cartTotalCount,
   required this.mobileToken,
  });

  final String id;
  final String name;
  final String surname;
  final String email;
  final String identityNumber;
  final String onay;
  final String gender;
  final String birthdate;
  final String mobilePhone;
  final String company;
  final String mailNotify;
  final String smsNotify;
  final String phoneNotify;
  final int kvkk;
  final int kvkkApprovalTime;
  final String customerGroupId;
  final int cartTotalCount;
  final String mobileToken;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    identityNumber: json["identity_number"],
    onay: json["Onay"],
    gender: json["gender"],
    birthdate: json["birthdate"],
    mobilePhone: json["mobile_phone"],
    company: json["company"],
    mailNotify: json["mail_notify"],
    smsNotify: json["sms_notify"],
    phoneNotify: json["phone_notify"],
    kvkk: json["kvkk"],
    kvkkApprovalTime: json["kvkk_approval_time"],
    customerGroupId: json["customer_group_id"],
    cartTotalCount: json["cart_total_count"],
    mobileToken: json["mobile_token"],
  );


}
