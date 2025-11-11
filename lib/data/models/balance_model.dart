import 'dart:convert';

class BalanceModel {
  final double balance;
  final double changePercent;
  final double totalDeposits;
  final double totalWithdrawals;
  final double totalEarnings;

  BalanceModel({
    required this.balance,
    required this.changePercent,
    required this.totalDeposits,
    required this.totalWithdrawals,
    required this.totalEarnings,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      balance: (json['balance'] ?? 0).toDouble(),
      changePercent: (json['change_percent'] ?? 0).toDouble(),
      totalDeposits: (json['total_deposits'] ?? 0).toDouble(),
      totalWithdrawals: (json['total_withdrawals'] ?? 0).toDouble(),
      totalEarnings: (json['total_earnings'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'balance': balance,
    'change_percent': changePercent,
    'total_deposits': totalDeposits,
    'total_withdrawals': totalWithdrawals,
    'total_earnings': totalEarnings,
  };

  static BalanceModel mock() {
    return BalanceModel(
      balance: 12560.00,
      changePercent: 3.4,
      totalDeposits: 3200,
      totalWithdrawals: 1120,
      totalEarnings: 450,
    );
  }

  static BalanceModel fromMockJson() {
    const mockJson = '''
    {
      "balance": 12560.00,
      "change_percent": 3.4,
      "total_deposits": 3200,
      "total_withdrawals": 1120,
      "total_earnings": 450
    }
    ''';
    return BalanceModel.fromJson(jsonDecode(mockJson));
  }
}
