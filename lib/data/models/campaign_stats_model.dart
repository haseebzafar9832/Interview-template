import '../../domain/entities/campaign_stats_entity.dart';

/// Campaign statistics model for data layer operations
class CampaignStatsModel extends CampaignStatsEntity {
  const CampaignStatsModel({
    required super.applications,
    required super.inProgress,
    required super.completed,
    required super.total,
  });

  /// Create CampaignStatsModel from JSON
  factory CampaignStatsModel.fromJson(Map<String, dynamic> json) {
    return CampaignStatsModel(
      applications: json['applications'] ?? 0,
      inProgress: json['inProgress'] ?? 0,
      completed: json['completed'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  /// Convert CampaignStatsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'applications': applications,
      'inProgress': inProgress,
      'completed': completed,
      'total': total,
    };
  }

  /// Create CampaignStatsModel from entity
  factory CampaignStatsModel.fromEntity(CampaignStatsEntity entity) {
    return CampaignStatsModel(
      applications: entity.applications,
      inProgress: entity.inProgress,
      completed: entity.completed,
      total: entity.total,
    );
  }

  /// Convert to entity
  CampaignStatsEntity toEntity() {
    return CampaignStatsEntity(
      applications: applications,
      inProgress: inProgress,
      completed: completed,
      total: total,
    );
  }

  /// Create a copy with updated fields
  CampaignStatsModel copyWith({
    int? applications,
    int? inProgress,
    int? completed,
    int? total,
  }) {
    return CampaignStatsModel(
      applications: applications ?? this.applications,
      inProgress: inProgress ?? this.inProgress,
      completed: completed ?? this.completed,
      total: total ?? this.total,
    );
  }

  /// Create empty stats
  factory CampaignStatsModel.empty() {
    return const CampaignStatsModel(
      applications: 0,
      inProgress: 0,
      completed: 0,
      total: 0,
    );
  }
}
