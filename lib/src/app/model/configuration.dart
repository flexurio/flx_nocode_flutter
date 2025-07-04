import 'dart:convert';

import 'package:flx_nocode_flutter/src/app/model/backend_other.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Configuration {
  final List<MenuGroup> menuGroups;
  final Company company;
  final Theme theme;
  final String appName;
  final String backendHost;
  final String logoUrl;
  final String logoNamedUrl;
  final String authUrl;

  Configuration._({
    required this.menuGroups,
    required this.company,
    required this.theme,
    required this.appName,
    required this.backendHost,
    required this.logoUrl,
    required this.logoNamedUrl,
    required this.authUrl,
  });

  static late Configuration instance;

  static load() async {
    final path = 'asset/configuration/configuration.json';
    final data = await rootBundle.loadString(path);
    Configuration.instance = Configuration.fromJson(json.decode(data));
  }

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration._(
      authUrl: json['auth_url'],
      backendHost: json['backend_host'],
      appName: json['app_name'],
      company: Company.fromJson(json['company']),
      theme: Theme.fromJson(json['theme']),
      logoUrl: json['logo_url'],
      logoNamedUrl: json['logo_named_url'],
      menuGroups: (json['menu_group'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e))
          .toList(),
    );
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
    };
  }

  core.FlavorConfig get flavorConfig => core.FlavorConfig(
        companyId: company.id,
        companyName: company.name,
        companyPhone: company.phone,
        companyWebsite: company.website,
        companyAddress: company.address,
        apiUrl: '',
        color: core.colorFromHex(theme.color),
        colorSoft: core.colorFromHex(theme.colorSoft),
        backgroundLoginPage: 'asset/image/background-3.jpg',
        applicationConfig: null,
      );

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
                            home: MenuCustom(entityId: e.entity),
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

class Theme {
  final String color;
  final String colorSoft;

  Theme({
    required this.color,
    required this.colorSoft,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      color: json['color'],
      colorSoft: json['color_soft'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'color_soft': colorSoft,
    };
  }
}

class Company {
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

class Backend {
  final BackendEndpoint? readAll;
  final BackendEndpoint? read;
  final BackendEndpoint? create;
  final BackendEndpoint? update;
  final BackendEndpoint? delete;
  final List<BackendOther> others;

  Backend({
    this.readAll,
    this.read,
    this.create,
    this.update,
    this.delete,
    required this.others,
  });

  factory Backend.fromJson(Map<String, dynamic> json) {
    try {
      return Backend(
        others: json['others'] != null
            ? BackendOther.fromJsonList(json['others'])
            : [],
        readAll: json['read_all'] != null
            ? BackendEndpoint.fromJson(json['read_all'])
            : null,
        read: json['read'] != null
            ? BackendEndpoint.fromJson(json['read'])
            : null,
        create: json['create'] != null
            ? BackendEndpoint.fromJson(json['create'])
            : null,
        update: json['update'] != null
            ? BackendEndpoint.fromJson(json['update'])
            : null,
        delete: json['delete'] != null
            ? BackendEndpoint.fromJson(json['delete'])
            : null,
      );
    } catch (e) {
      print('[Backend] fromJson: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'read_all': readAll?.toJson(),
      'read': read?.toJson(),
      'create': create?.toJson(),
      'update': update?.toJson(),
      'delete': delete?.toJson(),
    };
  }
}

class BackendEndpoint {
  final String method;
  final String url;
  final Map<String, dynamic>? data;

  BackendEndpoint(
      {required this.method, required this.url, required this.data});

  String get urlWithValues {
    return urlWithValuesReplace(url, data ?? {});
  }

  factory BackendEndpoint.fromJson(Map<String, dynamic> json) {
    try {
      return BackendEndpoint(
        method: json['method'],
        url: json['url'],
        data: json['data'],
      );
    } catch (e) {
      print('[BackendEndpoint] fromJson: $e');
      rethrow;
    }
  }

  Map<String, dynamic> get body {
    return mapAddPageData(data ?? {});
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'data': data,
    };
  }
}

class MenuGroup {
  final String label;
  final List<Menu> menu;

  MenuGroup({required this.label, required this.menu});

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

class Menu {
  final String label;
  final String icon;
  final List<MenuSub> menuSub;

  Menu({
    required this.label,
    required this.icon,
    required this.menuSub,
  });

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

class MenuSub {
  final String label;
  final String entity;

  MenuSub({required this.label, required this.entity});

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
