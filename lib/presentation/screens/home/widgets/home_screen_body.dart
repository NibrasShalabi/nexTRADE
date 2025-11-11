import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_balance_card.dart';
import 'home_deposit_button.dart';
import 'home_header.dart';
import 'home_info_row.dart';
import 'home_transactions_list.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SizedBox(height: 25),
              HomeBalanceCard(),
              SizedBox(height: 25),
              HomeInfoRow(),
              SizedBox(height: 30),
              HomeDepositButton(),
              SizedBox(height: 30),
              HomeTransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
