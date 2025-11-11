import 'package:flutter/material.dart';

import '../../../../core/widgets/info_item.dart';

class HomeInfoRow extends StatelessWidget {
  const HomeInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoItem(title: 'Deposits', value: '\$3,200'),
        InfoItem(title: 'Withdrawals', value: '\$1,120'),
        InfoItem(title: 'Earnings', value: '\$450'),
      ],
    );
  }
}
