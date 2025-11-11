import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import 'deposit_amount_sheet.dart';
import 'deposit_button.dart';
import 'deposit_instructions_tile.dart';
import 'deposit_network_toggle.dart';
import 'deposit_status_box.dart';
import 'deposit_wallet_card.dart';


class DepositScreenBody extends StatefulWidget {
  const DepositScreenBody({super.key});

  @override
  State<DepositScreenBody> createState() => _DepositScreenBodyState();
}

class _DepositScreenBodyState extends State<DepositScreenBody> {
  String selectedNetwork = 'TRC20';
  bool isPending = false;
  bool isApproved = false;
  double? enteredAmount;

  void _toggleNetwork(String network) {
    setState(() {
      selectedNetwork = network;
    });
  }

  void _openDepositSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DepositAmountSheet(
        selectedNetwork: selectedNetwork,
        onConfirm: (amount) {
          setState(() {
            enteredAmount = amount;
            isPending = true;
            isApproved = false;
          });

          // ⚙️ محاكاة موافقة الأدمن بعد 5 ثوانٍ
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) {
              setState(() {
                isPending = false;
                isApproved = true;
              });
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),

              // 💰 الرصيد الحالي
              Text(
                'Your Balance: \$4,250.00',
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              // 🪙 اختيار الشبكة
              DepositNetworkToggle(
                selectedNetwork: selectedNetwork,
                onToggle: _toggleNetwork,
              ),
              SizedBox(height: 20.h),

              // 💳 كرت المحفظة
              DepositWalletCard(selectedNetwork: selectedNetwork),
              SizedBox(height: 20.h),

              // 📜 تعليمات الإيداع
              const DepositInstructionsTile(),
              SizedBox(height: 25.h),

              // 🔘 زر إرسال الطلب
              DepositButton(onPressed: _openDepositSheet),
              SizedBox(height: 30.h),

              // 📦 حالة العملية
              if (isPending || isApproved)
                DepositStatusBox(
                  isPending: isPending,
                  isApproved: isApproved,
                  amount: enteredAmount ?? 0,
                  network: selectedNetwork,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
