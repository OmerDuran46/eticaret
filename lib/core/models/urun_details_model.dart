class UrunDetailsModel {
  UrunDetailsModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum>? data;
  final List<Message>? message;
  final Summary? summary;

  factory UrunDetailsModel.fromJson(Map<String, dynamic> json) => UrunDetailsModel(
        success: json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
      );
}

class Datum {
  Datum({
    required this.productId,
    required this.productCode,
    required this.productName,
    required this.defaultCategoryId,
    required this.defaultCategoryName,
    required this.defaultCategoryPath,
    required this.supplierProductCode,
    required this.barcode,
    required this.stock,
    required this.isActive,
    required this.isApproved,
    required this.hasSubProducts,
    required this.comparisonSites,
    required this.vat,
    required this.currencyId,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.discountedPrice,
    required this.sellingPriceVatIncludedNoDiscount,
    required this.sellingPriceVatIncluded,
    required this.seoLink,
    required this.stockUnit,
    required this.stockUnitId,
    required this.searchKeywords,
    required this.displayOnHomepage,
    required this.isNewProduct,
    required this.onSale,
    required this.isDisplayProduct,
    required this.vendorDisplayOnly,
    required this.displayWithVat,
    required this.brand,
    required this.brandId,
    required this.brandLink,
    required this.model,
    required this.modelId,
    required this.supplierId,
    required this.customerGroupDisplay,
    required this.imageUrl,
    required this.magnifier,
    required this.memberMinOrder,
    required this.memberMaxOrder,
    required this.vendorMinOrder,
    required this.vendorMaxOrder,
    required this.shortDescription,
    required this.savingDate,
    required this.createDateTimeStamp,
    required this.createDate,
    required this.filterGroupId,
    required this.listNo,
    required this.ownerId,
    required this.updateDate,
    required this.stockUpdateDate,
    required this.priceUpdateDate,
    required this.isActiveUpdateDate,
    required this.stockUpdatePlatform,
    required this.priceUpdatePlatform,
    required this.isActiveUpdatePlatform,
    required this.gender,
    required this.opportunityProduct,
    required this.opportunityStart,
    required this.opportunityFinish,
    required this.ageGroup,
    required this.commentRate,
    required this.disablePaymentTypes,
    required this.disableCargoCompany,
    required this.statViews,
    required this.statRecommendations,
    required this.homepageSort,
    required this.mostSoldSort,
    required this.newestSort,
    required this.point,
    required this.eftRate,
    required this.numeric1,
    required this.hasImages,
    required this.defaultSubProductId,
    required this.relatedProductsIds1,
    required this.relatedProductsIds2,
    required this.relatedProductsIds3,
    required this.freeDeliveryMember,
    required this.freeDeliveryVendor,
    required this.freeDeliveryForProduct,
    required this.searchRank,
    required this.variantFeature1Title,
    required this.variantFeature2Title,
    required this.additional1,
    required this.additional2,
    required this.additional3,
    required this.currency,
    required this.supplier,
    required this.defaultCategoryCode,
    required this.imageUrlCdn,
    required this.details,
    required this.width,
    required this.height,
    required this.depth,
    required this.weight,
    required this.cbm,
    required this.warrantyInfo,
    required this.deliveryInfo,
    required this.deliveryTime,
    required this.productNote,
    required this.document,
    required this.warehouse,
    required this.personalizationId,
    required this.seoTitle,
    required this.seoKeywords,
    required this.seoDescription,
    required this.seoAyarId,
    required this.gtip,
    required this.countryOfOrigin,
    required this.commentCount,
    required this.imageUrls,
    required this.subProducts,
  });

