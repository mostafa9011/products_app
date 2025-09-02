import 'package:flutter/material.dart';

import '../../../../config/themes/app_theme.dart';
import '../../domain/entities/user_entity.dart';
import 'custom_user_data_row.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.name,
              style: TextStyles.bold16W700(context),
            ),
            const SizedBox(height: 8),
            CustomUserDataRow(
              icon: Icons.email,
              text: user.email,
            ),
            if (user.phone != null) ...[
              const SizedBox(height: 8),
              CustomUserDataRow(
                icon: Icons.phone,
                text: user.phone!,
              ),
            ],
            const SizedBox(height: 8),
            if (user.address != null) ...[
              CustomUserDataRow(
                icon: Icons.location_on,
                text: user.address!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
