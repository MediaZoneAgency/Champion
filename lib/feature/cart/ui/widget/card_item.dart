import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/styles.dart';

class CardItem extends StatelessWidget {
  final String cardNumber;
  final VoidCallback onDelete;
  final Widget lastIcon;
  final Widget firstIcon;

  const CardItem({
    super.key,
    required this.cardNumber,
    required this.onDelete, required this.lastIcon, required this.firstIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          firstIcon,
          SizedBox(width: 16),
          Expanded(
            child: Text(
              cardNumber,
              style: TextStyles.poppinsMedium16BlackMeduim,
            ),
          ),
          lastIcon,
        ],
      ),
    );
  }
}