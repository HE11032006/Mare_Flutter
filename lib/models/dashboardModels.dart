class ActivityItem {
  final ActivityType type;
  final String title;
  final String? highlight;
  final String? avatarUrl;
  final String timeAgo;
  final String? icon;

  const ActivityItem({
    required this.type,
    required this.title,
    this.highlight,
    this.avatarUrl,
    required this.timeAgo,
    this.icon,
  });
}

enum ActivityType {
  aiGenerated,
  userAction,
  workflow,
  alert,
}