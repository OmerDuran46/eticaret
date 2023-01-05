

// ignore_for_file: prefer_null_aware_operators

class GetCartModel {
  GetCartModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final Data? data;
  final List<Message>? message;
  final Summary? summary;

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
  );


}

class Data {
  Data({
    required this.customerId,
    required this.customerCode,
    required this.cartTotalCount,
    required this.targetCurrency,
    required this.isBuyButtonActive,
    required this.isGiftNoteActive,
    required this.isOrderNoteActive,
    required this.giftPackageCost,
    required this.isConfirmationBoxActive,
    required this.displayConfirmationBox,
    required this.confirmationText,
    required this.priceGiftPackage,
    required this.pricePersonalization,
    required this.isCampaignActive,
    required this.priceCampaign,
    required this.selectedCampaignList,
    required this.campaignProductId,
    required this.campaignList,
    required this.isDiscountCouponActive,
    required this.priceCoupon,
    required this.priceCart,
    required this.cargoPaymentType,
    required this.isCargoFree,
    required this.displayCargo,
    required this.priceGeneral,
    required this.error,
    required this.cartMessage,
    required this.minOrderPrice,
    required this.favorCoupon,
    required this.isFavorCouponActive,
    required this.isDeliveryDateActive,
    required this.isDeliveryHourActive,
    required this.deliveryHourText,
    required this.deliveryDate,
    required this.deliveryHour,
    required this.isMemberLoggedIn,
    required this.products,
  });

  final String customerId;
  final String customerCode;
  final int cartTotalCount;
  final String targetCurrency;
  final bool isBuyButtonActive;
  final bool isGiftNoteActive;
  final bool isOrderNoteActive;
  final int giftPackageCost;
  final bool isConfirmationBoxActive;
  final bool displayConfirmationBox;
  final String confirmationText;
  final int priceGiftPackage;
  final int pricePersonalization;
  final bool isCampaignActive;
  final int priceCampaign;
  final List<dynamic>? selectedCampaignList;
  final int campaignProductId;
  final List<dynamic>? campaignList;
  final bool isDiscountCouponActive;
  final int priceCoupon;
  final double priceCart;
  final int cargoPaymentType;
  final bool isCargoFree;
  final bool displayCargo;
  final double priceGeneral;
  final String error;
  final String cartMessage;
  final int minOrderPrice;
  final String favorCoupon;
  final bool isFavorCouponActive;
  final bool isDeliveryDateActive;
  final bool isDeliveryHourActive;
  final String deliveryHourText;
  final String deliveryDate;
  final String deliveryHour;
  final bool isMemberLoggedIn;
  final List<Product>? products;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerId: json["customer_id"],
    customerCode: json["customer_code"],
    cartTotalCount: json["cart_total_count"],
    targetCurrency: json["target_currency"],
    isBuyButtonActive: json["is_buy_button_active"],
    isGiftNoteActive: json["is_gift_note_active"],
    isOrderNoteActive: json["is_order_note_active"],
    giftPackageCost: json["gift_package_cost"],
    isConfirmationBoxActive: json["is_confirmation_box_active"],
    displayConfirmationBox: json["display_confirmation_box"],
    confirmationText: json["confirmation_text"],
    priceGiftPackage: json["price_gift_package"],
    pricePersonalization: json["price_personalization"],
    isCampaignActive: json["is_campaign_active"],
    priceCampaign: json["price_campaign"],
    selectedCampaignList: json["selected_campaign_list"] == null ? null : List<dynamic>.from(json["selected_campaign_list"].map((x) => x)),
    campaignProductId: json["campaign_product_id"],
    campaignList: json["campaign_list"] == null ? null : List<dynamic>.from(json["campaign_list"].map((x) => x)),
    isDiscountCouponActive: json["is_discount_coupon_active"],
    priceCoupon: json["price_coupon"],
    priceCart: json["price_cart"] == null ? null : json["price_cart"].toDouble(),
    cargoPaymentType: json["cargo_payment_type"],
    isCargoFree: json["is_cargo_free"],
    displayCargo: json["display_cargo"],
    priceGeneral: json["price_general"] == null ? null : json["price_general"].toDouble(),
    error: json["error"],
    cartMessage: json["cart_message"],
    minOrderPrice: json["min_order_price"],
    favorCoupon: json["favor_coupon"],
    isFavorCouponActive: json["is_favor_coupon_active"],
    isDeliveryDateActive: json["is_delivery_date_active"],
    isDeliveryHourActive: json["is_delivery_hour_active"],
    deliveryHourText: json["delivery_hour_text"],
    deliveryDate: json["delivery_date"],
    deliveryHour: json["delivery_hour"],
    isMemberLoggedIn: json["is_member_logged_in"],
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),

  );

}

class Hopi {
  Hopi({
    required this.status,
    required this.otherCampaign,
    required this.customer,
  });

  final int status;
  final int otherCampaign;
  final Customer? customer;

