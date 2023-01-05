
class GetAdressModel {
  GetAdressModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum> data;
  final List<dynamic> message;
  final Summary summary;

  factory GetAdressModel.fromJson(Map<String, dynamic> json) => GetAdressModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: List<dynamic>.from(json["message"].map((x) => x)),
    summary: Summary.fromJson(json["summary"]),
  );

}

class Datum {
  Datum({
    required this.id,
    required this.customerId,
    required this.sessionId,
    required this.title,
    required this.fullname,
    required this.address,
    required this.wsAddressCode,
    required this.postCode,
    required this.countryCode,
    required this.cityCode,
    required this.townCode,
    required this.districtCode,
    required this.provinceCode,
    required this.country,
    required this.city,
    required this.town,
    required this.district,
    required this.province,
    required this.mobilePhone,
    required this.homePhone,
    required this.company,
    required this.taxOffice,
    required this.taxNumber,
    required this.nationality,
    required this.identityNumber,
    required this.isCompanyActive,
    required this.status,
    required this.partner,
    required this.partnerparams,
    required this.hasEInvoice,
    required this.updatetime,
    required this.statusDelivery,
    required this.isDeliveryAddress,
    required this.isInvoiceAddress,
  });

  final String id;
  final String customerId;
  final String sessionId;
  final String title;
  final String fullname;
  final String address;
  final String wsAddressCode;
  final String postCode;
  final String countryCode;
  final String cityCode;
  final String townCode;
  final String districtCode;
  final String provinceCode;
  final String country;
  final String city;
  final String town;
  final String district;
  final String province;
  final String mobilePhone;
  final String homePhone;
  final String company;
  final String taxOffice;
  final String taxNumber;
  final String nationality;
  final String identityNumber;
  final String isCompanyActive;
  final String status;
  final String partner;
  final String partnerparams;
  final String hasEInvoice;
  final String updatetime;
  final int statusDelivery;
  final bool isDeliveryAddress;
  final bool isInvoiceAddress;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    customerId: json["customer_id"],
    sessionId: json["session_id"],
    title: json["title"],
    fullname: json["fullname"],
    address: json["address"],
    wsAddressCode: json["ws_address_code"],
    postCode: json["post_code"],
    countryCode: json["country_code"],
    cityCode: json["city_code"],
    townCode: json["town_code"],
    districtCode: json["district_code"],
    provinceCode: json["province_code"],
    country: json["country"],
    city: json["city"],
    town: json["town"],
    district: json["district"],
    province: json["province"],
    mobilePhone: json["mobile_phone"],
    homePhone: json["home_phone"],
    company: json["company"],
    taxOffice: json["tax_office"],
    taxNumber: json["tax_number"],
    nationality: json["nationality"],
    identityNumber: json["identity_number"],
    isCompanyActive: json["is_company_active"],
    status: json["status"],
    partner: json["partner"],
    partnerparams: json["partnerparams"],
    hasEInvoice: json["has_e_invoice"],
    updatetime: json["updatetime"],
    statusDelivery: json["statusDelivery"],
    isDeliveryAddress: json["is_delivery_address"],
    isInvoiceAddress: json["is_invoice_address"],
  );


}

class Summary {
  Summary({
    required this.totalRecordCount,
  });

  final int totalRecordCount;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRecordCount: json["totalRecordCount"],
  );

}
