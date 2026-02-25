import 'dart:convert';

import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flx_nocode_flutter/src/app/util/resource_loader.dart';
import 'theme.dart' as t;

class Configuration extends HiveObject {
  final List<MenuGroup> menuGroups;
  final Company company;
  final t.ThemeC theme;
  final String appName;
  final String backendHost;
  final String logoUrl;
  final String logoNamedUrl;
  final String authUrl;
  final List<String> preload;
  final String? entityRegistration;
  final bool showLandingPage;
  final List<GlobalVariable> variables;

  Configuration({
    required this.menuGroups,
    required this.company,
    required this.theme,
    required this.appName,
    required this.backendHost,
    required this.logoUrl,
    required this.logoNamedUrl,
    required this.authUrl,
    required this.entityRegistration,
    required this.preload,
    required this.showLandingPage,
    this.variables = const [],
  });

  Configuration copyWith({
    List<MenuGroup>? menuGroups,
    Company? company,
    t.ThemeC? theme,
    String? appName,
    String? backendHost,
    String? logoUrl,
    String? logoNamedUrl,
    String? authUrl,
    String? entityRegistration,
    List<String>? preload,
    bool? showLandingPage,
    List<GlobalVariable>? variables,
  }) {
    return Configuration(
      variables: variables ?? this.variables,
      showLandingPage: showLandingPage ?? this.showLandingPage,
      preload: preload ?? this.preload,
      menuGroups: menuGroups ?? this.menuGroups,
      company: company ?? this.company,
      theme: theme ?? this.theme,
      appName: appName ?? this.appName,
      backendHost: backendHost ?? this.backendHost,
      logoUrl: logoUrl ?? this.logoUrl,
      logoNamedUrl: logoNamedUrl ?? this.logoNamedUrl,
      authUrl: authUrl ?? this.authUrl,
      entityRegistration: entityRegistration ?? this.entityRegistration,
    );
  }