  final String productId;
  final String productCode;
  final String productName;
  final String defaultCategoryId;
  final String defaultCategoryName;
  final String defaultCategoryPath;
  final String supplierProductCode;
  final String barcode;
  final String stock;
  final String isActive;
  final String isApproved;
  final String hasSubProducts;
  final String comparisonSites;
  final String vat;
  final String currencyId;
  final String buyingPrice;
  final String sellingPrice;
  final String discountedPrice;
  final String sellingPriceVatIncludedNoDiscount;
  final String sellingPriceVatIncluded;
  final String seoLink;
  final String stockUnit;
  final String stockUnitId;
  final String searchKeywords;
  final String displayOnHomepage;
  final String isNewProduct;
  final String onSale;
  final String isDisplayProduct;
  final String vendorDisplayOnly;
  final String displayWithVat;
  final String brand;
  final String brandId;
  final String brandLink;
  final String model;
  final String modelId;
  final String supplierId;
  final String customerGroupDisplay;
  final String imageUrl;
  final String magnifier;
  final String memberMinOrder;
  final String memberMaxOrder;
  final String vendorMinOrder;
  final String vendorMaxOrder;
  final String shortDescription;
  final String savingDate;
  final String createDateTimeStamp;
  final String createDate;
  final String filterGroupId;
  final String listNo;
  final String ownerId;
  final String updateDate;
  final String stockUpdateDate;
  final String priceUpdateDate;
  final String isActiveUpdateDate;
  final String stockUpdatePlatform;
  final String priceUpdatePlatform;
  final String isActiveUpdatePlatform;
  final String gender;
  final String opportunityProduct;
  final String opportunityStart;
  final String opportunityFinish;
  final String ageGroup;
  final String commentRate;
  final String disablePaymentTypes;
  final String disableCargoCompany;
  final String statViews;
  final String statRecommendations;
  final String homepageSort;
  final String mostSoldSort;
  final String newestSort;
  final String point;
  final String eftRate;
  final String numeric1;
  final String hasImages;
  final String defaultSubProductId;
  final String relatedProductsIds1;
  final String relatedProductsIds2;
  final String relatedProductsIds3;
  final String freeDeliveryMember;
  final String freeDeliveryVendor;
  final String freeDeliveryForProduct;
  final String searchRank;
  final String variantFeature1Title;
  final String variantFeature2Title;
  final String additional1;
  final String additional2;
  final String additional3;
  final String currency;
  final String supplier;
  final String defaultCategoryCode;
  final String imageUrlCdn;
  final String details;
  final String width;
  final String height;
  final String depth;
  final String weight;
  final String cbm;
  final String warrantyInfo;
  final String deliveryInfo;
  final String deliveryTime;
  final String productNote;
  final String document;
  final String warehouse;
  final String personalizationId;
  final String seoTitle;
  final String seoKeywords;
  final String seoDescription;
  final String seoAyarId;
  final String gtip;
  final String countryOfOrigin;
  final String commentCount;
  final List<ImageUrl>? imageUrls;
  final List<SubProduct>? subProducts;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["ProductId"],
        productCode: json["ProductCode"],
        productName: json["ProductName"],
        defaultCategoryId: json["DefaultCategoryId"],
        defaultCategoryName: json["DefaultCategoryName"],
        defaultCategoryPath: json["DefaultCategoryPath"],
        supplierProductCode: json["SupplierProductCode"],
        barcode: json["Barcode"],
        stock: json["Stock"],
        isActive: json["IsActive"],
        isApproved: json["IsApproved"],
        hasSubProducts: json["HasSubProducts"],
        comparisonSites: json["ComparisonSites"],
        vat: json["Vat"],
        currencyId: json["CurrencyId"],
        buyingPrice: json["BuyingPrice"],
        sellingPrice: json["SellingPrice"],
        discountedPrice: json["DiscountedPrice"],
        sellingPriceVatIncludedNoDiscount: json["SellingPriceVatIncludedNoDiscount"],
        sellingPriceVatIncluded: json["SellingPriceVatIncluded"],
        seoLink: json["SeoLink"],
        stockUnit: json["StockUnit"],
        stockUnitId: json["StockUnitId"],
        searchKeywords: json["SearchKeywords"],
        displayOnHomepage: json["DisplayOnHomepage"],
        isNewProduct: json["IsNewProduct"],
        onSale: json["OnSale"],
        isDisplayProduct: json["IsDisplayProduct"],
        vendorDisplayOnly: json["VendorDisplayOnly"],
        displayWithVat: json["DisplayWithVat"],
        brand: json["Brand"],
        brandId: json["BrandId"],
        brandLink: json["BrandLink"],
        model: json["Model"],
        modelId: json["ModelId"],
        supplierId: json["SupplierId"],
        customerGroupDisplay: json["CustomerGroupDisplay"],
        imageUrl: json["ImageUrl"],
        magnifier: json["Magnifier"],
        memberMinOrder: json["MemberMinOrder"],
        memberMaxOrder: json["MemberMaxOrder"],
        vendorMinOrder: json["VendorMinOrder"],
        vendorMaxOrder: json["VendorMaxOrder"],
        shortDescription: json["ShortDescription"],
        savingDate: json["SavingDate"],
        createDateTimeStamp: json["CreateDateTimeStamp"],
        createDate: json["CreateDate"],
        filterGroupId: json["FilterGroupId"],
        listNo: json["ListNo"],
        ownerId: json["OwnerId"],
        updateDate: json["UpdateDate"],
        stockUpdateDate: json["StockUpdateDate"],
        priceUpdateDate: json["PriceUpdateDate"],
        isActiveUpdateDate: json["IsActiveUpdateDate"],
        stockUpdatePlatform: json["StockUpdatePlatform"],
        priceUpdatePlatform: json["PriceUpdatePlatform"],
        isActiveUpdatePlatform: json["IsActiveUpdatePlatform"],
        gender: json["Gender"],
        opportunityProduct: json["OpportunityProduct"],
        opportunityStart: json["OpportunityStart"],
        opportunityFinish: json["OpportunityFinish"],
        ageGroup: json["AgeGroup"],
        commentRate: json["CommentRate"],
        disablePaymentTypes: json["DisablePaymentTypes"],
        disableCargoCompany: json["DisableCargoCompany"],
        statViews: json["StatViews"],
        statRecommendations: json["StatRecommendations"],
        homepageSort: json["HomepageSort"],
        mostSoldSort: json["MostSoldSort"],
        newestSort: json["NewestSort"],
        point: json["Point"],
        eftRate: json["EftRate"],
        numeric1: json["Numeric1"],
        hasImages: json["HasImages"],
        defaultSubProductId: json["DefaultSubProductId"],
        relatedProductsIds1: json["RelatedProductsIds1"],
        relatedProductsIds2: json["RelatedProductsIds2"],
        relatedProductsIds3: json["RelatedProductsIds3"],
        freeDeliveryMember: json["FreeDeliveryMember"],
        freeDeliveryVendor: json["FreeDeliveryVendor"],
        freeDeliveryForProduct: json["FreeDeliveryForProduct"],
        searchRank: json["SearchRank"],
        variantFeature1Title: json["VariantFeature1Title"],
        variantFeature2Title: json["VariantFeature2Title"],
        additional1: json["Additional1"],
        additional2: json["Additional2"],
        additional3: json["Additional3"],
        currency: json["Currency"],
        supplier: json["Supplier"],
        defaultCategoryCode: json["DefaultCategoryCode"],
        imageUrlCdn: json["ImageUrlCdn"],
        details: json["Details"] ?? "",
        width: json["Width"] ?? "",
        height: json["Height"] ?? "",
        depth: json["Depth"] ?? "",
        weight: json["Weight"] ?? "",
        cbm: json["CBM"] ?? "",
        warrantyInfo: json["WarrantyInfo"] ?? "",
        deliveryInfo: json["DeliveryInfo"] ?? "",
        deliveryTime: json["DeliveryTime"] ?? "",
        productNote: json["ProductNote"] ?? "",
        document: json["Document"] ?? "",
        warehouse: json["Warehouse"] ?? "",
        personalizationId: json["PersonalizationId"] ?? "",
        seoTitle: json["SeoTitle"] ?? "",
        seoKeywords: json["SeoKeywords"] ?? "",
        seoDescription: json["SeoDescription"] ?? "",
        seoAyarId: json["SeoAyarId"] ?? "",
        gtip: json["Gtip"] ?? "",
        countryOfOrigin: json["CountryOfOrigin"] ?? "",
        commentCount: json["CommentCount"] ?? "",
        imageUrls: json["ImageUrls"] == null ? null : List<ImageUrl>.from(json["ImageUrls"].map((x) => ImageUrl.fromJson(x))),
        subProducts: json["SubProducts"] == null ? null : List<SubProduct>.from(json["SubProducts"].map((x) => SubProduct.fromJson(x))),
      );
}

