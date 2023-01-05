class GetOrdersModel {
  GetOrdersModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum> data;
  final List<Message> message;
  final Summary summary;

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => GetOrdersModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: Summary.fromJson(json["summary"]),
  );

}

class Datum {
  Datum({
    required this.orderId,
    required this.orderCode,
    required this.orderDate,
    required this.orderDateTimeStamp,
    required this.updateDate,
    required this.updateDateTimeStamp,
    required this.orderStatusId,
    required this.orderTotalPrice,
    required this.orderSubtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.currency,
    required this.siteDefaultCurrency,
    required this.language,
    required this.exchangeRate,
    required this.customerId,
    required this.customerCode,
    required this.customerUsername,
    required this.customerGroupId,
    required this.paymentTypeId,
    required this.paymentType,
    required this.bank,
    required this.bankTransactionVendor,
    required this.ccBank,
    required this.ccBankId,
    required this.installment,
    required this.installmentPlus,
    required this.paymentInfo,
    required this.cargoTrackingCode,
    required this.cargoId,
    required this.cargoCode,
    required this.cargo,
    required this.cargoServiceDate,
    required this.cargoServiceTime,
    required this.cargoPaymentMethod,
    required this.customerName,
    required this.customerPhone,
    required this.serviceName,
    required this.serviceChargeWithoutVat,
    required this.serviceChargeWithVat,
    required this.serviceVatPercent,
    required this.cargoChargeWithoutVat,
    required this.cargoChargeWithVat,
    required this.cargoChargeWithoutDiscount,
    required this.cargoVatPercent,
    required this.representativeCode,
    required this.representativeName,
    required this.application,
    required this.wsOrderNumber,
    required this.campaignIds,
    required this.campaignDetail,
    required this.approveType,
    required this.customerIp,
    required this.nonMemberShopping,
    required this.hopiCoin,
    required this.isTransferred,
    required this.transactionId,
    required this.shipmentTime,
    required this.shipmentDeliveryTime,
    required this.dutyServiceRate,
    required this.dutyServiceTotal,
    required this.isDeleted,
    required this.generalOrderNote,
    required this.storeId,
    required this.storeName,
    required this.isEarchive,
    required this.earchiveUuid,
    required this.customData,
    required this.customData2,
    required this.customData3,
    required this.customData4,
    required this.deliveryDateTimeStamp,
    required this.deliveryDate,
    required this.voucherCode,
    required this.voucherDiscountType,
    required this.voucherDiscountValue,
    required this.orderStatus,
    required this.orderStatusTranslated,
    required this.invoiceAddressId,
    required this.customerInvoiceAdressId,
    required this.invoiceType,
    required this.invoiceName,
    required this.invoiceCompany,
    required this.invoiceTaxdep,
    required this.invoiceTaxno,
    required this.invoiceMobile,
    required this.invoiceTel,
    required this.invoiceOtherPhone,
    required this.invoiceAddress,
    required this.invoiceCity,
    required this.invoiceCityCode,
    required this.invoiceTown,
    required this.invoiceTownCode,
    required this.invoiceNeighbourhood,
    required this.invoiceNeighbourhoodCode,
    required this.datumInvoiceCountry,
    required this.invoiceCountry,
    required this.invoiceCountryCode,
    required this.invoiceProvince,
    required this.invoiceProvinceCode,
    required this.invoiceZipcode,
    required this.hasEInvoice,
    required this.deliveryAddressId,
    required this.customerDeliveryAdressId,
    required this.deliveryName,
    required this.deliveryMobile,
    required this.deliveryTel,
    required this.deliveryAddress,
    required this.deliveryCity,
    required this.deliveryCityCode,
    required this.deliveryTown,
    required this.deliveryTownCode,
    required this.deliveryNeighbourhood,
    required this.deliveryNeighbourhoodCode,
    required this.deliveryCountry,
    required this.deliveryCountryCode,
    required this.deliveryProvince,
    required this.deliveryProvinceCode,
    required this.deliveryZipcode,
    required this.hopiProvisionId,
    required this.hopiUsed,
    required this.cargoServiceName,
    required this.eInvoiceUrl,
    required this.orderDetails,
  });

