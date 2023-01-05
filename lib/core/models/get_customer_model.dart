

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

class GetCustomerModel {
  GetCustomerModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum>? data;
  final List<Message>? message;
  final String summary;

  factory GetCustomerModel.fromJson(Map<String, dynamic> json) => GetCustomerModel(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: json["summary"] == null ? null : json["summary"],
  );

}

class Datum {
  Datum({
    required this.customerId,
    required this.customerCode,
    required this.name,
    required this.surname,
    required this.lastLoginTimeStamp,
    required this.lastLogin,
    required this.email,
    required this.gender,
    required this.birthdate,
    required this.phone,
    required this.mobile,
    required this.officePhone,
    required this.isEmailNotificationOn,
    required this.isSmsNotificationOn,
    required this.isPhoneCallNotificationOn,
    required this.nonMembershipShopping,
    required this.address,
    required this.postcode,
    required this.registarDate,
    required this.createDateTimeStamp,
    required this.createDate,
    required this.taxOffice,
    required this.taxNo,
    required this.companyName,
    required this.identityNo,
    required this.representativeId,
    required this.representativeCode,
    required this.representativeName,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.field5,
    required this.field6,
    required this.field7,
    required this.field8,
    required this.field9,
    required this.field10,
    required this.field11,
    required this.field12,
    required this.field13,
    required this.field14,
    required this.field15,
    required this.approval,
    required this.customerGroupId,
    required this.userAgent,
    required this.ip,
    required this.credibility,
    required this.riskedNote,
    required this.totalDept,
    required this.language,
    required this.customerUpdateDate,
    required this.risked,
    required this.banned,
    required this.payAtDoor,
    required this.registrationPlatform,
    required this.kvkk,
    required this.kvkkApprovalTime,
    required this.priceField,
    required this.cargoFree,
    required this.smsApprovalTime,
    required this.emailApprovalTime,
    required this.phoneCallApprovalTime,
    required this.emailApprovalIp,
    required this.smsApprovalIp,
    required this.phoneCallApprovalIp,
    required this.nationality,
    required this.customerType,
    required this.permissionPlatform,
    required this.cityCode,
    required this.city,
    required this.townCode,
    required this.town,
    required this.district,
    required this.countryCode,
    required this.country,
    required this.customerGroupCode,
  });

