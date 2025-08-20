/// Campaign entity representing the core business logic
class CampaignEntity {
  final String id;
  final String image;
  final String companyName;
  final String description;
  final List<String> tags;
  final String status;

  const CampaignEntity({
    required this.id,
    required this.image,
    required this.companyName,
    required this.description,
    required this.tags,
    required this.status,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignEntity &&
        other.id == id &&
        other.image == image &&
        other.companyName == companyName &&
        other.description == description &&
        other.tags == tags &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        companyName.hashCode ^
        description.hashCode ^
        tags.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'CampaignEntity(id: $id, image: $image, companyName: $companyName, description: $description, tags: $tags, status: $status)';
  }
}
