import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/widget/responsive_container.dart';

import '../../../../model/landing_page/landing_page.dart';
import '../landing_page.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({
    super.key,
    required this.landingPageData,
    required this.isMobile,
  });
  final LandingPageData landingPageData;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final maxWidth = landingPageData.theme.layout.maxWidth.toDouble();
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: hexToColor(landingPageData.theme.colors.surface),
      child: ResponsiveContainer(
        maxWidth: maxWidth,
        child: Column(
          children: [
            Text(
              landingPageData.features.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: hexToColor(landingPageData.theme.colors.textPrimary),
              ),
            ),
            SizedBox(height: 16),
            Text(
              landingPageData.features.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: hexToColor(landingPageData.theme.colors.textSecondary),
                height: 1.6,
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),
            if (isMobile) _buildMobileFeatures() else _buildDesktopFeatures(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileFeatures() {
    return Column(
      children: landingPageData.features.items
          .map<Widget>(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: FeatureCard(
                isMobile: isMobile,
                title: feature.title,
                description: feature.description,
                icon: getIconData(feature.icon),
                color: hexToColor(feature.color),
                themeData: landingPageData.theme.toJson(),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopFeatures() {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: landingPageData.features.items
          .map<Widget>(
            (feature) => FeatureCard(
              isMobile: isMobile,
              title: feature.title,
              description: feature.description,
              icon: getIconData(feature.icon),
              color: hexToColor(feature.color),
              themeData: landingPageData.theme.toJson(),
            ),
          )
          .toList(),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final bool isMobile;
  final Map<String, dynamic> themeData;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.isMobile,
    required this.themeData,
  }) : super(key: key);

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 35),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.bold,
              color: hexToColor(themeData["colors"]["text_primary"]),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: hexToColor(themeData["colors"]["text_secondary"]),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
