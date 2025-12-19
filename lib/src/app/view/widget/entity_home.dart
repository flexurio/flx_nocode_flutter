import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'error.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({
    super.key,
    required this.entity,
    required this.parentData,
    this.firstPage = false,
    this.embedded = false,
    this.initialFilters = const [],
    this.breadcrumbList = const [],
    required this.bypassPermission,
    this.configuration,
  });

  final bool firstPage;
  final bool embedded;
  final EntityCustom entity;
  final List<Filter> initialFilters;
  final List<String> breadcrumbList;
  final bool bypassPermission;
  final List<Map<String, dynamic>> parentData;
  final Configuration? configuration;

  static Widget fromId({
    required String entityId,
    String? accessToken,
    bool firstPage = false,
    bool embedded = false,
    List<String> breadcrumbList = const [],
    List<Filter> initialFilters = const [],
    bool bypassPermission = false,
    required List<Map<String, dynamic>> parentData,
  }) {
    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entityId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: NoCodeError('${snapshot.error}'));
        } else if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData) {
          final entity = snapshot.data;
          if (entity == null) {
            return Center(
              child: NoCodeError(
                'Entity not found! Id: $entityId',
                description:
                    'The requested entity with the ID "$entityId" could not be found. This might be due to an incorrect ID, or the entity may have been deleted.',
                suggestion:
                    'Please verify the entity ID. If the ID is correct, ensure the entity exists and you have the necessary permissions to access it.',
                debugInfo: 'Entity ID: $entityId',
              ),
            );
          }
          return MenuCustom(
            parentData: parentData,
            entity: entity,
            breadcrumbList: breadcrumbList,
            embedded: embedded,
            firstPage: firstPage,
            initialFilters: initialFilters,
            bypassPermission: bypassPermission,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (configuration != null) {
      Configuration.instance = configuration!;
      flavorConfig = configuration!.flavorConfig;
    }
    print(
        '[MenuCustom] level: ${parentData.length + 1}, parentData: ${parentData.length}');
    return Scaffold(
      appBar: embedded ? _buildAppBar(context, entity) : null,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          if (breadcrumbList.isNotEmpty) ...[
            BreadcrumbWithBack(
              items: [...breadcrumbList, entity.label],
              onBack: () {
                Navigator.of(context).pop();
              },
            ),
            Gap(12),
          ],
          if (!embedded)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TitlePage(entity: entity.coreEntity, x: true),
            ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MenuDataTableCustom.prepare(
              parentData: parentData,
              entity: entity,
              initialFilters: initialFilters,
              embedded: embedded,
              bypassPermission: bypassPermission,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, EntityCustom entity) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: BackButton(
        onPressed: () {
          if (firstPage) {
            Navigator.of(context, rootNavigator: true).pop(true);
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      title: Text(entity.label),
    );
  }
}

class BreadcrumbWithBack extends StatelessWidget {
  final List<String> items;
  final VoidCallback? onBack;

  const BreadcrumbWithBack({
    super.key,
    required this.items,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        children: [
          // Back button dengan styling minimal
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Breadcrumb items
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < items.length; i++) ...[
                    // Breadcrumb text
                    Text(
                      items[i],
                      style: TextStyle(
                        fontSize: 14,
                        color: i == items.length - 1
                            ? theme.colorScheme.onSurface
                            : theme.colorScheme.onSurface.withOpacity(0.6),
                        fontWeight: i == items.length - 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                    ),

                    // Separator
                    if (i < items.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.chevron_right,
                          size: 16,
                          color: theme.colorScheme.onSurface.withOpacity(0.4),
                        ),
                      ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoCodePageLoader extends StatefulWidget {
  final String entityId;
  final bool firstPage;
  final bool embedded;
  final List<String> breadcrumbList;
  final List<Filter> initialFilters;
  final String Function()? getAccess;
  final Configuration Function()? getConfiguration;
  final bool bypassPermission;
  final String? basePath;

  const NoCodePageLoader({
    super.key,
    required this.entityId,
    this.getAccess,
    this.firstPage = false,
    this.embedded = false,
    this.breadcrumbList = const [],
    this.initialFilters = const [],
    this.getConfiguration,
    this.basePath,
    required this.bypassPermission,
  });

  @override
  State<NoCodePageLoader> createState() => _NoCodePageLoaderState();
}

class _NoCodePageLoaderState extends State<NoCodePageLoader> {
  late Future<EntityCustom?> _future;

  @override
  void initState() {
    super.initState();
    if (widget.getAccess != null) {
      UserRepositoryApp.instance.token = widget.getAccess!();
    }
    if (widget.getConfiguration != null) {
      Configuration.instance = widget.getConfiguration!();
    }
    if (widget.basePath != null) EntityCustom.assetBasePath = widget.basePath!;
    _future = EntityCustom.getEntity(widget.entityId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EntityCustom?>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: NoCodeError('${snapshot.error}'));
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final entity = snapshot.data;
          if (entity == null) {
            return Center(
              child: NoCodeError('Entity not found! Id: ${widget.entityId}'),
            );
          }
          return MenuCustom(
            parentData: [],
            entity: entity,
            breadcrumbList: widget.breadcrumbList,
            embedded: widget.embedded,
            firstPage: widget.firstPage,
            initialFilters: widget.initialFilters,
            bypassPermission: widget.bypassPermission,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
