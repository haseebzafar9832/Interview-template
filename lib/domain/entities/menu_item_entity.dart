import 'package:flutter/material.dart';

/// Menu item entity representing the core business logic
class MenuItemEntity {
  final String id;
  final IconData icon;
  final String title;
  final String? route;
  final bool isDestructive;
  final VoidCallback? onTap;

  const MenuItemEntity({
    required this.id,
    required this.icon,
    required this.title,
    this.route,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuItemEntity &&
        other.id == id &&
        other.icon == icon &&
        other.title == title &&
        other.route == route &&
        other.isDestructive == isDestructive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        icon.hashCode ^
        title.hashCode ^
        route.hashCode ^
        isDestructive.hashCode;
  }

  @override
  String toString() {
    return 'MenuItemEntity(id: $id, icon: $icon, title: $title, route: $route, isDestructive: $isDestructive)';
  }
}
