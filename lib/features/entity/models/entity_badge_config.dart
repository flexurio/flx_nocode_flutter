import 'package:flutter/material.dart';

/// Configuration for displaying a top badge in entity views (table, cards, etc.).
class EntityBadgeConfig {
  /// Field reference in the entity (e.g., 'tahun', 'bulan', 'area', 'customer', etc.).
  final String reference;

  /// Custom label override. If null, the entity field's label will be used.
  final String? label;

  /// Custom icon identifier (e.g. 'calendar', 'location', 'person', 'category', etc.).
  final String? icon;

  /// Explicit value override or template string.
  final String? value;

  const EntityBadgeConfig({
    required this.reference,
    this.label,
    this.icon,
    this.value,
  });

  factory EntityBadgeConfig.fromRaw(dynamic raw) {
    if (raw is String) {
      return EntityBadgeConfig(reference: raw);
    } else if (raw is Map) {
      return EntityBadgeConfig(
        reference:
            (raw['reference'] ?? raw['ref'] ?? raw['field'] ?? '').toString(),
        label: raw['label']?.toString(),
        icon: raw['icon']?.toString(),
        value: raw['value']?.toString(),
      );
    }
    return EntityBadgeConfig(reference: raw.toString());
  }

  Map<String, dynamic> toJson() => {
        'reference': reference,
        if (label != null) 'label': label,
        if (icon != null) 'icon': icon,
        if (value != null) 'value': value,
      };

  EntityBadgeConfig copyWith({
    String? reference,
    String? label,
    String? icon,
    String? value,
  }) {
    return EntityBadgeConfig(
      reference: reference ?? this.reference,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      value: value ?? this.value,
    );
  }
}

/// Resolves an [IconData] based on explicit icon name, field reference, and field type.
IconData resolveBadgeIcon(String? iconName, String ref, [String? fieldType]) {
  if (iconName != null && iconName.isNotEmpty) {
    switch (iconName.toLowerCase()) {
      case 'calendar':
      case 'calendar_today':
      case 'date':
      case 'datetime':
      case 'time':
        return Icons.calendar_today_outlined;
      case 'user':
      case 'person':
      case 'profile':
      case 'employee':
      case 'customer':
      case 'subordinate':
        return Icons.person_outline;
      case 'business':
      case 'company':
      case 'store':
      case 'shop':
      case 'vendor':
      case 'client':
        return Icons.business_outlined;
      case 'location':
      case 'place':
      case 'area':
      case 'pin':
      case 'map':
      case 'city':
      case 'branch':
        return Icons.location_on_outlined;
      case 'product':
      case 'box':
      case 'item':
      case 'inventory':
      case 'package':
        return Icons.inventory_2_outlined;
      case 'category':
      case 'type':
      case 'group':
      case 'classification':
        return Icons.category_outlined;
      case 'money':
      case 'dollar':
      case 'currency':
      case 'cash':
      case 'payment':
      case 'price':
        return Icons.attach_money;
      case 'percent':
      case 'percentage':
      case 'discount':
        return Icons.percent;
      case 'flag':
      case 'status':
        return Icons.flag_outlined;
      case 'phone':
      case 'call':
        return Icons.phone_outlined;
      case 'email':
      case 'mail':
        return Icons.email_outlined;
      case 'document':
      case 'note':
      case 'description':
        return Icons.description_outlined;
      case 'info':
        return Icons.info_outline;
      case 'tag':
      case 'label':
      default:
        return Icons.label_outline;
    }
  }

  final lowerRef = ref.toLowerCase();
  final lowerType = (fieldType ?? '').toLowerCase();

  if (lowerType == 'date' ||
      lowerType == 'datetime' ||
      lowerRef.contains('year') ||
      lowerRef.contains('tahun') ||
      lowerRef.contains('month') ||
      lowerRef.contains('bulan') ||
      lowerRef.contains('date') ||
      lowerRef.contains('tanggal') ||
      lowerRef.contains('period')) {
    return Icons.calendar_today_outlined;
  }

  if (lowerRef.contains('user') ||
      lowerRef.contains('person') ||
      lowerRef.contains('employee') ||
      lowerRef.contains('subordinate') ||
      lowerRef.contains('customer') ||
      lowerRef.contains('pelanggan')) {
    return Icons.person_outline;
  }

  if (lowerRef.contains('area') ||
      lowerRef.contains('location') ||
      lowerRef.contains('wilayah') ||
      lowerRef.contains('branch') ||
      lowerRef.contains('cabang')) {
    return Icons.location_on_outlined;
  }

  if (lowerRef.contains('product') ||
      lowerRef.contains('item') ||
      lowerRef.contains('barang')) {
    return Icons.inventory_2_outlined;
  }

  if (lowerRef.contains('type') ||
      lowerRef.contains('tipe') ||
      lowerRef.contains('category') ||
      lowerRef.contains('kategori')) {
    return Icons.category_outlined;
  }

  if (lowerRef.contains('status')) {
    return Icons.flag_outlined;
  }

  return Icons.label_outline;
}
