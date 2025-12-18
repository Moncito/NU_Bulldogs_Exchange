import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomText.heading2('Profile'),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ENHANCEMENT 1: Changed to your name
                  CustomText.heading1(AppConstants.yourName),
                  const SizedBox(height: 8),
                  CustomText.bodyMedium(
                    'NU Student ID: 2024-1001614',
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomText.heading2('12'),
                          CustomText.bodyMedium('Orders'),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        children: [
                          CustomText.heading2('8'),
                          CustomText.bodyMedium('Wishlist'),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        children: [
                          CustomText.heading2('4.8'),
                          CustomText.bodyMedium('Rating'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Menu Items
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.favorite,
                    title: 'Wishlist',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.location_on,
                    title: 'Shipping Address',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.payment,
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {},
                    isLogout: true,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // App Info
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.white,
              child: Column(
                children: [
                  CustomText.bodyMedium(
                    AppConstants.appDescription,
                    align: TextAlign.center,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 8),
                  CustomText.bodySmall(
                    'Version 1.0.0',
                    align: TextAlign.center,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : AppColors.primary,
      ),
      title: CustomText.bodyLarge(
        title,
        color: isLogout ? Colors.red : AppColors.textPrimary,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}