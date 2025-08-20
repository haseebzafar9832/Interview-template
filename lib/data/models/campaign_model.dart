import '../../domain/entities/campaign_entity.dart';

/// Campaign model for data layer operations
class CampaignModel extends CampaignEntity {
  const CampaignModel({
    required super.id,
    required super.image,
    required super.companyName,
    required super.description,
    required super.tags,
    required super.status,
  });

  /// Create CampaignModel from JSON
  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      companyName: json['companyName'] ?? '',
      description: json['description'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      status: json['status'] ?? '',
    );
  }

  /// Convert CampaignModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'companyName': companyName,
      'description': description,
      'tags': tags,
      'status': status,
    };
  }

  /// Create CampaignModel from entity
  factory CampaignModel.fromEntity(CampaignEntity entity) {
    return CampaignModel(
      id: entity.id,
      image: entity.image,
      companyName: entity.companyName,
      description: entity.description,
      tags: entity.tags,
      status: entity.status,
    );
  }

  /// Convert to entity
  CampaignEntity toEntity() {
    return CampaignEntity(
      id: id,
      image: image,
      companyName: companyName,
      description: description,
      tags: tags,
      status: status,
    );
  }

  /// Create a copy with updated fields
  CampaignModel copyWith({
    String? id,
    String? image,
    String? companyName,
    String? description,
    List<String>? tags,
    String? status,
  }) {
    return CampaignModel(
      id: id ?? this.id,
      image: image ?? this.image,
      companyName: companyName ?? this.companyName,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      status: status ?? this.status,
    );
  }
}