  final String orderId;
  final String orderCode;
  final DateTime orderDate;
  final String orderDateTimeStamp;
  final DateTime updateDate;
  final String updateDateTimeStamp;
  final String orderStatusId;
  final String orderTotalPrice;
  final String orderSubtotal;
  final String discountTotal;
  final String taxTotal;
  final String currency;
  final String siteDefaultCurrency;
  final String language;
  final String exchangeRate;
  final String customerId;
  final String customerCode;
  final String customerUsername;
  final String customerGroupId;
  final String paymentTypeId;
  final String paymentType;
  final String bank;
  final String bankTransactionVendor;
  final String ccBank;
  final String ccBankId;
  final String installment;
  final String installmentPlus;
  final String paymentInfo;
  final String cargoTrackingCode;
  final String cargoId;
  final String cargoCode;
  final String cargo;
  final String cargoServiceDate;
  final String cargoServiceTime;
  final String cargoPaymentMethod;
  final String customerName;
  final String customerPhone;
  final String serviceName;
  final int serviceChargeWithoutVat;
  final int serviceChargeWithVat;
  final String serviceVatPercent;
  final String cargoChargeWithoutVat;
  final String cargoChargeWithVat;
  final String cargoChargeWithoutDiscount;
  final String cargoVatPercent;
  final String representativeCode;
  final String representativeName;
  final String application;
  final String wsOrderNumber;
  final String campaignIds;
  final String campaignDetail;
  final String approveType;
  final String customerIp;
  final String nonMemberShopping;
  final String hopiCoin;
  final String isTransferred;
  final String transactionId;
  final String shipmentTime;
  final String shipmentDeliveryTime;
  final String dutyServiceRate;
  final String dutyServiceTotal;
  final String isDeleted;
  final String generalOrderNote;
  final String storeId;
  final String storeName;
  final String isEarchive;
  final String earchiveUuid;
  final String customData;
  final String customData2;
  final String customData3;
  final String customData4;
  final String deliveryDateTimeStamp;
  final DateTime deliveryDate;
  final String voucherCode;
  final String voucherDiscountType;
  final String voucherDiscountValue;
  final String orderStatus;
  final String orderStatusTranslated;
  final String invoiceAddressId;
  final String customerInvoiceAdressId;
  final int invoiceType;
  final String invoiceName;
  final String invoiceCompany;
  final String invoiceTaxdep;
  final String invoiceTaxno;
  final String invoiceMobile;
  final String invoiceTel;
  final String invoiceOtherPhone;
  final String invoiceAddress;
  final String invoiceCity;
  final String invoiceCityCode;
  final String invoiceTown;
  final String invoiceTownCode;
  final String invoiceNeighbourhood;
  final String invoiceNeighbourhoodCode;
  final String datumInvoiceCountry;
  final String invoiceCountry;
  final String invoiceCountryCode;
  final String invoiceProvince;
  final String invoiceProvinceCode;
  final String invoiceZipcode;
  final bool hasEInvoice;
  final String deliveryAddressId;
  final String customerDeliveryAdressId;
  final String deliveryName;
  final String deliveryMobile;
  final String deliveryTel;
  final String deliveryAddress;
  final String deliveryCity;
  final String deliveryCityCode;
  final String deliveryTown;
  final String deliveryTownCode;
  final String deliveryNeighbourhood;
  final String deliveryNeighbourhoodCode;
  final String deliveryCountry;
  final String deliveryCountryCode;
  final String deliveryProvince;
  final String deliveryProvinceCode;
  final String deliveryZipcode;
  final String hopiProvisionId;
  final int hopiUsed;
  final String cargoServiceName;
  final String eInvoiceUrl;
  final List<OrderDetail> orderDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["OrderId"],
    orderCode: json["OrderCode"],
    orderDate: DateTime.parse(json["OrderDate"]),
    orderDateTimeStamp: json["OrderDateTimeStamp"],
    updateDate: DateTime.parse(json["UpdateDate"]),
    updateDateTimeStamp: json["UpdateDateTimeStamp"],
    orderStatusId: json["OrderStatusId"],
    orderTotalPrice: json["OrderTotalPrice"],
    orderSubtotal: json["OrderSubtotal"],
    discountTotal: json["DiscountTotal"],
    taxTotal: json["TaxTotal"],
    currency: json["Currency"],
    siteDefaultCurrency: json["SiteDefaultCurrency"],
    language: json["Language"],
    exchangeRate: json["ExchangeRate"],
    customerId: json["CustomerId"],
    customerCode: json["CustomerCode"],
    customerUsername: json["CustomerUsername"],
    customerGroupId: json["CustomerGroupId"],
    paymentTypeId: json["PaymentTypeId"],
    paymentType: json["PaymentType"],
    bank: json["Bank"],
    bankTransactionVendor: json["BankTransactionVendor"],
    ccBank: json["CCBank"],
    ccBankId: json["CCBankId"],
    installment: json["Installment"],
    installmentPlus: json["InstallmentPlus"],
    paymentInfo: json["PaymentInfo"],
    cargoTrackingCode: json["CargoTrackingCode"],
    cargoId: json["CargoId"],
    cargoCode: json["CargoCode"],
    cargo: json["Cargo"],
    cargoServiceDate: json["CargoServiceDate"],
    cargoServiceTime: json["CargoServiceTime"],
    cargoPaymentMethod: json["CargoPaymentMethod"],
    customerName: json["CustomerName"],
    customerPhone: json["CustomerPhone"],
    serviceName: json["ServiceName"],
    serviceChargeWithoutVat: json["ServiceChargeWithoutVat"],
    serviceChargeWithVat: json["ServiceChargeWithVat"],
    serviceVatPercent: json["ServiceVatPercent"],
    cargoChargeWithoutVat: json["CargoChargeWithoutVat"],
    cargoChargeWithVat: json["CargoChargeWithVat"],
    cargoChargeWithoutDiscount: json["CargoChargeWithoutDiscount"],
    cargoVatPercent: json["CargoVatPercent"],
    representativeCode: json["RepresentativeCode"],
    representativeName: json["RepresentativeName"],
    application: json["Application"],
    wsOrderNumber: json["WsOrderNumber"],
    campaignIds: json["CampaignIds"],
    campaignDetail: json["CampaignDetail"],
    approveType: json["ApproveType"],
    customerIp: json["CustomerIp"],
    nonMemberShopping: json["NonMemberShopping"],
    hopiCoin: json["HopiCoin"],
    isTransferred: json["IsTransferred"],
    transactionId: json["TransactionId"],
    shipmentTime: json["ShipmentTime"],
    shipmentDeliveryTime: json["ShipmentDeliveryTime"],
    dutyServiceRate: json["DutyServiceRate"],
    dutyServiceTotal: json["DutyServiceTotal"],
    isDeleted: json["IsDeleted"],
    generalOrderNote: json["GeneralOrderNote"],
    storeId: json["StoreId"],
    storeName: json["StoreName"],
    isEarchive: json["IsEarchive"],
    earchiveUuid: json["EarchiveUuid"],
    customData: json["CustomData"],
    customData2: json["CustomData2"],
    customData3: json["CustomData3"],
    customData4: json["CustomData4"],
    deliveryDateTimeStamp: json["DeliveryDateTimeStamp"],
    deliveryDate: DateTime.parse(json["DeliveryDate"]),
    voucherCode: json["VoucherCode"],
    voucherDiscountType: json["VoucherDiscountType"],
    voucherDiscountValue: json["VoucherDiscountValue"],
    orderStatus: json["OrderStatus"],
    orderStatusTranslated: json["OrderStatusTranslated"],
    invoiceAddressId: json["InvoiceAddressId"],
    customerInvoiceAdressId: json["CustomerInvoiceAdressId"],
    invoiceType: json["InvoiceType"],
    invoiceName: json["InvoiceName"],
    invoiceCompany: json["InvoiceCompany"],
    invoiceTaxdep: json["InvoiceTaxdep"],
    invoiceTaxno: json["InvoiceTaxno"],
    invoiceMobile: json["InvoiceMobile"],
    invoiceTel: json["InvoiceTel"],
    invoiceOtherPhone: json["InvoiceOtherPhone"],
    invoiceAddress: json["InvoiceAddress"],
    invoiceCity: json["InvoiceCity"],
    invoiceCityCode: json["InvoiceCityCode"],
    invoiceTown: json["InvoiceTown"],
    invoiceTownCode: json["InvoiceTownCode"],
    invoiceNeighbourhood: json["InvoiceNeighbourhood"],
    invoiceNeighbourhoodCode: json["InvoiceNeighbourhoodCode"],
    datumInvoiceCountry: json["Invoice_country"],
    invoiceCountry: json["InvoiceCountry"],
    invoiceCountryCode: json["InvoiceCountryCode"],
    invoiceProvince: json["InvoiceProvince"],
    invoiceProvinceCode: json["InvoiceProvinceCode"],
    invoiceZipcode: json["InvoiceZipcode"],
    hasEInvoice: json["HasEInvoice"],
    deliveryAddressId: json["DeliveryAddressId"],
    customerDeliveryAdressId: json["CustomerDeliveryAdressId"],
    deliveryName: json["DeliveryName"],
    deliveryMobile: json["DeliveryMobile"],
    deliveryTel: json["DeliveryTel"],
    deliveryAddress: json["DeliveryAddress"],
    deliveryCity: json["DeliveryCity"],
    deliveryCityCode: json["DeliveryCityCode"],
    deliveryTown: json["DeliveryTown"],
    deliveryTownCode: json["DeliveryTownCode"],
    deliveryNeighbourhood: json["DeliveryNeighbourhood"],
    deliveryNeighbourhoodCode: json["DeliveryNeighbourhoodCode"],
    deliveryCountry: json["DeliveryCountry"],
    deliveryCountryCode: json["DeliveryCountryCode"],
    deliveryProvince: json["DeliveryProvince"],
    deliveryProvinceCode: json["DeliveryProvinceCode"],
    deliveryZipcode: json["DeliveryZipcode"],
    hopiProvisionId: json["HopiProvisionId"],
    hopiUsed: json["HopiUsed"],
    cargoServiceName: json["CargoServiceName"],
    eInvoiceUrl: json["EInvoiceUrl"],
    orderDetails: List<OrderDetail>.from(json["OrderDetails"].map((x) => OrderDetail.fromJson(x))),
  );

}

