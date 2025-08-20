/// Campaign statistics entity representing the core business logic
class CampaignStatsEntity {
  final int applications;
  final int inProgress;
  final int completed;
  final int total;

  const CampaignStatsEntity({
    required this.applications,
    required this.inProgress,
    required this.completed,
    required this.total,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignStatsEntity &&
        other.applications == applications &&
        other.inProgress == inProgress &&
        other.completed == completed &&
        other.total == total;
  }

  @override
  int get hashCode {
    return applications.hashCode ^
        inProgress.hashCode ^
        completed.hashCode ^
        total.hashCode;
  }

  @override
  String toString() {
    return 'CampaignStatsEntity(applications: $applications, inProgress: $inProgress, completed: $completed, total: $total)';
  }
}
