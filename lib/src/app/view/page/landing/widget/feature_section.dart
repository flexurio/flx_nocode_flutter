import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/widget/responsive_container.dart';

import '../../../../model/landing_page/landing_page.dart';
import '../../../widget/entity_data_table.dart';
import '../landing_page.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({
    super.key,
    required this.landingPageData,
    required this.isMobile,
  });

  final LandingPageData landingPageData;
  final bool isMobile;

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  EntityCustom? _entity;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEntity();
  }

  Future<void> _loadEntity() async {
    final data = await widget.landingPageData.features.getEntity();
    if (mounted) {
      setState(() {
        _entity = data;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = widget.landingPageData.theme.layout.maxWidth.toDouble();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 60 : 100,
        horizontal: widget.isMobile ? 20 : 40,
      ),
      color: hexToColor(widget.landingPageData.theme.colors.surface),
      child: ResponsiveContainer(
        maxWidth: maxWidth,
        child: Column(
          children: [
            Text(
              widget.landingPageData.features.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color:
                    hexToColor(widget.landingPageData.theme.colors.textPrimary),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.landingPageData.features.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.isMobile ? 16 : 18,
                color: hexToColor(
                    widget.landingPageData.theme.colors.textSecondary),
                height: 1.6,
              ),
            ),
            SizedBox(height: widget.isMobile ? 40 : 60),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_entity != null)
              MenuDataTableCustom.prepare(
                parentData: [],
                bypassPermission: false,
                entity: _entity!,
                embedded: true,
              ),
          ],
        ),
      ),
    );
  }
}
