import 'dart:io';

class DatasetModel {
  final String id;
  final String title;
  final String description;
  final String src;
  final int size;
  final List<dynamic> labels;
  final String status;
  final String datatype;
  // final String price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User user;
  // final PaymentPlan paymentPlan;
  final List<dynamic> upvotedBy;
  final List<dynamic> downvotedBy;
  // final List<dynamic> purchasedBy;

  DatasetModel({
    required this.id,
    required this.title,
    required this.description,
    required this.src,
    required this.size,
    required this.labels,
    required this.status,
    required this.datatype,
    // required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    // required this.paymentPlan,
    required this.upvotedBy,
    required this.downvotedBy,
    // required this.purchasedBy,
  });

  DatasetModel copyWith({
    String? id,
    String? title,
    String? description,
    String? src,
    int? size,
    List<dynamic>? labels,
    String? status,
    String? datatype,
    // String? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
    // PaymentPlan? paymentPlan,
    List<dynamic>? upvotedBy,
    List<dynamic>? downvotedBy,
    // List<dynamic>? purchasedBy,
  }) =>
      DatasetModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        src: src ?? this.src,
        size: size ?? this.size,
        labels: labels ?? this.labels,
        status: status ?? this.status,
        datatype: datatype ?? this.datatype,
        // price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
        // paymentPlan: paymentPlan ?? this.paymentPlan,
        upvotedBy: upvotedBy ?? this.upvotedBy,
        downvotedBy: downvotedBy ?? this.downvotedBy,
        // purchasedBy: purchasedBy ?? this.purchasedBy,
      );

  factory DatasetModel.fromJson(Map<String, dynamic> json) {
    return DatasetModel(
      datatype: json['datatype'],
      description: json['description'],
      labels: json['labels'],
      // paymentPlan: json['paymentPlan'],
      // price: json['price'],

      title: json['title'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,

      id: json['id'].toString(),
      size: json['size'],
      src: json['src'].toString(),
      status: json['status'].toString(),
      user: User.fromJson(json['user']),
      downvotedBy: ((json['downvotedBy'] ?? []) as List),
      // purchasedBy: json['purchasedBy'],
      upvotedBy: ((json['upvotedBy'] ?? []) as List),
    );
  }
}

class PaymentPlan {
  final String id;
  final String title;
  final String diskSize;

  PaymentPlan({
    required this.id,
    required this.title,
    required this.diskSize,
  });

  PaymentPlan copyWith({
    String? id,
    String? title,
    String? diskSize,
  }) =>
      PaymentPlan(
        id: id ?? this.id,
        title: title ?? this.title,
        diskSize: diskSize ?? this.diskSize,
      );
}

class User {
  final String id;
  final String username;
  final String email;
  final String image;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? image,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        image: image ?? this.image,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
    );
  }
}

class BankInformationModel {
  final String id;
  final String accountName;
  final String accountNumber;
  final String bankId;
  final DateTime createdAt;
  final DateTime updatedAt;

  BankInformationModel({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.bankId,
    required this.createdAt,
    required this.updatedAt,
  });

  BankInformationModel copyWith({
    String? id,
    String? accountName,
    String? accountNumber,
    String? bankId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      BankInformationModel(
        id: id ?? this.id,
        accountName: accountName ?? this.accountName,
        accountNumber: accountNumber ?? this.accountNumber,
        bankId: bankId ?? this.bankId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}

class DatasetUploadModel {
  final File file;
  final String paymentPlan;
  final String title;
  final String description;
  List<String> labels;
  final String datatype;
  final String price;

  DatasetUploadModel({
    required this.file,
    required this.paymentPlan,
    required this.title,
    required this.description,
    required this.labels,
    required this.datatype,
    required this.price,
  });

  DatasetUploadModel copyWith({
    File? file,
    String? paymentPlan,
    String? title,
    String? description,
    List<String>? labels,
    String? datatype,
    String? price,
  }) =>
      DatasetUploadModel(
        file: file ?? this.file,
        paymentPlan: paymentPlan ?? this.paymentPlan,
        title: title ?? this.title,
        description: description ?? this.description,
        labels: labels ?? this.labels,
        datatype: datatype ?? this.datatype,
        price: price ?? this.price,
      );

  factory DatasetUploadModel.fromJson(Map<String, dynamic> json) {
    return DatasetUploadModel(
      datatype: json['datatype'],
      description: json['description'],
      file: json['file'],
      labels: json['labels'],
      paymentPlan: json['paymentPlan'],
      price: json['price'],
      title: json['title'],
    );
  }
}
