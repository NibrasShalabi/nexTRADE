class TransactionModel {
  final String type; // Deposit / Withdraw
  final double amount;
  final String date;
  final String status;

  TransactionModel({
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      date: json['date'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'amount': amount,
    'date': date,
    'status': status,
  };

  static List<TransactionModel> mockList() {
    return [
      TransactionModel(
        type: 'Deposit',
        amount: 250,
        date: 'Nov 3, 2025',
        status: 'Completed',
      ),
      TransactionModel(
        type: 'Withdraw',
        amount: -120,
        date: 'Nov 2, 2025',
        status: 'Pending',
      ),
      TransactionModel(
        type: 'Deposit',
        amount: 400,
        date: 'Nov 1, 2025',
        status: 'Completed',
      ),
      TransactionModel(
        type: 'Deposit',
        amount: 400,
        date: 'Nov 1, 2025',
        status: 'Completed',
      ),
      TransactionModel(
        type: 'failed',
        amount: 400,
        date: 'Nov 1, 2025',
        status: 'failed',
      ),
      TransactionModel(
        type: 'failed',
        amount: 400,
        date: 'Nov 1, 2025',
        status: 'failed',
      ),
    ];
  }
}
