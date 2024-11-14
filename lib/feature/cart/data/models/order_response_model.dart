import 'dart:convert';

import 'package:education/feature/cart/data/models/shipping.dart';

import 'billing.dart';

class OrderResponse{
  int? id;
  int? parentId;
  String? status;
  String? currency;
  String? version;
  bool? pricesIncludeTax;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? cartTax;
  String? total;
  String? totalTax;
  int? customerId;
  String? orderKey;
  Billing? billing;
  Shipping? shipping;
  String? paymentMethod;
  String? paymentMethodTitle;
  String? transactionId;
  String? customerIpAddress;
  String? customerUserAgent;
  String? createdVia;
  String? customerNote;
  DateTime? dateCompleted;
  DateTime? datePaid;
  String? cartHash;
  String? number;

  List<dynamic>? taxLines;

  List<dynamic>? feeLines;
  List<dynamic>? couponLines;
  List<dynamic>? refunds;
  String? paymentUrl;
  bool? isEditable;
  bool? needsPayment;
  bool? needsProcessing;
  DateTime? dateCreatedGmt;
  DateTime? dateModifiedGmt;
  DateTime? dateCompletedGmt;
  DateTime? datePaidGmt;
  String? currencySymbol;

//<editor-fold desc="Data Methods">
  OrderResponse({
    this.id,
    this.parentId,
    this.status,
    this.currency,
    this.version,
    this.pricesIncludeTax,
    this.dateCreated,
    this.dateModified,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.customerId,
    this.orderKey,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.createdVia,
    this.customerNote,
    this.dateCompleted,
    this.datePaid,
    this.cartHash,
    this.number,
    this.taxLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.paymentUrl,
    this.isEditable,
    this.needsPayment,
    this.needsProcessing,
    this.dateCreatedGmt,
    this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
    this.currencySymbol,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderResponse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          parentId == other.parentId &&
          status == other.status &&
          currency == other.currency &&
          version == other.version &&
          pricesIncludeTax == other.pricesIncludeTax &&
          dateCreated == other.dateCreated &&
          dateModified == other.dateModified &&
          discountTotal == other.discountTotal &&
          discountTax == other.discountTax &&
          shippingTotal == other.shippingTotal &&
          shippingTax == other.shippingTax &&
          cartTax == other.cartTax &&
          total == other.total &&
          totalTax == other.totalTax &&
          customerId == other.customerId &&
          orderKey == other.orderKey &&
          billing == other.billing &&
          shipping == other.shipping &&
          paymentMethod == other.paymentMethod &&
          paymentMethodTitle == other.paymentMethodTitle &&
          transactionId == other.transactionId &&
          customerIpAddress == other.customerIpAddress &&
          customerUserAgent == other.customerUserAgent &&
          createdVia == other.createdVia &&
          customerNote == other.customerNote &&
          dateCompleted == other.dateCompleted &&
          datePaid == other.datePaid &&
          cartHash == other.cartHash &&
          number == other.number &&
          taxLines == other.taxLines &&
          feeLines == other.feeLines &&
          couponLines == other.couponLines &&
          refunds == other.refunds &&
          paymentUrl == other.paymentUrl &&
          isEditable == other.isEditable &&
          needsPayment == other.needsPayment &&
          needsProcessing == other.needsProcessing &&
          dateCreatedGmt == other.dateCreatedGmt &&
          dateModifiedGmt == other.dateModifiedGmt &&
          dateCompletedGmt == other.dateCompletedGmt &&
          datePaidGmt == other.datePaidGmt &&
          currencySymbol == other.currencySymbol);

  @override
  int get hashCode =>
      id.hashCode ^
      parentId.hashCode ^
      status.hashCode ^
      currency.hashCode ^
      version.hashCode ^
      pricesIncludeTax.hashCode ^
      dateCreated.hashCode ^
      dateModified.hashCode ^
      discountTotal.hashCode ^
      discountTax.hashCode ^
      shippingTotal.hashCode ^
      shippingTax.hashCode ^
      cartTax.hashCode ^
      total.hashCode ^
      totalTax.hashCode ^
      customerId.hashCode ^
      orderKey.hashCode ^
      billing.hashCode ^
      shipping.hashCode ^
      paymentMethod.hashCode ^
      paymentMethodTitle.hashCode ^
      transactionId.hashCode ^
      customerIpAddress.hashCode ^
      customerUserAgent.hashCode ^
      createdVia.hashCode ^
      customerNote.hashCode ^
      dateCompleted.hashCode ^
      datePaid.hashCode ^
      cartHash.hashCode ^
      number.hashCode ^
      taxLines.hashCode ^
      feeLines.hashCode ^
      couponLines.hashCode ^
      refunds.hashCode ^
      paymentUrl.hashCode ^
      isEditable.hashCode ^
      needsPayment.hashCode ^
      needsProcessing.hashCode ^
      dateCreatedGmt.hashCode ^
      dateModifiedGmt.hashCode ^
      dateCompletedGmt.hashCode ^
      datePaidGmt.hashCode ^
      currencySymbol.hashCode;

  @override
  String toString() {
    return 'OrderResponse{' +
        ' id: $id,' +
        ' parentId: $parentId,' +
        ' status: $status,' +
        ' currency: $currency,' +
        ' version: $version,' +
        ' pricesIncludeTax: $pricesIncludeTax,' +
        ' dateCreated: $dateCreated,' +
        ' dateModified: $dateModified,' +
        ' discountTotal: $discountTotal,' +
        ' discountTax: $discountTax,' +
        ' shippingTotal: $shippingTotal,' +
        ' shippingTax: $shippingTax,' +
        ' cartTax: $cartTax,' +
        ' total: $total,' +
        ' totalTax: $totalTax,' +
        ' customerId: $customerId,' +
        ' orderKey: $orderKey,' +
        ' billing: $billing,' +
        ' shipping: $shipping,' +
        ' paymentMethod: $paymentMethod,' +
        ' paymentMethodTitle: $paymentMethodTitle,' +
        ' transactionId: $transactionId,' +
        ' customerIpAddress: $customerIpAddress,' +
        ' customerUserAgent: $customerUserAgent,' +
        ' createdVia: $createdVia,' +
        ' customerNote: $customerNote,' +
        ' dateCompleted: $dateCompleted,' +
        ' datePaid: $datePaid,' +
        ' cartHash: $cartHash,' +
        ' number: $number,' +
        ' taxLines: $taxLines,' +
        ' feeLines: $feeLines,' +
        ' couponLines: $couponLines,' +
        ' refunds: $refunds,' +
        ' paymentUrl: $paymentUrl,' +
        ' isEditable: $isEditable,' +
        ' needsPayment: $needsPayment,' +
        ' needsProcessing: $needsProcessing,' +
        ' dateCreatedGmt: $dateCreatedGmt,' +
        ' dateModifiedGmt: $dateModifiedGmt,' +
        ' dateCompletedGmt: $dateCompletedGmt,' +
        ' datePaidGmt: $datePaidGmt,' +
        ' currencySymbol: $currencySymbol,' +
        '}';
  }

  OrderResponse copyWith({
    int? id,
    int? parentId,
    String? status,
    String? currency,
    String? version,
    bool? pricesIncludeTax,
    DateTime? dateCreated,
    DateTime? dateModified,
    String? discountTotal,
    String? discountTax,
    String? shippingTotal,
    String? shippingTax,
    String? cartTax,
    String? total,
    String? totalTax,
    int? customerId,
    String? orderKey,
    Billing? billing,
    Shipping? shipping,
    String? paymentMethod,
    String? paymentMethodTitle,
    String? transactionId,
    String? customerIpAddress,
    String? customerUserAgent,
    String? createdVia,
    String? customerNote,
    DateTime? dateCompleted,
    DateTime? datePaid,
    String? cartHash,
    String? number,
    List<dynamic>? taxLines,
    List<dynamic>? feeLines,
    List<dynamic>? couponLines,
    List<dynamic>? refunds,
    String? paymentUrl,
    bool? isEditable,
    bool? needsPayment,
    bool? needsProcessing,
    DateTime? dateCreatedGmt,
    DateTime? dateModifiedGmt,
    DateTime? dateCompletedGmt,
    DateTime? datePaidGmt,
    String? currencySymbol,
  }) {
    return OrderResponse(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      version: version ?? this.version,
      pricesIncludeTax: pricesIncludeTax ?? this.pricesIncludeTax,
      dateCreated: dateCreated ?? this.dateCreated,
      dateModified: dateModified ?? this.dateModified,
      discountTotal: discountTotal ?? this.discountTotal,
      discountTax: discountTax ?? this.discountTax,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      shippingTax: shippingTax ?? this.shippingTax,
      cartTax: cartTax ?? this.cartTax,
      total: total ?? this.total,
      totalTax: totalTax ?? this.totalTax,
      customerId: customerId ?? this.customerId,
      orderKey: orderKey ?? this.orderKey,
      billing: billing ?? this.billing,
      shipping: shipping ?? this.shipping,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentMethodTitle: paymentMethodTitle ?? this.paymentMethodTitle,
      transactionId: transactionId ?? this.transactionId,
      customerIpAddress: customerIpAddress ?? this.customerIpAddress,
      customerUserAgent: customerUserAgent ?? this.customerUserAgent,
      createdVia: createdVia ?? this.createdVia,
      customerNote: customerNote ?? this.customerNote,
      dateCompleted: dateCompleted ?? this.dateCompleted,
      datePaid: datePaid ?? this.datePaid,
      cartHash: cartHash ?? this.cartHash,
      number: number ?? this.number,
      taxLines: taxLines ?? this.taxLines,
      feeLines: feeLines ?? this.feeLines,
      couponLines: couponLines ?? this.couponLines,
      refunds: refunds ?? this.refunds,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      isEditable: isEditable ?? this.isEditable,
      needsPayment: needsPayment ?? this.needsPayment,
      needsProcessing: needsProcessing ?? this.needsProcessing,
      dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
      dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
      dateCompletedGmt: dateCompletedGmt ?? this.dateCompletedGmt,
      datePaidGmt: datePaidGmt ?? this.datePaidGmt,
      currencySymbol: currencySymbol ?? this.currencySymbol,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'parentId': this.parentId,
      'status': this.status,
      'currency': this.currency,
      'version': this.version,
      'pricesIncludeTax': this.pricesIncludeTax,
      'dateCreated': this.dateCreated,
      'dateModified': this.dateModified,
      'discountTotal': this.discountTotal,
      'discountTax': this.discountTax,
      'shippingTotal': this.shippingTotal,
      'shippingTax': this.shippingTax,
      'cartTax': this.cartTax,
      'total': this.total,
      'totalTax': this.totalTax,
      'customerId': this.customerId,
      'orderKey': this.orderKey,
      'billing': this.billing,
      'shipping': this.shipping,
      'paymentMethod': this.paymentMethod,
      'paymentMethodTitle': this.paymentMethodTitle,
      'transactionId': this.transactionId,
      'customerIpAddress': this.customerIpAddress,
      'customerUserAgent': this.customerUserAgent,
      'createdVia': this.createdVia,
      'customerNote': this.customerNote,
      'dateCompleted': this.dateCompleted,
      'datePaid': this.datePaid,
      'cartHash': this.cartHash,
      'number': this.number,
      'taxLines': this.taxLines,
      'feeLines': this.feeLines,
      'couponLines': this.couponLines,
      'refunds': this.refunds,
      'paymentUrl': this.paymentUrl,
      'isEditable': this.isEditable,
      'needsPayment': this.needsPayment,
      'needsProcessing': this.needsProcessing,
      'dateCreatedGmt': this.dateCreatedGmt,
      'dateModifiedGmt': this.dateModifiedGmt,
      'dateCompletedGmt': this.dateCompletedGmt,
      'datePaidGmt': this.datePaidGmt,
      'currencySymbol': this.currencySymbol,
    };
  }

  factory OrderResponse.fromMap(Map<String, dynamic> map) {
    return OrderResponse(
      id: map['id'] ,
      parentId: map['parentId'] ,
      status: map['status'] ,
      currency: map['currency'],
      version: map['version'] ,
      pricesIncludeTax: map['pricesIncludeTax'] ,
      dateCreated: map['dateCreated'] ,
      dateModified: map['dateModified'] ,
      discountTotal: map['discountTotal'] ,
      discountTax: map['discountTax'] ,
      shippingTotal: map['shippingTotal'] ,
      shippingTax: map['shippingTax'] ,
      cartTax: map['cartTax'] ,
      total: map['total'] ,
      totalTax: map['totalTax'] ,
      customerId: map['customerId'] ,
      orderKey: map['orderKey'],
      billing: map['billing'] ,
      shipping: map['shipping'] ,
      paymentMethod: map['paymentMethod'] ,
      paymentMethodTitle: map['paymentMethodTitle'],
      transactionId: map['transactionId'] ,
      customerIpAddress: map['customerIpAddress'] ,
      customerUserAgent: map['customerUserAgent'] ,
      createdVia: map['createdVia'] ,
      customerNote: map['customerNote'] ,
      dateCompleted: map['dateCompleted'] ,
      datePaid: map['datePaid'] ,
      cartHash: map['cartHash'] ,
      number: map['number'] ,
      taxLines: map['taxLines'] ,
      feeLines: map['feeLines'] ,
      couponLines: map['couponLines'] ,
      refunds: map['refunds'],
      paymentUrl: map['paymentUrl'] ,
      isEditable: map['isEditable'] ,
      needsPayment: map['needsPayment'] ,
      needsProcessing: map['needsProcessing'] ,
      dateCreatedGmt: map['dateCreatedGmt'] ,
      dateModifiedGmt: map['dateModifiedGmt'] ,
      dateCompletedGmt: map['dateCompletedGmt'] ,
      datePaidGmt: map['datePaidGmt'] ,
      currencySymbol: map['currencySymbol'] ,
    );
  }

//</editor-fold>
}