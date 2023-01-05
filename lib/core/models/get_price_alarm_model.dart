class GetPriceAlarmModel {
  GetPriceAlarmModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum> data;
  final List<Message> message;
  final Summary summary;

  factory GetPriceAlarmModel.fromJson(Map<String, dynamic> json) => GetPriceAlarmModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: Summary.fromJson(json["summary"]),
  );

}

class Datum {
  Datum({
    required this.alarmId,
    required this.productId,
    required this.subProductId,
    required this.customerId,
    required this.currentPrice,
    required this.alarmPrice,
    required this.currency,
    required this.vatIncluded,
    required this.alarmDay,
    required this.recordTime,
    required this.alarmType,
    required this.stockLimit,
    required this.isMailSend,
    required this.isSmsSend,
    required this.isMobilePushSend,
    required this.isWebPushSend,
    required this.remainingDay,
    required this.productData,
  });

  final String alarmId;
  final String productId;
  final String subProductId;
  final String customerId;
  final double currentPrice;
  final int alarmPrice;
  final String currency;
  final String vatIncluded;
  final String alarmDay;
  final int recordTime;
  final String alarmType;
  final String stockLimit;
  final String isMailSend;
  final String isSmsSend;
  final String isMobilePushSend;
  final String isWebPushSend;
  final int remainingDay;
  final ProductData productData;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    alarmId: json["AlarmId"],
    productId: json["ProductId"],
    subProductId: json["SubProductId"],
    customerId: json["CustomerId"],
    currentPrice: json["CurrentPrice"].toDouble(),
    alarmPrice: json["AlarmPrice"],
    currency: json["Currency"],
    vatIncluded: json["VatIncluded"],
    alarmDay: json["AlarmDay"],
    recordTime: json["RecordTime"],
    alarmType: json["AlarmType"],
    stockLimit: json["StockLimit"],
    isMailSend: json["IsMailSend"],
    isSmsSend: json["IsSmsSend"],
    isMobilePushSend: json["IsMobilePushSend"],
    isWebPushSend: json["IsWebPushSend"],
    remainingDay: json["RemainingDay"],
    productData: ProductData.fromJson(json["ProductData"]),
  );

}

