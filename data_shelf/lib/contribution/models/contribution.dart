class Contribution {
  final String contributionDate;
  final int numberOfContributions;
  final String amountEarned;
  final String contributionType;
  final String requestTitle;
  final String detail;

  Contribution({
    required this.requestTitle,
    required this.contributionDate,
    required this.numberOfContributions,
    required this.amountEarned,
    required this.contributionType,
    required this.detail,
  });
}