class OrderDetail {
  OrderDetail({
    required this.orderProductId,
    required this.productId,
    required this.productCode,
    required this.productName,
    required this.quantity,
    required this.stockUnit,
    required this.stockUnitId,
    required this.buyingPrice,
    required this.vat,
    required this.sellingCurrency,
    required this.sellingCartPrice,
    required this.sellingPriceWithoutDiscount,
    required this.sellingPriceWithoutVat,
    required this.sellingPrice,
    required this.sellingCurrencyExchangeRate,
    required this.barcode,
    required this.brand,
    required this.defaultCategoryId,
    required this.subProductId,
    required this.subProductCode,
    required this.property1,
    required this.property2,
    required this.personalization,
    required this.orderNote,
    required this.imageUrl,
    required this.giftPackage,
    required this.giftNote,
    required this.postStatus,
    required this.postNote,
    required this.supplyStatus,
    required this.supplyNote,
    required this.ownerId,
    required this.isPackage,
    required this.supplier,
    required this.supplierProductCode,
    required this.refundCount,
    required this.stockField,
    required this.imageUrlBig,
    required this.increasePercent,
    required this.discountPercent,
  });

  final String orderProductId;
  final String productId;
  final String productCode;
  final String productName;
  final String quantity;
  final String stockUnit;
  final String stockUnitId;
  final String buyingPrice;
  final String vat;
  final String sellingCurrency;
  final String sellingCartPrice;
  final String sellingPriceWithoutDiscount;
  final String sellingPriceWithoutVat;
  final String sellingPrice;
  final String sellingCurrencyExchangeRate;
  final String barcode;
  final String brand;
  final String defaultCategoryId;
  final String subProductId;
  final String subProductCode;
  final String property1;
  final String property2;
  final String personalization;
  final String orderNote;
  final String imageUrl;
  final String giftPackage;
  final String giftNote;
  final String postStatus;
  final String postNote;
  final String supplyStatus;
  final String supplyNote;
  final String ownerId;
  final String isPackage;
  final String supplier;
  final String supplierProductCode;
  final String refundCount;
  final String stockField;
  final String imageUrlBig;
  final int increasePercent;
  final int discountPercent;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    orderProductId: json["OrderProductId"],
    productId: json["ProductId"],
    productCode: json["ProductCode"],
    productName: json["ProductName"],
    quantity: json["Quantity"],
    stockUnit: json["StockUnit"],
    stockUnitId: json["StockUnitId"],
    buyingPrice: json["BuyingPrice"],
    vat: json["Vat"],
    sellingCurrency: json["SellingCurrency"],
    sellingCartPrice: json["SellingCartPrice"],
    sellingPriceWithoutDiscount: json["SellingPriceWithoutDiscount"],
    sellingPriceWithoutVat: json["SellingPriceWithoutVat"],
    sellingPrice: json["SellingPrice"],
    sellingCurrencyExchangeRate: json["SellingCurrencyExchangeRate"],
    barcode: json["Barcode"],
    brand: json["Brand"],
    defaultCategoryId: json["DefaultCategoryId"],
    subProductId: json["SubProductId"],
    subProductCode: json["SubProductCode"],
    property1: json["Property1"],
    property2: json["Property2"],
    personalization: json["Personalization"],
    orderNote: json["OrderNote"],
    imageUrl: json["ImageUrl"],
    giftPackage: json["GiftPackage"],
    giftNote: json["GiftNote"],
    postStatus: json["PostStatus"],
    postNote: json["PostNote"],
    supplyStatus: json["SupplyStatus"],
    supplyNote: json["SupplyNote"],
    ownerId: json["OwnerId"],
    isPackage: json["IsPackage"],
    supplier: json["Supplier"],
    supplierProductCode: json["SupplierProductCode"],
    refundCount: json["RefundCount"],
    stockField: json["StockField"],
    imageUrlBig: json["ImageUrlBig"],
    increasePercent: json["IncreasePercent"],
    discountPercent: json["DiscountPercent"],
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

  final dynamic type;
  final dynamic code;
  final int index;
  final String id;
  final String subid;
  final List<dynamic> text;
  final List<dynamic> errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: List<dynamic>.from(json["text"].map((x) => x)),
    errorField: List<dynamic>.from(json["errorField"].map((x) => x)),
  );
  
}

class Summary {
  Summary({
    required this.totalRecordCount,
    required this.primaryKey,
  });

  final String totalRecordCount;
  final String primaryKey;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRecordCount: json["totalRecordCount"],
    primaryKey: json["primaryKey"],
  );

 
}