class ProductData {
  ProductData({
    required this.id,
    required this.variantFeature1List,
    required this.variantFeature2List,
    required this.title,
    required this.isNewProduct,
    required this.isActive,
    required this.variantId,
    required this.categoryId,
    required this.numeric1,
    required this.categoryIdPath,
    required this.categoryIds,
    required this.priceSell,

    required this.priceNotDiscounted,
    required this.supplierProductCode,
    required this.currencyId,
    required this.vat,
    required this.hasImage,
    required this.hasVariant,
    required this.displayVat,
    required this.brand,
    required this.brandId,
    required this.brandUrl,
    required this.brandImage,
    required this.model,
    required this.modelId,
    required this.stock,
    required this.stockUnit,
    required this.stockUnitId,
    required this.cbm,
    required this.stockIncrement,
    required this.productCode,
    required this.shortDescription,
    required this.additionalField1,
    required this.additionalField2,
    required this.additionalField3,
    required this.barcode,
    required this.storeId,
    required this.isDiscountActive,
    required this.isDisplayDiscountedActive,
    required this.discountPercent,
    required this.discountPercentRaw,
    required this.cargoFree,
    required this.cargoFreeMember,
    required this.cargoFreeVendor,
    required this.cargoFreeThis,
    required this.deliveryTime,
    required this.registrationDate,
    required this.minSaleCount,
    required this.maxSaleCount,
    required this.isCargoFree,
    required this.maxOrderCount,
    required this.categoryUrl,
    required this.categoryName,
    required this.categoryPath,
    required this.filterCategoryId,
    required this.url,
    required this.modelUrl,
    required this.inStock,
    required this.isDisplayProduct,
    required this.variantName,
    required this.variantFeature1Title,
    required this.variantFeature2Title,
    required this.showVendor,
    required this.showPromotion,
    required this.activeOnGroups,
    required this.isMultipleDiscountActive,
    required this.commentRank,
    required this.commentCount,
    required this.s1,
    required this.symbolData1,
    required this.symbolTag1,
    required this.s2,
    required this.symbolData2,
    required this.symbolTag2,
    required this.s3,
    required this.symbolData3,
    required this.symbolTag3,
    required this.s4,
    required this.symbolData4,
    required this.symbolTag4,
    required this.s5,
    required this.symbolData5,
    required this.symbolTag5,
    required this.s6,
    required this.symbolData6,
    required this.symbolTag6,
    required this.s7,
    required this.symbolData7,
    required this.symbolTag7,
    required this.s8,
    required this.symbolData8,
    required this.symbolTag8,
    required this.s9,
    required this.symbolData9,
    required this.symbolTag9,
    required this.s10,
    required this.symbolData10,
    required this.symbolTag10,
    required this.subscribe,
    required this.subscribeFrequencyList,
    required this.subscribeDiscountRate,
    required this.variantCode,
    required this.subProductCode,
    required this.deal,
    required this.dealStartDate,
    required this.dealEndDate,
    required this.priceGuest,
    required this.imageList,
    required this.image,
    required this.imageCount,
    required this.imageRatio,
    required this.priceCreditCart,
    required this.priceMoneyOrder,
    required this.moneyOrderPercent,
    required this.isMoneyOrderActive,
    required this.currency,
    required this.targetCurrency,
    required this.priceSellDefault,
    required this.priceRaw,
    required this.targetCurrencyOriginal,

    required this.variants,
    required this.combinationId,
    required this.newestSort,
    required this.hasMagnifier,
    required this.supplierId,
    required this.gender,
    required this.multipleDiscount,
    required this.personalizationId,
    required this.isPersonalizationActive,
    required this.canAddCartInList,
    required this.detail,
    required this.documentInfo,
    required this.warrantyInfo,
    required this.deliveryInfo,
    required this.warehouse,
    required this.deliveryDay,
    required this.isVideoActive,
    required this.notes,
    required this.tags,
    required this.isOrderNoteActive,
    required this.isCashPointActive,
    required this.cashPoint,
    required this.relatedProductsIds1,
    required this.relatedProductsIds2,
    required this.relatedProductsIds3,
    required this.relatedProductsIds1Count,
    required this.relatedProductsIds2Count,
    required this.relatedProductsIds3Count,
    required this.isRelatedProductsActive,
    required this.isPopupPhotoActive,
    required this.minOrderCount,
  });

