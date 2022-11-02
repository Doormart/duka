import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

class DashboardModel {
  DashboardModel({
    this.message,
    this.data,
  });

  String? message;
  DashboardData? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    message: json["message"],
    data: DashboardData.fromJson(json["data"]),
  );
}

class DashboardData {
  DashboardData({
    this.deliveredOrders,
    this.distanceCovered,
    this.recentOrders,
  });

  int? deliveredOrders;
  int? distanceCovered;
  List<RecentOrder>? recentOrders;

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    deliveredOrders: json["delivered_orders"],
    distanceCovered: json["distance_covered"],
    recentOrders: List<RecentOrder>.from(json["recent_orders"].map((x) => RecentOrder.fromJson(x))),
  );
}

class RecentOrder {
  RecentOrder({
    this.id,
    this.orderId,
    this.cartId,
    this.userId,
    this.productId,
    this.vendorId,
    this.deliveryAddress,
    this.deliveryLatitude,
    this.deliveryLongitude,
    this.deliveryType,
    this.paymentFrom,
    this.riderId,
    this.deliveryInstruction,
    this.vendorAcceptedOrder,
    this.riderAcceptedOrder,
    this.dispatcherToVendor,
    this.riderReceivedOrder,
    this.orderArrived,
    this.userReceivedOrder,
    this.orderStatus,
    this.paymentStatus,
    this.deliveryFee,
    this.totalAmount,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.customer,
  });

  int? id;
  String? orderId;
  String? cartId;
  int? userId;
  String? productId;
  int? vendorId;
  String? deliveryAddress;
  String? deliveryLatitude;
  String? deliveryLongitude;
  String? deliveryType;
  String? paymentFrom;
  int? riderId;
  String? deliveryInstruction;
  int? vendorAcceptedOrder;
  int? riderAcceptedOrder;
  int? dispatcherToVendor;
  int? riderReceivedOrder;
  int? orderArrived;
  int? userReceivedOrder;
  String? orderStatus;
  String? paymentStatus;
  int? deliveryFee;
  int? totalAmount;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Vendor? vendor;
  Customer? customer;

  factory RecentOrder.fromJson(Map<String, dynamic> json) => RecentOrder(
    id: json["id"],
    orderId: json["orderId"],
    cartId: json["cart_id"],
    userId: json["user_id"],
    productId: json["product_id"],
    vendorId: json["vendor_id"],
    deliveryAddress: json["delivery_address"],
    deliveryLatitude: json["delivery_latitude"],
    deliveryLongitude: json["delivery_longitude"],
    deliveryType: json["delivery_type"],
    paymentFrom: json["payment_from"],
    riderId: json["rider_id"],
    deliveryInstruction: json["delivery_instruction"],
    vendorAcceptedOrder: json["vendor_accepted_order"],
    riderAcceptedOrder: json["rider_accepted_order"],
    dispatcherToVendor: json["dispatcher_to_vendor"],
    riderReceivedOrder: json["rider_received_order"],
    orderArrived: json["order_arrived"],
    userReceivedOrder: json["user_received_order"],
    orderStatus: json["order_status"],
    paymentStatus: json["payment_status"],
    deliveryFee: json["delivery_fee"],
    totalAmount: json["total_amount"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    vendor: Vendor.fromJson(json["vendor"]),
    customer: Customer.fromJson(json["user"]),
  );

}

class Customer {
  Customer({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.referralCode,
    this.regionId,
    this.address,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? referralCode;
  int? regionId;
  String? address;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    referralCode: json["referral_code"],
    regionId: json["region_id"],
    address: json["address"],
  );
}

class Vendor {
  Vendor({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.adminVerified,
    this.phone,
    this.companyProof,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.publicImage,
    this.status,
    this.address,
    this.minOrder,
    this.prepareTime,
    this.accountNumber,
    this.rating,
    this.regionId,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? adminVerified;
  String? phone;
  String? companyProof;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? publicImage;
  String? status;
  String? address;
  dynamic minOrder;
  dynamic prepareTime;
  dynamic accountNumber;
  int? rating;
  int? regionId;
  String? latitude;
  String? longitude;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    adminVerified: json["admin_verified"],
    phone: json["phone"],
    companyProof: json["company_proof"],
    categoryId: json["category_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    publicImage: json["public_image"],
    status: json["status"],
    address: json["address"],
    minOrder: json["min_order"],
    prepareTime: json["prepare_time"],
    accountNumber: json["account_number"],
    rating: json["rating"],
    regionId: json["region_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );
}