class SubProduct {
  SubProduct({
    required this.subProductId,
    required this.subProductCode,
    required this.mainProductId,
    required this.barcode,
    required this.property1,
    required this.property2,
    required this.propertyId1,
    required this.propertyId2,
    required this.property1ListNo,
    required this.property2ListNo,
    required this.stock,
    required this.cbm,
    required this.weight,
    required this.supplierSubProductCode,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.discountedSellingPrice,
    required this.vendorSellingPrice,
    required this.isActive,
    required this.hasImage,
    required this.ownerId,
    required this.ownerName,
    required this.point,
  });

  final String subProductId;
  final String subProductCode;
  final String mainProductId;
  final String barcode;
  final String property1;
  final String property2;
  final String propertyId1;
  final String propertyId2;
  final String property1ListNo;
  final String property2ListNo;
  final String stock;
  final String cbm;
  final String weight;
  final String supplierSubProductCode;
  final String buyingPrice;
  final String sellingPrice;
  final String discountedSellingPrice;
  final String vendorSellingPrice;
  final String isActive;
  final String hasImage;
  final String ownerId;
  final String ownerName;
  final String point;

  factory SubProduct.fromJson(Map<String, dynamic> json) => SubProduct(
        subProductId: json["SubProductId"],
        subProductCode: json["SubProductCode"],
        mainProductId: json["MainProductId"],
        barcode: json["Barcode"],
        property1: json["Property1"],
        property2: json["Property2"],
        propertyId1: json["PropertyId1"],
        propertyId2: json["PropertyId2"],
        property1ListNo: json["Property1ListNo"],
        property2ListNo: json["Property2ListNo"],
        stock: json["Stock"],
        cbm: json["CBM"],
        weight: json["Weight"],
        supplierSubProductCode: json["SupplierSubProductCode"],
        buyingPrice: json["BuyingPrice"],
        sellingPrice: json["SellingPrice"],
        discountedSellingPrice: json["DiscountedSellingPrice"],
        vendorSellingPrice: json["VendorSellingPrice"],
        isActive: json["IsActive"],
        hasImage: json["HasImage"],
        ownerId: json["OwnerId"],
        ownerName: json["OwnerName"],
        point: json["Point"],
      );
}