  final String id;
  final List<dynamic> variantFeature1List;
  final List<dynamic> variantFeature2List;
  final String title;
  final String isNewProduct;
  final String isActive;
  final dynamic variantId;
  final String categoryId;
  final int numeric1;
  final String categoryIdPath;
  final String categoryIds;
  final dynamic priceSell;
  final double priceNotDiscounted;
  final String supplierProductCode;
  final String currencyId;
  final int vat;
  final String hasImage;
  final int hasVariant;
  final String displayVat;
  final String brand;
  final String brandId;
  final String brandUrl;
  final String brandImage;
  final String model;
  final String modelId;
  final int stock;
  final String stockUnit;
  final String stockUnitId;
  final String cbm;
  final int stockIncrement;
  final String productCode;
  final String shortDescription;
  final String additionalField1;
  final String additionalField2;
  final String additionalField3;
  final String barcode;
  final String storeId;
  final int isDiscountActive;
  final String isDisplayDiscountedActive;
  final int discountPercent;
  final int discountPercentRaw;
  final String cargoFree;
  final String cargoFreeMember;
  final String cargoFreeVendor;
  final String cargoFreeThis;
  final String deliveryTime;
  final int registrationDate;
  final String minSaleCount;
  final String maxSaleCount;
  final String isCargoFree;
  final int maxOrderCount;
  final String categoryUrl;
  final String categoryName;
  final String categoryPath;
  final String filterCategoryId;
  final String url;
  final String modelUrl;
  final bool inStock;
  final String isDisplayProduct;
  final String variantName;
  final String variantFeature1Title;
  final String variantFeature2Title;
  final String showVendor;
  final String showPromotion;
  final String activeOnGroups;
  final int isMultipleDiscountActive;
  final String commentRank;
  final String commentCount;
  final String s1;
  final String symbolData1;
  final String symbolTag1;
  final String s2;
  final String symbolData2;
  final String symbolTag2;
  final String s3;
  final String symbolData3;
  final String symbolTag3;
  final String s4;
  final String symbolData4;
  final String symbolTag4;
  final String s5;
  final String symbolData5;
  final String symbolTag5;
  final String s6;
  final String symbolData6;
  final String symbolTag6;
  final String s7;
  final String symbolData7;
  final String symbolTag7;
  final String s8;
  final String symbolData8;
  final String symbolTag8;
  final String s9;
  final String symbolData9;
  final String symbolTag9;
  final String s10;
  final String symbolData10;
  final String symbolTag10;
  final int subscribe;
  final List<String> subscribeFrequencyList;
  final int subscribeDiscountRate;
  final String variantCode;
  final String subProductCode;
  final dynamic deal;
  final String dealStartDate;
  final String dealEndDate;
  final double priceGuest;
  final List<Image> imageList;
  final Image image;
  final int imageCount;
  final double imageRatio;
  final double priceCreditCart;
  final double priceMoneyOrder;
  final int moneyOrderPercent;
  final bool isMoneyOrderActive;
  final int currency;
  final String targetCurrency;
  final double priceSellDefault;
  final double priceRaw;
  final String targetCurrencyOriginal;
  final List<Variant>? variants;
  final int combinationId;
  final int newestSort;
  final String hasMagnifier;
  final String supplierId;
  final String gender;
  final List<dynamic> multipleDiscount;
  final int personalizationId;
  final bool isPersonalizationActive;
  final bool canAddCartInList;
  final String detail;
  final String documentInfo;
  final String warrantyInfo;
  final String deliveryInfo;
  final String warehouse;
  final String deliveryDay;
  final String isVideoActive;
  final String notes;
  final List<dynamic> tags;
  final bool isOrderNoteActive;
  final bool isCashPointActive;
  final int cashPoint;
  final String relatedProductsIds1;
  final String relatedProductsIds2;
  final String relatedProductsIds3;
  final int relatedProductsIds1Count;
  final int relatedProductsIds2Count;
  final int relatedProductsIds3Count;
  final bool isRelatedProductsActive;
  final String isPopupPhotoActive;
  final dynamic minOrderCount;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    variantFeature1List: List<dynamic>.from(json["variant_feature1_list"].map((x) => x)),
    variantFeature2List: List<dynamic>.from(json["variant_feature2_list"].map((x) => x)),
    title: json["title"],
    isNewProduct: json["is_new_product"],
    isActive: json["is_active"],
    variantId: json["variant_id"],
    categoryId: json["category_id"],
    numeric1: json["numeric1"],
    categoryIdPath: json["category_id_path"],
    categoryIds: json["category_ids"],
    priceSell:json["price_sell"] is String?double.parse(json["price_sell"]):json["price_sell"],

