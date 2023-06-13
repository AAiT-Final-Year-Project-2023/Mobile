class UserInfoModel {
  final int currentBalance;
  final int totalEarnings;

  UserInfoModel({
    required this.currentBalance,
    required this.totalEarnings,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      currentBalance: json['current_balance'],
      totalEarnings: json['total_earnings'],
    );
  }
}