class ImageUrl {
  ImageUrl({
    required this.imageUrl,
    required this.small,
    required this.medium,
    required this.big,
    required this.listNo,
    required this.propertyId,
    required this.details,
  });

  final String imageUrl;
  final String small;
  final String medium;
  final String big;
  final int listNo;
  final int propertyId;
  final Details? details;

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        imageUrl: json["ImageUrl"],
        small: json["Small"],
        medium: json["Medium"],
        big: json["Big"],
        listNo: json["ListNo"],
        propertyId: json["PropertyId"],
        details: json["Details"] == null ? null : Details.fromJson(json["Details"]),
      );
}

class Details {
  Details({
    required this.rawSize,
    required this.rawHeight,
    required this.rawWidth,
    required this.smallSize,
    required this.smallWidth,
    required this.smallHeight,
    required this.smallQuality,
    required this.mediumSize,
    required this.mediumWidth,
    required this.mediumHeight,
    required this.mediumQuality,
    required this.bigSize,
    required this.bigWidth,
    required this.bigHeight,
    required this.bigQuality,
  });

  final bool rawSize;
  final bool rawHeight;
  final bool rawWidth;
  final bool smallSize;
  final bool smallWidth;
  final bool smallHeight;
  final bool smallQuality;
  final bool mediumSize;
  final bool mediumWidth;
  final bool mediumHeight;
  final bool mediumQuality;
  final bool bigSize;
  final bool bigWidth;
  final bool bigHeight;
  final bool bigQuality;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        rawSize: json["RawSize"],
        rawHeight: json["RawHeight"],
        rawWidth: json["RawWidth"],
        smallSize: json["SmallSize"],
        smallWidth: json["SmallWidth"],
        smallHeight: json["SmallHeight"],
        smallQuality: json["SmallQuality"],
        mediumSize: json["MediumSize"],
        mediumWidth: json["MediumWidth"],
        mediumHeight: json["MediumHeight"],
        mediumQuality: json["MediumQuality"],
        bigSize: json["BigSize"],
        bigWidth: json["BigWidth"],
        bigHeight: json["BigHeight"],
        bigQuality: json["BigQuality"],
      );
}

class Label {
  Label({
    required this.name,
    required this.value,
  });

  final String name;
  final int value;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        name: json["Name"],
        value: json["Value"],
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
    required this.primaryKey,
  });

  final String totalRecordCount;
  final String primaryKey;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        totalRecordCount: json["totalRecordCount"],
        primaryKey: json["primaryKey"],
      );
}