  factory Hopi.fromJson(Map<String, dynamic> json) => Hopi(
    status: json["status"],
    otherCampaign: json["otherCampaign"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

}

class Customer {
  Customer({
    required this.birdId,
    required this.customerId,
    required this.coinBalance,
    required this.joinedCampaigns,
    required this.provisionTokens,
    required this.signedIn,
    required this.coinAmount,
    required this.coinProvisionId,
    required this.coinOtpNeeded,
    required this.coinStartTime,
    required this.coinBenefitDiscount,
    required this.coinBenefitTotal,
    required this.campaignCode,
    required this.campaignName,
    required this.campaignDesc,
    required this.campaignBenefit,
    required this.campaignProducts,
    required this.campaignCargoFree,
    required this.koiCode,
    required this.oldKoiCode,
  });

  final dynamic birdId;
  final dynamic customerId;
  final dynamic coinBalance;
  final dynamic joinedCampaigns;
  final dynamic provisionTokens;
  final dynamic signedIn;
  final dynamic coinAmount;
  final dynamic coinProvisionId;
  final dynamic coinOtpNeeded;
  final dynamic coinStartTime;
  final dynamic coinBenefitDiscount;
  final dynamic coinBenefitTotal;
  final dynamic campaignCode;
  final dynamic campaignName;
  final dynamic campaignDesc;
  final dynamic campaignBenefit;
  final List<dynamic>? campaignProducts;
  final dynamic campaignCargoFree;
  final dynamic koiCode;
  final dynamic oldKoiCode;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    birdId: json["birdId"],
    customerId: json["customerId"],
    coinBalance: json["coinBalance"],
    joinedCampaigns: json["joinedCampaigns"],
    provisionTokens: json["provisionTokens"],
    signedIn: json["signedIn"],
    coinAmount: json["coinAmount"],
    coinProvisionId: json["coinProvisionId"],
    coinOtpNeeded: json["coinOtpNeeded"],
    coinStartTime: json["coinStartTime"],
    coinBenefitDiscount: json["coinBenefitDiscount"],
    coinBenefitTotal: json["coinBenefitTotal"],
    campaignCode: json["campaignCode"],
    campaignName: json["campaignName"],
    campaignDesc: json["campaignDesc"],
    campaignBenefit: json["campaignBenefit"],
    campaignProducts: json["campaignProducts"] == null ? null : List<dynamic>.from(json["campaignProducts"].map((x) => x)),
    campaignCargoFree: json["campaignCargoFree"],
    koiCode: json["koiCode"],
    oldKoiCode: json["oldKoiCode"],
  );


}

class Product {
  Product({
    required this.id,
    required this.cartIndex,
    required this.count,
    required this.orderNotes,
    required this.giftNotes,
    required this.isGiftPackageActive,
    required this.campaignName,
    required this.campaignPercent,
    required this.priceTotal,
    required this.priceSell,
    required this.priceNotDiscounted,
    required this.isDisplayDiscountedActive,
    required this.discountPercent,
    required this.vat,
    required this.targetCurrency,
    required this.title,
    required this.variantId,
    required this.variantName,
    required this.stock,
    required this.stockUnit,
    required this.stockUnitId,
    required this.stockIncrement,
    required this.image,
    required this.imageRatio,
    required this.displayVat,
    required this.minOrderCount,
    required this.updateDate,
    required this.currencyId,
    required this.currency,
  });

  final String id;
  final int cartIndex;
  final int count;
  final String orderNotes;
  final String giftNotes;
  final bool isGiftPackageActive;
  final String campaignName;
  final int campaignPercent;
  final double priceTotal;
  final double priceSell;
  final double priceNotDiscounted;
  final String isDisplayDiscountedActive;
  final int discountPercent;
  final int vat;
  final String targetCurrency;
  final String title;
  final int variantId;
  final String variantName;
  final int stock;
  final String stockUnit;
  final int stockUnitId;
  final int stockIncrement;
  final Image? image;
  final double imageRatio;
  final String displayVat;
  final dynamic minOrderCount;
  final dynamic updateDate;
  final String currencyId;
  final int currency;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    cartIndex: json["cart_index"],
    count: json["count"],
    orderNotes: json["order_notes"],
    giftNotes: json["gift_notes"],
    isGiftPackageActive: json["is_gift_package_active"],
    campaignName: json["campaign_name"],
    campaignPercent: json["campaign_percent"],
    priceTotal: json["price_total"] == null ? null : json["price_total"].toDouble(),
    priceSell: json["price_sell"] == null ? null : json["price_sell"].toDouble(),
    priceNotDiscounted: json["price_not_discounted"] == null ? null : json["price_not_discounted"].toDouble(),
    isDisplayDiscountedActive: json["is_display_discounted_active"],
    discountPercent: json["discount_percent"],
    vat: json["vat"],
    targetCurrency: json["target_currency"],
    title: json["title"],
    variantId: json["variant_id"],
    variantName: json["variant_name"],
    stock: json["stock"],
    stockUnit: json["stock_unit"],
    stockUnitId: json["stock_unit_id"],
    stockIncrement: json["stock_increment"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    imageRatio: json["image_ratio"] == null ? null : json["image_ratio"].toDouble(),
    displayVat: json["display_vat"],
    minOrderCount: json["min_order_count"],
    updateDate: json["update_date"],
    currencyId: json["currency_id"],
    currency: json["currency"],
  );


}

class Image {
  Image({
    required this.id,
    required this.small,
    required this.medium,
    required this.big,
    required this.title,
    required this.variantIds,
    required this.variantTypeId,
    required this.mediumWebpJpg,
  });

  final String id;
  final String small;
  final String medium;
  final String big;
  final String title;
  final List<dynamic>? variantIds;
  final String variantTypeId;
  final dynamic mediumWebpJpg;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    small: json["small"],
    medium: json["medium"],
    big: json["big"],
    title: json["title"],
    variantIds: json["variant_ids"] == null ? null : List<dynamic>.from(json["variant_ids"].map((x) => x)),
    variantTypeId: json["variant_type_id"],
    mediumWebpJpg: json["medium_webp_jpg"],
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
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: json["text"] == null ? null : List<String>.from(json["text"].map((x) => x)),
    errorField: json["errorField"] == null ? null : List<dynamic>.from(json["errorField"].map((x) => x)),
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
