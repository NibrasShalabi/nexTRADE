import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/presentation/screens/transactions/widgets/transaction_item.dart';
import 'package:nextrade/presentation/screens/transactions/widgets/transactions_filter_bar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../data/models/transaction_model.dart';


class TransactionsScreenBody extends StatefulWidget {
  const TransactionsScreenBody({super.key});

  @override
  State<TransactionsScreenBody> createState() => _TransactionsScreenBodyState();
}

class _TransactionsScreenBodyState extends State<TransactionsScreenBody> {
  String selectedFilter = 'All';
  List<TransactionModel> allTransactions = TransactionModel.mockList();

  List<TransactionModel> get filteredTransactions {
    if (selectedFilter == 'All') return allTransactions;
    return allTransactions
        .where((t) => t.type.toLowerCase() == selectedFilter.toLowerCase())
        .toList();
  }

  void _onFilterSelected(String type) {
    setState(() {
      selectedFilter = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transactions',
              style: AppTextStyle.textStyle20.copyWith(
                color: AppColors.golden,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),

            // 🔹 فلتر زجاجي بالأعلى
            TransactionsFilterBar(
              selected: selectedFilter,
              onSelected: _onFilterSelected,
            ),
            SizedBox(height: 20.h),

            // 🔹 الكرت الزجاجي الرئيسي
            Expanded(
              child: GlassCard(
                radius: 25.r,
                padding: EdgeInsets.all(20.w),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredTransactions.length,
                  itemBuilder: (context, index) {
                    final tx = filteredTransactions[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: TransactionItem(transaction: tx),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
