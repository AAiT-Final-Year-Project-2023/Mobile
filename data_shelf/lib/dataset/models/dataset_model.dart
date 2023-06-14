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


// class DatasetModel {
//   final String title;
//   final String description;
//   final String src;
//   final int size;
//   final List<dynamic> labels;
//   final String datatype;
//   // final int price;
//   final User user;
//   // final PaymentPlanModel paymentPlan;
//   final String id;
//   final String status;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   DatasetModel({
//     required this.title,
//     required this.description,
//     required this.src,
//     required this.size,
//     required this.labels,
//     required this.datatype,
//     // required this.price,
//     required this.user,
//     // required this.paymentPlan,
//     required this.id,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   DatasetModel copyWith({
//     String? title,
//     String? description,
//     String? src,
//     int? size,
//     List<dynamic>? labels,
//     String? datatype,
//     // int? price,
//     User? user,
//     // PaymentPlanModel? paymentPlan,
//     String? id,
//     String? status,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) =>
//       DatasetModel(
//         title: title ?? this.title,
//         description: description ?? this.description,
//         src: src ?? this.src,
//         size: size ?? this.size,
//         labels: labels ?? this.labels,
//         datatype: datatype ?? this.datatype,
//         // price: price ?? this.price,
//         user: user ?? this.user,
//         // paymentPlan: paymentPlan ?? this.paymentPlan,
//         id: id ?? this.id,
//         status: status ?? this.status,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );

//   factory DatasetModel.fromJson(Map<String, dynamic> json) {
//     return DatasetModel(
//       datatype: json['datatype'],
//       description: json['description'],
//       labels: json['labels'],
//       // paymentPlan: json['paymentPlan'],
//       // price: json['price'],
//       title: json['title'],
//       createdAt: DateTime.parse(json['createdAt']),
//       id: json['id'],
//       size: json['size'],
//       src: json['src'].toString(),
//       status: json['status'].toString(),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       user: json['user'],
//     );
//   }
// }

// class PaymentPlanModel {
//   String id;
//   String title;
//   String description;
//   String diskSize;
//   String price;
//   int discount;

//   PaymentPlanModel({
//     this.id = "",
//     this.title = "",
//     this.description = "",
//     this.diskSize = "",
//     this.price = "",
//     this.discount = 0,
//   });

//   PaymentPlanModel copyWith({
//     String? id,
//     String? title,
//     String? description,
//     String? diskSize,
//     String? price,
//     int? discount,
//   }) =>
//       PaymentPlanModel(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         description: description ?? this.description,
//         diskSize: diskSize ?? this.diskSize,
//         price: price ?? this.price,
//         discount: discount ?? this.discount,
//       );
// }

// class User {
//   final String id;
//   final String username;
//   final String email;
//   final dynamic password;
//   final List<String> roles;
//   final String status;
//   final String image;
//   final int currentBalance;
//   final int totalEarnings;
//   final bool emailIsValid;
//   final String emailVerificationCode;
//   final DateTime emailVerificationCodeExpiration;
//   final dynamic newPassword;
//   final dynamic passwordChangeVerificationCode;
//   final dynamic passwordChangeCodeExpiration;
//   final bool googleAuthenticated;
//   final List<dynamic> recentlyViewed;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final BankInformationModel bankInformation;

//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     this.password,
//     required this.roles,
//     required this.status,
//     required this.image,
//     required this.currentBalance,
//     required this.totalEarnings,
//     required this.emailIsValid,
//     required this.emailVerificationCode,
//     required this.emailVerificationCodeExpiration,
//     this.newPassword,
//     this.passwordChangeVerificationCode,
//     this.passwordChangeCodeExpiration,
//     required this.googleAuthenticated,
//     required this.recentlyViewed,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.bankInformation,
//   });

//   User copyWith({
//     String? id,
//     String? username,
//     String? email,
//     dynamic password,
//     List<String>? roles,
//     String? status,
//     String? image,
//     int? currentBalance,
//     int? totalEarnings,
//     bool? emailIsValid,
//     String? emailVerificationCode,
//     DateTime? emailVerificationCodeExpiration,
//     dynamic newPassword,
//     dynamic passwordChangeVerificationCode,
//     dynamic passwordChangeCodeExpiration,
//     bool? googleAuthenticated,
//     List<dynamic>? recentlyViewed,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     BankInformationModel? bankInformation,
//   }) =>
//       User(
//         id: id ?? this.id,
//         username: username ?? this.username,
//         email: email ?? this.email,
//         password: password ?? this.password,
//         roles: roles ?? this.roles,
//         status: status ?? this.status,
//         image: image ?? this.image,
//         currentBalance: currentBalance ?? this.currentBalance,
//         totalEarnings: totalEarnings ?? this.totalEarnings,
//         emailIsValid: emailIsValid ?? this.emailIsValid,
//         emailVerificationCode:
//             emailVerificationCode ?? this.emailVerificationCode,
//         emailVerificationCodeExpiration: emailVerificationCodeExpiration ??
//             this.emailVerificationCodeExpiration,
//         newPassword: newPassword ?? this.newPassword,
//         passwordChangeVerificationCode: passwordChangeVerificationCode ??
//             this.passwordChangeVerificationCode,
//         passwordChangeCodeExpiration:
//             passwordChangeCodeExpiration ?? this.passwordChangeCodeExpiration,
//         googleAuthenticated: googleAuthenticated ?? this.googleAuthenticated,
//         recentlyViewed: recentlyViewed ?? this.recentlyViewed,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         bankInformation: bankInformation ?? this.bankInformation,
//       );
// }

// class BankInformationModel {
//   final String id;
//   final String accountName;
//   final String accountNumber;
//   final String bankId;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   BankInformationModel({
//     required this.id,
//     required this.accountName,
//     required this.accountNumber,
//     required this.bankId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   BankInformationModel copyWith({
//     String? id,
//     String? accountName,
//     String? accountNumber,
//     String? bankId,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) =>
//       BankInformationModel(
//         id: id ?? this.id,
//         accountName: accountName ?? this.accountName,
//         accountNumber: accountNumber ?? this.accountNumber,
//         bankId: bankId ?? this.bankId,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );
// }

// class DatasetUploadModel {
//   final File file;
//   final String paymentPlan;
//   final String title;
//   final String description;
//   List<String> labels;
//   final String datatype;
//   final String price;

//   DatasetUploadModel({
//     required this.file,
//     required this.paymentPlan,
//     required this.title,
//     required this.description,
//     required this.labels,
//     required this.datatype,
//     required this.price,
//   });

//   DatasetUploadModel copyWith({
//     File? file,
//     String? paymentPlan,
//     String? title,
//     String? description,
//     List<String>? labels,
//     String? datatype,
//     String? price,
//   }) =>
//       DatasetUploadModel(
//         file: file ?? this.file,
//         paymentPlan: paymentPlan ?? this.paymentPlan,
//         title: title ?? this.title,
//         description: description ?? this.description,
//         labels: labels ?? this.labels,
//         datatype: datatype ?? this.datatype,
//         price: price ?? this.price,
//       );

//   factory DatasetUploadModel.fromJson(Map<String, dynamic> json) {
//     return DatasetUploadModel(
//       datatype: json['datatype'],
//       description: json['description'],
//       file: json['file'],
//       labels: json['labels'],
//       paymentPlan: json['paymentPlan'],
//       price: json['price'],
//       title: json['title'],
//     );
//   }
// }
