import 'dart:convert';

import 'package:duka/core/models/dashboard_model.dart';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

class OrdersModel {
  OrdersModel({
    this.message,
    this.data,
  });

  String? message;
  List<OrdersDatum>? data;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    message: json["message"],
    data: List<OrdersDatum>.from(json["data"].map((x) => OrdersDatum.fromJson(x))),
  );
}

class OrdersDatum {
  OrdersDatum({
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
    this.carts,
    this.products,
    this.vendor,
    this.user,
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
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Cart>? carts;
  List<Product>? products;
  Vendor? vendor;
  Customer? user;

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
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
    carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    vendor: Vendor.fromJson(json["vendor"]),
    user: Customer.fromJson(json["user"]),
  );
}

class Cart {
  Cart({
    this.id,
    this.productId,
    this.categoryId,
    this.vendorId,
    this.userId,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deliveryFee,
    this.status,
  });

  int? id;
  int? productId;
  int? categoryId;
  int? vendorId;
  int? userId;
  int? quantity;
  int? price;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? deliveryFee;
  String? status;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    productId: json["product_id"],
    categoryId: json["category_id"],
    vendorId: json["vendor_id"],
    userId: json["user_id"],
    quantity: json["quantity"],
    price: json["price"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    deliveryFee: json["delivery_fee"],
    status: json["status"],
  );
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.price,
    this.like,
    this.productCategoryId,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? price;
  int? like;
  int? productCategoryId;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image1: json["image_1"],
    image2: json["image_2"],
    image3: json["image_3"],
    image4: json["image_4"],
    price: json["price"],
    like: json["like"],
    productCategoryId: json["product_category_id"],
    vendorId: json["vendor_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );
}