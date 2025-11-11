class ReferralModel {
  final String name;
  final String status; // Approved / Pending
  final double reward;

  ReferralModel({
    required this.name,
    required this.status,
    required this.reward,
  });

  factory ReferralModel.fromJson(Map<String, dynamic> json) {
    return ReferralModel(
      name: json['name'] ?? '',
      status: json['status'] ?? 'Pending',
      reward: (json['reward'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'status': status,
    'reward': reward,
  };

  // ✅ بيانات وهمية مؤقتة (mock data)
  static List<ReferralModel> mockList() {
    return [
      ReferralModel(name: 'Ali', status: 'Approved', reward: 5.0),
      ReferralModel(name: 'Sara', status: 'Pending', reward: 0.0),
      ReferralModel(name: 'Omar', status: 'Approved', reward: 7.5),
      ReferralModel(name: 'Lina', status: 'Pending', reward: 0.0),
    ];
  }
}
