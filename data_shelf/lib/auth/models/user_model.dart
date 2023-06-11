class UserModel {
  final String id;
  final String username;
  final String email;
  final List<String> roles;
  final String image;
  final int currentBalance;
  final int totalEarnings;
  final bool emailIsValid;
  final bool googleAuthenticated;
  final List<dynamic> recentlyViewed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic bankInformation;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.roles,
    required this.image,
    required this.currentBalance,
    required this.totalEarnings,
    required this.emailIsValid,
    required this.googleAuthenticated,
    required this.recentlyViewed,
    required this.createdAt,
    required this.updatedAt,
    required this.bankInformation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      image: json['image'],
      currentBalance: json['current_balance'],
      totalEarnings: json['total_earnings'],
      emailIsValid: json['email_is_valid'],
      googleAuthenticated: json['google_authenticated'],
      recentlyViewed: List<dynamic>.from(json['recently_viewed']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bankInformation: json['bank_information'],
    );
  }
}