    priceNotDiscounted: json["price_not_discounted"].toDouble(),
    supplierProductCode: json["supplier_product_code"],
    currencyId: json["currency_id"],
    vat: json["vat"],
    hasImage: json["has_image"],
    hasVariant: json["has_variant"],
    displayVat: json["display_vat"],
    brand: json["brand"],
    brandId: json["brand_id"],
    brandUrl: json["brand_url"],
    brandImage: json["brand_image"],
    model: json["model"],
    modelId: json["model_id"],
    stock: json["stock"],
    stockUnit: json["stock_unit"],
    stockUnitId: json["stock_unit_id"],
    cbm: json["cbm"],
    stockIncrement: json["stock_increment"],
    productCode: json["product_code"],
    shortDescription: json["short_description"],
    additionalField1: json["additional_field_1"],
    additionalField2: json["additional_field_2"],
    additionalField3: json["additional_field_3"],
    barcode: json["barcode"],
    storeId: json["store_id"],
    isDiscountActive: json["is_discount_active"],
    isDisplayDiscountedActive: json["is_display_discounted_active"],
    discountPercent: json["discount_percent"],
    discountPercentRaw: json["discount_percent_raw"],
    cargoFree: json["cargo_free"],
    cargoFreeMember: json["cargo_free_member"],
    cargoFreeVendor: json["cargo_free_vendor"],
    cargoFreeThis: json["cargo_free_this"],
    deliveryTime: json["delivery_time"],
    registrationDate: json["registration_date"],
    minSaleCount: json["min_sale_count"],
    maxSaleCount: json["max_sale_count"],
    isCargoFree: json["is_cargo_free"],
    maxOrderCount: json["max_order_count"],
    categoryUrl: json["category_url"],
    categoryName: json["category_name"],
    categoryPath: json["category_path"],
    filterCategoryId: json["filter_category_id"],
    url: json["url"],
    modelUrl: json["model_url"],
    inStock: json["in_stock"],
    isDisplayProduct: json["is_display_product"],
    variantName: json["variant_name"],
    variantFeature1Title: json["variant_feature1_title"],
    variantFeature2Title: json["variant_feature2_title"],
    showVendor: json["show_vendor"],
    showPromotion: json["show_promotion"],
    activeOnGroups: json["active_on_groups"],
    isMultipleDiscountActive: json["is_multiple_discount_active"],
    commentRank: json["comment_rank"],
    commentCount: json["comment_count"],
    s1: json["s1"],
    symbolData1: json["symbol_data1"],
    symbolTag1: json["symbol_tag1"],
    s2: json["s2"],
    symbolData2: json["symbol_data2"],
    symbolTag2: json["symbol_tag2"],
    s3: json["s3"],
    symbolData3: json["symbol_data3"],
    symbolTag3: json["symbol_tag3"],
    s4: json["s4"],
    symbolData4: json["symbol_data4"],
    symbolTag4: json["symbol_tag4"],
    s5: json["s5"],
    symbolData5: json["symbol_data5"],
    symbolTag5: json["symbol_tag5"],
    s6: json["s6"],
    symbolData6: json["symbol_data6"],
    symbolTag6: json["symbol_tag6"],
    s7: json["s7"],
    symbolData7: json["symbol_data7"],
    symbolTag7: json["symbol_tag7"],
    s8: json["s8"],
    symbolData8: json["symbol_data8"],
    symbolTag8: json["symbol_tag8"],
    s9: json["s9"],
    symbolData9: json["symbol_data9"],
    symbolTag9: json["symbol_tag9"],
    s10: json["s10"],
    symbolData10: json["symbol_data10"],
    symbolTag10: json["symbol_tag10"],
    subscribe: json["subscribe"],
    subscribeFrequencyList: List<String>.from(json["subscribe_frequency_list"].map((x) => x)),
    subscribeDiscountRate: json["subscribe_discount_rate"],
    variantCode: json["variant_code"],
    subProductCode: json["sub_product_code"],
    deal: json["deal"],
    dealStartDate: json["deal_start_date"],
    dealEndDate: json["deal_end_date"],
    priceGuest: json["price_guest"].toDouble(),
    imageList: List<Image>.from(json["image_list"].map((x) => Image.fromJson(x))),
    image: Image.fromJson(json["image"]),
    imageCount: json["image_count"],
    imageRatio: json["image_ratio"].toDouble(),
    priceCreditCart: json["price_credit_cart"].toDouble(),
    priceMoneyOrder: json["price_money_order"].toDouble(),
    moneyOrderPercent: json["money_order_percent"],
    isMoneyOrderActive: json["is_money_order_active"],
    currency: json["currency"],
    targetCurrency: json["target_currency"],
    priceSellDefault: json["price_sell_default"].toDouble(),
    priceRaw: json["price_raw"].toDouble(),
    targetCurrencyOriginal: json["target_currency_original"],

