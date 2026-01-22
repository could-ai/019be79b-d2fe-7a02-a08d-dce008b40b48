import 'package:flutter/material.dart';
import '../theme/styles.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Premium Access")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.diamond, size: 80, color: AppColors.accent),
            const SizedBox(height: 20),
            const Text(
              "Support Haitian Music",
              style: AppTextStyles.header,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Get unlimited downloads, no ads, and high-quality audio.",
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            
            _buildPlanCard(
              context,
              title: "Monthly",
              price: "\$1.00",
              period: "/ month",
              isPopular: false,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: "Semi-Annual",
              price: "\$15.00",
              period: "/ 6 months",
              isPopular: false,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: "Annual",
              price: "\$30.00",
              period: "/ year",
              isPopular: true,
              highlight: "Best Support for Artists",
            ),
            
            const SizedBox(height: 30),
            const Text(
              "Cancel anytime. Secure payment.",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, {
    required String title,
    required String price,
    required String period,
    required bool isPopular,
    String? highlight,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isPopular ? Border.all(color: AppColors.accent, width: 2) : null,
      ),
      child: Column(
        children: [
          if (highlight != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                highlight,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.subHeader),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(price, style: AppTextStyles.header.copyWith(color: AppColors.primary)),
                      Text(period, style: AppTextStyles.body),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPopular ? AppColors.accent : Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text("Subscribe"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
