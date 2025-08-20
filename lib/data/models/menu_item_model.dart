import 'package:flutter/material.dart';
import '../../domain/entities/menu_item_entity.dart';

/// Menu item model for data layer operations
class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    required super.id,
    required super.icon,
    required super.title,
    super.route,
    super.isDestructive,
    super.onTap,
  });

  /// Create MenuItemModel from JSON
  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] ?? '',
      icon: _getIconFromString(json['icon'] ?? ''),
      title: json['title'] ?? '',
      route: json['route'],
      isDestructive: json['isDestructive'] ?? false,
    );
  }

  /// Convert MenuItemModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'icon': _getIconString(icon),
      'title': title,
      'route': route,
      'isDestructive': isDestructive,
    };
  }

  /// Create MenuItemModel from entity
  factory MenuItemModel.fromEntity(MenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      icon: entity.icon,
      title: entity.title,
      route: entity.route,
      isDestructive: entity.isDestructive,
      onTap: entity.onTap,
    );
  }

  /// Convert to entity
  MenuItemEntity toEntity() {
    return MenuItemEntity(
      id: id,
      icon: icon,
      title: title,
      route: route,
      isDestructive: isDestructive,
      onTap: onTap,
    );
  }

  /// Create a copy with updated fields
  MenuItemModel copyWith({
    String? id,
    IconData? icon,
    String? title,
    String? route,
    bool? isDestructive,
    VoidCallback? onTap,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      route: route ?? this.route,
      isDestructive: isDestructive ?? this.isDestructive,
      onTap: onTap ?? this.onTap,
    );
  }

  /// Helper method to convert icon string to IconData
  static IconData _getIconFromString(String iconString) {
    switch (iconString) {
      case 'person':
        return Icons.person;
      case 'announcement':
        return Icons.announcement;
      case 'help':
        return Icons.help;
      case 'question_answer':
        return Icons.question_answer;
      case 'description':
        return Icons.description;
      case 'logout':
        return Icons.logout;
      case 'person_remove':
        return Icons.person_remove;
      default:
        return Icons.help;
    }
  }

  /// Helper method to convert IconData to string
  static String _getIconString(IconData icon) {
    if (icon == Icons.person) return 'person';
    if (icon == Icons.announcement) return 'announcement';
    if (icon == Icons.help) return 'help';
    if (icon == Icons.question_answer) return 'question_answer';
    if (icon == Icons.description) return 'description';
    if (icon == Icons.logout) return 'logout';
    if (icon == Icons.person_remove) return 'person_remove';
    return 'help';
  }
}