    variants: json["variants"] == null ? null : List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    combinationId: json["combination_id"],
    newestSort: json["newest_sort"],
    hasMagnifier: json["has_magnifier"],
    supplierId: json["supplier_id"],
    gender: json["gender"],
    multipleDiscount: List<dynamic>.from(json["multiple_discount"].map((x) => x)),
    personalizationId: json["personalization_id"],
    isPersonalizationActive: json["is_personalization_active"],
    canAddCartInList: json["can_add_cart_in_list"],
    detail: json["detail"],
    documentInfo: json["document_info"],
    warrantyInfo: json["warranty_info"],
    deliveryInfo: json["delivery_info"],
    warehouse: json["warehouse"],
    deliveryDay: json["delivery_day"],
    isVideoActive: json["is_video_active"],
    notes: json["notes"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    isOrderNoteActive: json["is_order_note_active"],
    isCashPointActive: json["is_cash_point_active"],
    cashPoint: json["cash_point"],
    relatedProductsIds1: json["related_products_ids1"],
    relatedProductsIds2: json["related_products_ids2"],
    relatedProductsIds3: json["related_products_ids3"],
    relatedProductsIds1Count: json["related_products_ids1_count"],
    relatedProductsIds2Count: json["related_products_ids2_count"],
    relatedProductsIds3Count: json["related_products_ids3_count"],
    isRelatedProductsActive: json["is_related_products_active"],
    isPopupPhotoActive: json["is_popup_photo_active"],
    minOrderCount: json["min_order_count"],
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
  final List<dynamic> variantIds;
  final String variantTypeId;
  final dynamic mediumWebpJpg;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    small: json["small"],
    medium: json["medium"],
    big: json["big"],
    title: json["title"],
    variantIds: List<dynamic>.from(json["variant_ids"].map((x) => x)),
    variantTypeId: json["variant_type_id"],
    mediumWebpJpg: json["medium_webp_jpg"],
  );


}

class Variant {
  Variant({
    required this.variantId,
    required this.typeId,
    required this.colorCode,
    required this.type,
    required this.inStock,
    required this.typeImage,
    required this.additionalInformation,
    required this.children,
  });

  final String variantId;
  final String typeId;
  final String colorCode;
  final String type;
  final bool inStock;
  final String typeImage;
  final String additionalInformation;
  final List<Child> children;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    variantId: json["variant_id"],
    typeId: json["type_id"],
    colorCode: json["color_code"],
    type: json["type"],
    inStock: json["in_stock"],
    typeImage: json["type_image"],
    additionalInformation: json["additional_information"],
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

}

class Child {
  Child({
    required this.typeId,
    required this.colorCode,
    required this.type,
    required this.variantId,
    required this.inStock,
    required this.stock,
    required this.barcode,
    required this.priceNotDiscounted,
    required this.price,
    required this.typeImage,
  });

  final String typeId;
  final String colorCode;
  final String type;
  final String variantId;
  final bool inStock;
  final String stock;
  final String barcode;
  final int priceNotDiscounted;
  final int price;
  final String typeImage;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    typeId: json["type_id"],
    colorCode: json["color_code"],
    type: json["type"],
    variantId: json["variant_id"],
    inStock: json["in_stock"],
    stock: json["stock"],
    barcode: json["barcode"],
    priceNotDiscounted: json["price_not_discounted"],
    price: json["price"],
    typeImage: json["type_image"],
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
  final List<String> text;
  final List<dynamic> errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: List<String>.from(json["text"].map((x) => x)),
    errorField: List<dynamic>.from(json["errorField"].map((x) => x)),
  );

}

class Summary {
  Summary({
    required this.totalCount,
  });

  final String totalCount;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalCount: json["totalCount"],
  );
}