  factory Configuration.fromJson(Map<String, dynamic> json) {
    try {
      return Configuration(
        showLandingPage: json['show_landing_page'] ?? false,
        preload: (json['preload'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            <String>[],
        authUrl: json['auth_url'] ?? '',
        backendHost: json['backend_host'] ??
            (throw Exception("Missing key: backend_host")),
        appName: json['app_name'] ?? (throw Exception("Missing key: app_name")),
        company: json['company'] != null
            ? Company.fromJson(json['company'])
            : (throw Exception("Missing key: company")),
        theme: json['theme'] != null
            ? t.ThemeC.fromJson(json['theme'])
            : (throw Exception("Missing key: theme")),
        logoUrl: json['logo_url'],
        logoNamedUrl: json['logo_named_url'],
        entityRegistration: json['entity_registration'],
        menuGroups: (json['menu_group'] as List<dynamic>?)
                ?.map((e) => MenuGroup.fromJson(e))
                .toList() ??
            (throw Exception("Missing or invalid key: menu_group")),
        variables: (json['variables'] as List<dynamic>?)
                ?.map((e) => GlobalVariable.fromJson(e))
                .toList() ??
            [],
      );
    } catch (e) {
      throw Exception('Failed to parse configuration: $e');
    }
  }

  factory Configuration.empty() {
    return Configuration(
      showLandingPage: false,
      preload: [],
      menuGroups: [
        MenuGroup(
          label: "Master",
          menu: [
            Menu(
              label: "Entity",
              icon: "fa fa-database",
              menuSub: [
                MenuSub(label: "FLX Roles", entity: "flx_roles"),
                MenuSub(label: "FLX Users", entity: "flx_users"),
              ],
            ),
          ],
        ),
      ],
      company: Company.empty(),
      theme: t.ThemeC(),
      appName: 'Dummy',
      logoUrl: 'https://dummy.com/logo.png',
      logoNamedUrl: 'https://dummy.com/logo_named.png',
      backendHost: 'http://0.0.0.0:8080',
      authUrl: 'http://0.0.0.0:8080/login',
      entityRegistration: null,
    );
  }

  static late Configuration instance;

  static String assetBasePath = 'asset';
  static String fileSystemBasePath = '.';
  static bool preferFileSystem = false;

  static load({String? basePath, bool useFileSystem = false}) async {
    try {
      final data = await loadFromAssetOrFile(
        relativePath: 'configuration/configuration.json',
        assetBasePath: assetBasePath,
        fileSystemBasePath: fileSystemBasePath,
        preferFileSystem: preferFileSystem,
        useFileSystem: useFileSystem,
        overrideBasePath: basePath,
      );
      Configuration.instance = Configuration.fromJson(json.decode(data));
      print('[Configuration] Configuration found');
    } catch (e) {
      print('[Configuration] Error loading configuration: $e');
      throw Exception('Failed to parse configuration: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'backend_host': backendHost,
      'app_name': appName,
      'menu_group': menuGroups.map((e) => e.toJson()).toList(),
      'company': company.toJson(),
      'theme': theme.toJson(),
      'logo_url': logoUrl,
      'logo_named_url': logoNamedUrl,
      'auth_url': authUrl,
      'preload': preload,
      'entity_registration': entityRegistration,
      'variables': variables.map((e) => e.toJson()).toList(),
    };
  }

  List<core.Menu1> menu() {
    return menuGroups
        .map(
          (e) => core.Menu1(
            label: e.label,
            menu: e.menu
                .map(
                  (e) => core.Menu2(
                    label: e.label,
                    icon: Icons.list,
                    menu: e.menuSub
                        .map(
                          (e) => core.Menu3(
                            label: e.label,
                            home: MenuCustom.fromId(
                                entityId: e.entity, parentData: []),
                            permissions: [],
                            permission: e.entity + '_read',
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}

extension ConfigurationExtension on Configuration {
  core.FlavorConfig get flavorConfig => core.FlavorConfig(
        companyId: company.id,
        companyName: company.name,
        companyPhone: company.phone,
        companyWebsite: company.website,
        companyAddress: company.address,
        apiUrl: backendHost,
        color: core.colorFromHex(theme.color),
        colorSoft: core.colorFromHex(theme.colorSoft),
        backgroundLoginPage: 'asset/image/background-3.jpg',
        applicationConfig: null,
      );
}

class Company extends HiveObject {
  final String id;
  final String name;
  final String phone;
  final String website;
  final String address;

  Company({
    required this.id,
    required this.name,
    required this.phone,
    required this.website,
    required this.address,
  });

  Company copyWith({
    String? id,
    String? name,
    String? phone,
    String? website,
    String? address,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      address: address ?? this.address,
    );
  }

  factory Company.empty() {
    return Company(
      id: 'dummy_id',
      name: 'Dummy Company',
      phone: '+6281234567890',
      website: 'https://dummy.com',
      address: 'Jalan Dummy No. 123, Kota Dummy',
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      website: json['website'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'website': website,
      'address': address,
    };
  }
}

class MenuGroup extends HiveObject {
  final String label;
  final List<Menu> menu;

  MenuGroup({required this.label, required this.menu});

  MenuGroup copyWith({
    String? label,
    List<Menu>? menu,
  }) {
    return MenuGroup(
      label: label ?? this.label,
      menu: menu ?? this.menu,
    );
  }

  factory MenuGroup.fromJson(Map<String, dynamic> json) {
    return MenuGroup(
      label: json['label'],
      menu:
          (json['menu'] as List<dynamic>).map((e) => Menu.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'menu': menu.map((e) => e.toJson()).toList(),
    };
  }
}

class Menu extends HiveObject {
  final String label;
  final String icon;
  final List<MenuSub> menuSub;

  Menu({
    required this.label,
    required this.icon,
    required this.menuSub,
  });

  Menu copyWith({
    String? label,
    String? icon,
    List<MenuSub>? menuSub,
  }) {
    return Menu(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      menuSub: menuSub ?? this.menuSub,
    );
  }

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      label: json['label'],
      icon: json['icon'],
      menuSub: (json['menu_sub'] as List<dynamic>)
          .map((e) => MenuSub.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'icon': icon,
      'menu_sub': menuSub.map((e) => e.toJson()).toList(),
    };
  }
}

class MenuSub extends HiveObject {
  final String label;
  final String entity;

  MenuSub({required this.label, required this.entity});

  MenuSub copyWith({
    String? label,
    String? entity,
  }) {
    return MenuSub(
      label: label ?? this.label,
      entity: entity ?? this.entity,
    );
  }

  factory MenuSub.fromJson(Map<String, dynamic> json) {
    return MenuSub(
      label: json['label'],
      entity: json['entity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'entity': entity,
    };
  }
}

class GlobalVariable extends HiveObject {
  final String key;
  final String value;
  final String description;

  GlobalVariable({
    required this.key,
    this.value = '',
    this.description = '',
  });

  GlobalVariable copyWith({
    String? key,
    String? value,
    String? description,
  }) {
    return GlobalVariable(
      key: key ?? this.key,
      value: value ?? this.value,
      description: description ?? this.description,
    );
  }

  factory GlobalVariable.fromJson(Map<String, dynamic> json) {
    return GlobalVariable(
      key: json['key'],
      value: json['value'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      'description': description,
    };
  }
}
