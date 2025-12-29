import 'package:flutter/material.dart';
import '../../models/dashboardModels.dart';
import '../../utils/color.dart';
import '../../utils/text_style.dart';

class ActivitiesCard extends StatelessWidget {
  final List<ActivityItem> activities;

  const ActivitiesCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.fromBorderSide(BorderSide(color: AppColors.border))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre simple
          Text('Activities Feeds', style: AppTextStyles.cardTitle),
          const SizedBox(height: 16),

          // Liste des activités
          ...activities.map((item) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: _buildLeading(item),
            title: Text(
              "${item.title} ${item.highlight ?? ''}",
              style: AppTextStyles.bodySmall,
            ),
            subtitle: Text(item.timeAgo, style: AppTextStyles.labelSmall),
          )),
        ],
      ),
    );
  }

  // Gestion simplifiée de l'icône ou de l'image
  Widget _buildLeading(ActivityItem item) {
    if (item.avatarUrl != null) {
      return CircleAvatar(
        backgroundImage: NetworkImage(item.avatarUrl!),
        radius: 18,
      );
    }

    // Une seule icône par défaut ou simple couleur selon le type
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        item.type == ActivityType.alert ? Icons.warning : Icons.notifications,
        size: 18,
        color: AppColors.primary,
      ),
    );
  }
}
