import 'package:cloud_firestore/cloud_firestore.dart';

class ApiUrl {
  const ApiUrl._();

  static const String baseUrl = "https://quickopd.vaishnocodex.com";

  // static const products = "/products";
  static final products = FirebaseFirestore.instance.collection("products");
  static final users = FirebaseFirestore.instance.collection("users");

  static const String sendOtp = "$baseUrl/api/user/send-otp";
  static const String verifyOtp = "$baseUrl/api/user/verify-otp";
}
