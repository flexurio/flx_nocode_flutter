import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/widget/responsive_container.dart';
import 'package:go_router/go_router.dart';

class LandingAppBar extends StatefulWidget {
  final double scrollOffset;
  final bool isMobile;
  final Map<String, dynamic> themeData;
  final Map<String, dynamic> contentData;

  const LandingAppBar({
    Key? key,
    required this.scrollOffset,
    required this.isMobile,
    required this.themeData,
    required this.contentData,
  }) : super(key: key);

  @override
  State<LandingAppBar> createState() => _LandingAppBarState();
}

class _LandingAppBarState extends State<LandingAppBar> {
  void _showMobileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (String item in widget.contentData["navigation"]["items"])
                ListTile(
                  title: Text(item),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ListTile(
                title: Text(widget.contentData["navigation"]["cta_primary"]),
                onTap: () {
                  context.go('/sign-in');
                },
              ),
              ListTile(
                title: Text(widget.contentData["navigation"]["cta_secondary"]),
                onTap: () {
                  // Secondary action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Color hexToColor(String hex) {
    return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
  }

  List<Widget> _buildDesktopNavigation(BuildContext context) {
    List<Widget> navItems = [];

    for (String item in widget.contentData["navigation"]["items"]) {
      navItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextButton(
            onPressed: () {
              // Navigasi bisa kamu sesuaikan
            },
            child: Text(
              item,
              style: TextStyle(
                color: Color.lerp(
                  Colors.white,
                  Colors.black,
                  widget.scrollOffset / 100,
                ),
              ),
            ),
          ),
        ),
      );
    }

    navItems.addAll([
      SizedBox(width: 16),
      OutlinedButton(
        onPressed: () {
          context.go('/sign-in');
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Color.lerp(
            Colors.white,
            hexToColor(widget.themeData["colors"]["primary"]),
            widget.scrollOffset / 100,
          ),
          side: BorderSide(
            color: Color.lerp(
              Colors.white,
              hexToColor(widget.themeData["colors"]["primary"]),
              widget.scrollOffset / 100,
            )!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(widget.contentData["navigation"]["cta_primary"]),
      ),
      SizedBox(width: 8),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: hexToColor(widget.themeData["colors"]["primary"]),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(widget.contentData["navigation"]["cta_secondary"]),
      ),
    ]);

    return navItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Color.lerp(
          Colors.transparent,
          Colors.white,
          widget.scrollOffset / 100,
        ),
        boxShadow: widget.scrollOffset >= 100
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ]
            : [],
      ),
      child: ResponsiveContainer(
        maxWidth: widget.themeData["layout"]["max_width"].toDouble(),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexToColor(widget.themeData["colors"]["primary"]),
                    hexToColor(widget.themeData["colors"]["secondary"]),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.rocket_launch, color: Colors.white, size: 24),
            ),
            SizedBox(width: 12),
            Text(
              widget.contentData["company"]["name"],
              style: TextStyle(
                color: widget.scrollOffset >= 100 ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 20 : 24,
              ),
            ),
            Spacer(),
            if (!widget.isMobile) ..._buildDesktopNavigation(context),
            if (widget.isMobile)
              IconButton(
                onPressed: _showMobileMenu,
                icon: Icon(
                  Icons.menu,
                  color: Color.lerp(
                    Colors.white,
                    Colors.black,
                    widget.scrollOffset / 100,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