  final String customerId;
  final String customerCode;
  final String name;
  final String surname;
  final String lastLoginTimeStamp;
  final String lastLogin;
  final String email;
  final String gender;
  final String birthdate;
  final String phone;
  final String mobile;
  final String officePhone;
  final String isEmailNotificationOn;
  final String isSmsNotificationOn;
  final String isPhoneCallNotificationOn;
  final String nonMembershipShopping;
  final String address;
  final String postcode;
  final String registarDate;
  final String createDateTimeStamp;
  final String createDate;
  final String taxOffice;
  final String taxNo;
  final String companyName;
  final String identityNo;
  final String representativeId;
  final String representativeCode;
  final String representativeName;
  final String field1;
  final String field2;
  final String field3;
  final String field4;
  final String field5;
  final String field6;
  final String field7;
  final String field8;
  final String field9;
  final String field10;
  final String field11;
  final String field12;
  final String field13;
  final String field14;
  final String field15;
  final String approval;
  final String customerGroupId;
  final String userAgent;
  final String ip;
  final String credibility;
  final String riskedNote;
  final double totalDept;
  final String language;
  final String customerUpdateDate;
  final String risked;
  final String banned;
  final String payAtDoor;
  final String registrationPlatform;
  final int kvkk;
  final int kvkkApprovalTime;
  final String priceField;
  final String cargoFree;
  final String smsApprovalTime;
  final String emailApprovalTime;
  final String phoneCallApprovalTime;
  final String emailApprovalIp;
  final String smsApprovalIp;
  final String phoneCallApprovalIp;
  final String nationality;
  final String customerType;
  final String permissionPlatform;
  final String cityCode;
  final String city;
  final String townCode;
  final String town;
  final String district;
  final String countryCode;
  final String country;
  final dynamic customerGroupCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    customerId: json["CustomerId"] == null ? null : json["CustomerId"],
    customerCode: json["CustomerCode"] == null ? null : json["CustomerCode"],
    name: json["Name"] == null ? null : json["Name"],
    surname: json["Surname"] == null ? null : json["Surname"],
    lastLoginTimeStamp: json["LastLoginTimeStamp"] == null ? null : json["LastLoginTimeStamp"],
    lastLogin: json["LastLogin"] == null ? null : json["LastLogin"],
    email: json["Email"] == null ? null : json["Email"],
    gender: json["Gender"] == null ? null : json["Gender"],
    birthdate: json["Birthdate"] == null ? null : json["Birthdate"],
    phone: json["Phone"] == null ? null : json["Phone"],
    mobile: json["Mobile"] == null ? null : json["Mobile"],
    officePhone: json["OfficePhone"] == null ? null : json["OfficePhone"],
    isEmailNotificationOn: json["IsEmailNotificationOn"] == null ? null : json["IsEmailNotificationOn"],
    isSmsNotificationOn: json["IsSmsNotificationOn"] == null ? null : json["IsSmsNotificationOn"],
    isPhoneCallNotificationOn: json["IsPhoneCallNotificationOn"] == null ? null : json["IsPhoneCallNotificationOn"],
    nonMembershipShopping: json["NonMembershipShopping"] == null ? null : json["NonMembershipShopping"],
    address: json["Address"] == null ? null : json["Address"],
    postcode: json["Postcode"] == null ? null : json["Postcode"],
    registarDate: json["RegistarDate"] == null ? null : json["RegistarDate"],
    createDateTimeStamp: json["CreateDateTimeStamp"] == null ? null : json["CreateDateTimeStamp"],
    createDate: json["CreateDate"] == null ? null : json["CreateDate"],
    taxOffice: json["TaxOffice"] == null ? null : json["TaxOffice"],
    taxNo: json["TaxNo"] == null ? null : json["TaxNo"],
    companyName: json["CompanyName"] == null ? null : json["CompanyName"],
    identityNo: json["IdentityNo"] == null ? null : json["IdentityNo"],
    representativeId: json["RepresentativeId"] == null ? null : json["RepresentativeId"],
    representativeCode: json["RepresentativeCode"] == null ? null : json["RepresentativeCode"],
    representativeName: json["RepresentativeName"] == null ? null : json["RepresentativeName"],
    field1: json["Field1"] == null ? null : json["Field1"],
    field2: json["Field2"] == null ? null : json["Field2"],
    field3: json["Field3"] == null ? null : json["Field3"],
    field4: json["Field4"] == null ? null : json["Field4"],
    field5: json["Field5"] == null ? null : json["Field5"],
    field6: json["Field6"] == null ? null : json["Field6"],
    field7: json["Field7"] == null ? null : json["Field7"],
    field8: json["Field8"] == null ? null : json["Field8"],
    field9: json["Field9"] == null ? null : json["Field9"],
    field10: json["Field10"] == null ? null : json["Field10"],
    field11: json["Field11"] == null ? null : json["Field11"],
    field12: json["Field12"] == null ? null : json["Field12"],
    field13: json["Field13"] == null ? null : json["Field13"],
    field14: json["Field14"] == null ? null : json["Field14"],
    field15: json["Field15"] == null ? null : json["Field15"],
    approval: json["Approval"] == null ? null : json["Approval"],
    customerGroupId: json["CustomerGroupId"] == null ? null : json["CustomerGroupId"],
    userAgent: json["UserAgent"] == null ? null : json["UserAgent"],
    ip: json["Ip"] == null ? null : json["Ip"],
    credibility: json["Credibility"] == null ? null : json["Credibility"],
    riskedNote: json["RiskedNote"] == null ? null : json["RiskedNote"],
    totalDept: json["TotalDept"] == null ? null : json["TotalDept"].toDouble(),
    language: json["Language"] == null ? null : json["Language"],
    customerUpdateDate: json["CustomerUpdateDate"] == null ? null : json["CustomerUpdateDate"],
    risked: json["Risked"] == null ? null : json["Risked"],
    banned: json["Banned"] == null ? null : json["Banned"],
    payAtDoor: json["PayAtDoor"] == null ? null : json["PayAtDoor"],
    registrationPlatform: json["RegistrationPlatform"] == null ? null : json["RegistrationPlatform"],
    kvkk: json["Kvkk"] == null ? null : json["Kvkk"],
    kvkkApprovalTime: json["KvkkApprovalTime"] == null ? null : json["KvkkApprovalTime"],
    priceField: json["PriceField"] == null ? null : json["PriceField"],
    cargoFree: json["CargoFree"] == null ? null : json["CargoFree"],
    smsApprovalTime: json["SmsApprovalTime"] == null ? null : json["SmsApprovalTime"],
    emailApprovalTime: json["EmailApprovalTime"] == null ? null : json["EmailApprovalTime"],
    phoneCallApprovalTime: json["PhoneCallApprovalTime"] == null ? null : json["PhoneCallApprovalTime"],
    emailApprovalIp: json["EmailApprovalIp"] == null ? null : json["EmailApprovalIp"],
    smsApprovalIp: json["SmsApprovalIp"] == null ? null : json["SmsApprovalIp"],
    phoneCallApprovalIp: json["PhoneCallApprovalIp"] == null ? null : json["PhoneCallApprovalIp"],
    nationality: json["Nationality"] == null ? null : json["Nationality"],
    customerType: json["CustomerType"] == null ? null : json["CustomerType"],
    permissionPlatform: json["PermissionPlatform"] == null ? null : json["PermissionPlatform"],
    cityCode: json["CityCode"] == null ? null : json["CityCode"],
    city: json["City"] == null ? null : json["City"],
    townCode: json["TownCode"] == null ? null : json["TownCode"],
    town: json["Town"] == null ? null : json["Town"],
    district: json["District"] == null ? null : json["District"],
    countryCode: json["CountryCode"] == null ? null : json["CountryCode"],
    country: json["Country"] == null ? null : json["Country"],
    customerGroupCode: json["CustomerGroupCode"],
  );


}

class Message {
  Message({
    required this.type,
    required this.code,
    required this.index,
    required this.id,
    required this.subid,
    required this.text,
    required this.errorField,
  });

  final int type;
  final String code;
  final int index;
  final String id;
  final String subid;
  final List<String>? text;
  final List<dynamic>? errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"] == null ? null : json["type"],
    code: json["code"] == null ? null : json["code"],
    index: json["index"] == null ? null : json["index"],
    id: json["id"] == null ? null : json["id"],
    subid: json["subid"] == null ? null : json["subid"],
    text: json["text"] == null ? null : List<String>.from(json["text"].map((x) => x)),
    errorField: json["errorField"] == null ? null : List<dynamic>.from(json["errorField"].map((x) => x)),
  );


}
