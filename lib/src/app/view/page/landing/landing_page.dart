import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/widget/feature_section.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/widget/landing_app_bar.dart';

import '../../../model/landing_page/landing_page.dart';
import 'widget/responsive_container.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  double _scrollOffset = 0;

  // Content data from JSON
  Map<String, dynamic> contentData = {};
  Map<String, dynamic> themeData = {};
  LandingPageData? landingPageData;

  @override
  void initState() {
    super.initState();
    _loadContent();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    _scrollController.addListener(() {
      final offset = _scrollController.offset.clamp(0.0, 100.0);
      print(offset.toString());
      setState(() {
        _scrollOffset = offset;
      });
    });
  }

  Future<void> _loadContent() async {
    final jsonString =
        await rootBundle.loadString('asset/configuration/landing_page.json');
    landingPageData = LandingPageData.fromRawJson(jsonString);
    contentData = json.decode(jsonString);
    themeData = contentData['theme'];

    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  bool get isMobile =>
      MediaQuery.of(context).size.width <
      themeData["layout"]["mobile_breakpoint"];
  bool get isTablet =>
      MediaQuery.of(context).size.width <
      themeData["layout"]["tablet_breakpoint"];

  Widget _buildResponsiveContainer({
    required Widget child,
    bool fullWidth = false,
  }) {
    return ResponsiveContainer(
      fullWidth: fullWidth,
      maxWidth: themeData["layout"]["max_width"].toDouble(),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                ListView(
                  controller: _scrollController,
                  children: [
                    _buildHeroSection(),
                    _buildFeaturesSection(),
                    _buildServicesSection(),
                    _buildStatsSection(),
                    _buildTestimonialsSection(),
                    _buildTeamSection(),
                    _buildPricingSection(),
                    _buildContactSection(),
                    _buildFooter(),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LandingAppBar(
                    scrollOffset: _scrollOffset,
                    isMobile: isMobile,
                    themeData: themeData,
                    contentData: contentData,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: themeData["gradients"]["hero"]
              .map<Color>((color) => hexToColor(color))
              .toList(),
        ),
      ),
      child: Stack(
        children: [
          if (!isMobile)
            ...List.generate(20, (index) => _buildFloatingParticle(index)),
          _buildResponsiveContainer(
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        contentData["hero"]["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile
                              ? 32
                              : isTablet
                                  ? 42
                                  : 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        contentData["hero"]["subtitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 40),
                      if (isMobile)
                        _buildMobileHeroButtons()
                      else
                        _buildDesktopHeroButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHeroButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: hexToColor(themeData["colors"]["primary"]),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_arrow),
              SizedBox(width: 8),
              Text(contentData["hero"]["primary_button"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(width: 20),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.white, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline),
              SizedBox(width: 8),
              Text(contentData["hero"]["secondary_button"],
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeroButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: hexToColor(themeData["colors"]["primary"]),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow),
                SizedBox(width: 8),
                Text(contentData["hero"]["primary_button"],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white, width: 2),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 8),
                Text(contentData["hero"]["secondary_button"],
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingParticle(int index) {
    return Positioned(
      left: (index * 73) % MediaQuery.of(context).size.width,
      top: (index * 127) % MediaQuery.of(context).size.height,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 2000 + (index * 200)),
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(0, -20 * value),
            child: Opacity(
              opacity: (1 - value) * 0.6,
              child: Container(
                width: 4 + (index % 3) * 2,
                height: 4 + (index % 3) * 2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //
  Widget _buildFeaturesSection() {
    return FeatureSection(
      key: ValueKey("feature_section"),
      isMobile: isMobile,
      landingPageData: landingPageData!,
    );
    //   return Container(
    //     padding: EdgeInsets.symmetric(
    //       vertical: isMobile ? 60 : 100,
    //       horizontal: isMobile ? 20 : 40,
    //     ),
    //     color: hexToColor(themeData["colors"]["surface"]),
    //     child: _buildResponsiveContainer(
    //       child: Column(
    //         children: [
    //           Text(
    //             contentData["features"]["title"],
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: isMobile ? 28 : 42,
    //               fontWeight: FontWeight.bold,
    //               color: hexToColor(themeData["colors"]["text_primary"]),
    //             ),
    //           ),
    //           SizedBox(height: 16),
    //           Text(
    //             contentData["features"]["subtitle"],
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: isMobile ? 16 : 18,
    //               color: hexToColor(themeData["colors"]["text_secondary"]),
    //               height: 1.6,
    //             ),
    //           ),
    //           SizedBox(height: isMobile ? 40 : 60),
    //           if (isMobile) _buildMobileFeatures() else _buildDesktopFeatures(),
    //         ],
    //       ),
    //     ),
    //   );
  }
  //
  // Widget _buildMobileFeatures() {
  //   return Column(
  //     children: contentData["features"]["items"]
  //         .map<Widget>(
  //           (feature) => Padding(
  //             padding: EdgeInsets.only(bottom: 24),
  //             child: _buildFeatureCard(
  //               getIconData(feature["icon"]),
  //               feature["title"],
  //               feature["description"],
  //               hexToColor(feature["color"]),
  //             ),
  //           ),
  //         )
  //         .toList(),
  //   );
  // }
  //
  // Widget _buildDesktopFeatures() {
  //   return Wrap(
  //     spacing: 30,
  //     runSpacing: 30,
  //     alignment: WrapAlignment.center,
  //     children: contentData["features"]["items"]
  //         .map<Widget>(
  //           (feature) => _buildFeatureCard(
  //             getIconData(feature["icon"]),
  //             feature["title"],
  //             feature["description"],
  //             hexToColor(feature["color"]),
  //           ),
  //         )
  //         .toList(),
  //   );
  // }
  //
  // Widget _buildFeatureCard(
  //     IconData icon, String title, String description, Color color) {
  //   return Container(
  //     width: isMobile ? double.infinity : 350,
  //     padding: EdgeInsets.all(isMobile ? 20 : 30),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 20,
  //           offset: Offset(0, 10),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 70,
  //           height: 70,
  //           decoration: BoxDecoration(
  //             color: color.withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(16),
  //           ),
  //           child: Icon(icon, color: color, size: 35),
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: isMobile ? 20 : 22,
  //             fontWeight: FontWeight.bold,
  //             color: hexToColor(themeData["colors"]["text_primary"]),
  //           ),
  //         ),
  //         SizedBox(height: 12),
  //         Text(
  //           description,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: isMobile ? 14 : 16,
  //             color: hexToColor(themeData["colors"]["text_secondary"]),
  //             height: 1.5,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildServicesSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: Colors.white,
      child: _buildResponsiveContainer(
        child: Column(
          children: [
            Text(
              contentData["services"]["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: hexToColor(themeData["colors"]["text_primary"]),
              ),
            ),
            SizedBox(height: 16),
            Text(
              contentData["services"]["subtitle"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: hexToColor(themeData["colors"]["text_secondary"]),
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),
            if (isMobile) _buildMobileServices() else _buildDesktopServices(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileServices() {
    return Column(
      children: contentData["services"]["items"]
          .map<Widget>(
            (service) => Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: _buildServiceCard(
                service["title"],
                service["description"],
                List<String>.from(service["technologies"]),
                getIconData(service["icon"]),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopServices() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contentData["services"]["items"]
          .map<Widget>(
            (service) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: _buildServiceCard(
                  service["title"],
                  service["description"],
                  List<String>.from(service["technologies"]),
                  getIconData(service["icon"]),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildServiceCard(String title, String description,
      List<String> technologies, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isMobile ? 150 : 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  hexToColor(themeData["colors"]["primary"]),
                  hexToColor(themeData["colors"]["secondary"]),
                ],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(
                icon,
                size: isMobile ? 50 : 60,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: hexToColor(themeData["colors"]["text_primary"]),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: hexToColor(themeData["colors"]["text_secondary"]),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: technologies
                      .map((tech) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: hexToColor(themeData["colors"]["primary"])
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      hexToColor(themeData["colors"]["primary"])
                                          .withOpacity(0.3)),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                color:
                                    hexToColor(themeData["colors"]["primary"]),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeData["gradients"]["stats"]
              .map<Color>((color) => hexToColor(color))
              .toList(),
        ),
      ),
      child: _buildResponsiveContainer(
        child: isMobile ? _buildMobileStats() : _buildDesktopStats(),
      ),
    );
  }

  Widget _buildMobileStats() {
    return Column(
      children: contentData["stats"]["items"]
          .map<Widget>(
            (stat) => Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _buildStatItem(stat["number"], stat["label"]),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: contentData["stats"]["items"]
          .map<Widget>(
            (stat) => _buildStatItem(stat["number"], stat["label"]),
          )
          .toList(),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: isMobile ? 36 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: hexToColor(themeData["colors"]["surface"]),
      child: _buildResponsiveContainer(
        child: Column(
          children: [
            Text(
              contentData["testimonials"]["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: hexToColor(themeData["colors"]["text_primary"]),
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),
            if (isMobile)
              _buildMobileTestimonials()
            else
              _buildDesktopTestimonials(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileTestimonials() {
    return Column(
      children: contentData["testimonials"]["items"]
          .map<Widget>(
            (testimonial) => Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: _buildTestimonialCard(
                testimonial["text"],
                testimonial["name"],
                testimonial["position"],
                testimonial["rating"],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopTestimonials() {
    return Row(
      children: contentData["testimonials"]["items"]
          .map<Widget>(
            (testimonial) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: _buildTestimonialCard(
                  testimonial["text"],
                  testimonial["name"],
                  testimonial["position"],
                  testimonial["rating"],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTestimonialCard(
      String testimonial, String name, String position, int rating) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                rating,
                (index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    )),
          ),
          SizedBox(height: 20),
          Text(
            '"$testimonial"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: hexToColor(themeData["colors"]["text_secondary"]),
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor:
                    hexToColor(themeData["colors"]["primary"]).withOpacity(0.1),
                child: Text(
                  name.split(' ').map((n) => n[0]).join(),
                  style: TextStyle(
                    color: hexToColor(themeData["colors"]["primary"]),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: hexToColor(themeData["colors"]["text_primary"]),
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                    Text(
                      position,
                      style: TextStyle(
                        color:
                            hexToColor(themeData["colors"]["text_secondary"]),
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: Colors.white,
      child: _buildResponsiveContainer(
        child: Column(
          children: [
            Text(
              contentData["team"]["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: hexToColor(themeData["colors"]["text_primary"]),
              ),
            ),
            SizedBox(height: 16),
            Text(
              contentData["team"]["subtitle"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: hexToColor(themeData["colors"]["text_secondary"]),
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),
            if (isMobile) _buildMobileTeam() else _buildDesktopTeam(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileTeam() {
    return Column(
      children: contentData["team"]["members"]
          .map<Widget>(
            (member) => Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: _buildTeamMember(
                member["name"],
                member["role"],
                member["experience"],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopTeam() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: contentData["team"]["members"]
          .map<Widget>(
            (member) => _buildTeamMember(
              member["name"],
              member["role"],
              member["experience"],
            ),
          )
          .toList(),
    );
  }

  Widget _buildTeamMember(String name, String role, String experience) {
    return Column(
      children: [
        Container(
          width: isMobile ? 100 : 120,
          height: isMobile ? 100 : 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexToColor(themeData["colors"]["primary"]),
                hexToColor(themeData["colors"]["secondary"]),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            size: isMobile ? 50 : 60,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.bold,
            color: hexToColor(themeData["colors"]["text_primary"]),
          ),
        ),
        SizedBox(height: 8),
        Text(
          role,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: hexToColor(themeData["colors"]["primary"]),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          experience,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: hexToColor(themeData["colors"]["text_secondary"]),
          ),
        ),
      ],
    );
  }

  Widget _buildPricingSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: hexToColor(themeData["colors"]["surface"]),
      child: _buildResponsiveContainer(
        child: Column(
          children: [
            Text(
              contentData["pricing"]["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: hexToColor(themeData["colors"]["text_primary"]),
              ),
            ),
            SizedBox(height: 16),
            Text(
              contentData["pricing"]["subtitle"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: hexToColor(themeData["colors"]["text_secondary"]),
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),
            if (isMobile) _buildMobilePricing() else _buildDesktopPricing(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobilePricing() {
    return Column(
      children: contentData["pricing"]["packages"]
          .map<Widget>(
            (package) => Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: _buildPricingCard(
                package["name"],
                package["price"],
                List<String>.from(package["features"]),
                package["popular"] ?? false,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopPricing() {
    return Row(
      children: contentData["pricing"]["packages"]
          .map<Widget>(
            (package) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: _buildPricingCard(
                  package["name"],
                  package["price"],
                  List<String>.from(package["features"]),
                  package["popular"] ?? false,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPricingCard(
      String title, String price, List<String> features, bool isPopular) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isPopular
            ? Border.all(
                color: hexToColor(themeData["colors"]["primary"]), width: 3)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: hexToColor(themeData["colors"]["primary"]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'MOST POPULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          if (isPopular) SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: hexToColor(themeData["colors"]["text_primary"]),
            ),
          ),
          SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Rp ',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    color: hexToColor(themeData["colors"]["text_secondary"]),
                  ),
                ),
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: isPopular
                        ? hexToColor(themeData["colors"]["primary"])
                        : hexToColor(themeData["colors"]["text_primary"]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ...features
              .map((feature) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: hexToColor(themeData["colors"]["success"]),
                            size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              color: hexToColor(
                                  themeData["colors"]["text_secondary"]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPopular
                    ? hexToColor(themeData["colors"]["primary"])
                    : hexToColor(themeData["colors"]["text_primary"]),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                'Pilih Paket',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      color: Colors.white,
      child: _buildResponsiveContainer(
        child: isMobile ? _buildMobileContact() : _buildDesktopContact(),
      ),
    );
  }

  Widget _buildMobileContact() {
    return Column(
      children: [
        _buildContactInfo(),
        SizedBox(height: 40),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildDesktopContact() {
    return Row(
      children: [
        Expanded(child: _buildContactInfo()),
        SizedBox(width: 60),
        Expanded(child: _buildContactForm()),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contentData["contact"]["title"],
          style: TextStyle(
            fontSize: isMobile ? 28 : 42,
            fontWeight: FontWeight.bold,
            color: hexToColor(themeData["colors"]["text_primary"]),
          ),
        ),
        SizedBox(height: 16),
        Text(
          contentData["contact"]["subtitle"],
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: hexToColor(themeData["colors"]["text_secondary"]),
            height: 1.6,
          ),
        ),
        SizedBox(height: 40),
        ...contentData["contact"]["info"]
            .map<Widget>(
              (info) => Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: _buildContactInfoItem(
                  getIconData(info["icon"]),
                  info["title"],
                  info["value"],
                ),
              ),
            )
            .toList(),
        SizedBox(height: 40),
        Row(
          children: contentData["footer"]["social"]
              .map<Widget>(
                (social) => Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: _buildSocialButton(
                    getIconData(social["icon"]),
                    hexToColor(social["color"]),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildContactInfoItem(IconData icon, String title, String info) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: hexToColor(themeData["colors"]["primary"]).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon,
              color: hexToColor(themeData["colors"]["primary"]), size: 24),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: hexToColor(themeData["colors"]["text_primary"]),
                ),
              ),
              SizedBox(height: 4),
              Text(
                info,
                style: TextStyle(
                  fontSize: 16,
                  color: hexToColor(themeData["colors"]["text_secondary"]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: EdgeInsets.all(isMobile ? 30 : 40),
      decoration: BoxDecoration(
        color: hexToColor(themeData["colors"]["surface"]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contentData["contact"]["form"]["title"],
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: hexToColor(themeData["colors"]["text_primary"]),
            ),
          ),
          SizedBox(height: 30),
          ...contentData["contact"]["form"]["fields"]
              .map<Widget>(
                (field) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: _buildTextField(
                    field["label"],
                    getIconData(field["icon"]),
                    maxLines: field["type"] == "textarea" ? 4 : 1,
                  ),
                ),
              )
              .toList(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: hexToColor(themeData["colors"]["primary"]),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 8),
                  Text(
                    'Kirim Pesan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:
            Icon(icon, color: hexToColor(themeData["colors"]["primary"])),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: hexToColor(themeData["colors"]["primary"]), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeData["gradients"]["footer"]
              .map<Color>((color) => hexToColor(color))
              .toList(),
        ),
      ),
      child: _buildResponsiveContainer(
        child: Column(
          children: [
            if (isMobile) _buildMobileFooter() else _buildDesktopFooter(),
            SizedBox(height: isMobile ? 30 : 50),
            Container(height: 1, color: Colors.grey.shade800),
            SizedBox(height: 30),
            if (isMobile)
              _buildMobileFooterBottom()
            else
              _buildDesktopFooterBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildFooterLogo(),
        SizedBox(height: 30),
        _buildFooterLinks(),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildFooterLogo()),
        SizedBox(width: 60),
        Expanded(
            child: _buildFooterColumn(
                "Layanan", contentData["footer"]["links"]["services"])),
        SizedBox(width: 40),
        Expanded(
            child: _buildFooterColumn(
                "Perusahaan", contentData["footer"]["links"]["company"])),
        SizedBox(width: 40),
        Expanded(
            child: _buildFooterColumn(
                "Support", contentData["footer"]["links"]["support"])),
      ],
    );
  }

  Widget _buildFooterLogo() {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexToColor(themeData["colors"]["primary"]),
                    hexToColor(themeData["colors"]["secondary"]),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.rocket_launch, color: Colors.white, size: 24),
            ),
            SizedBox(width: 12),
            Text(
              contentData["company"]["name"],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          contentData["footer"]["description"],
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: contentData["footer"]["social"]
              .map<Widget>(
                (social) => Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: _buildFooterSocialButton(
                    getIconData(social["icon"]),
                    hexToColor(social["color"]),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildFooterLinks() {
    return Column(
      children: [
        _buildFooterColumn(
            "Layanan", contentData["footer"]["links"]["services"]),
        SizedBox(height: 30),
        _buildFooterColumn(
            "Perusahaan", contentData["footer"]["links"]["company"]),
        SizedBox(height: 30),
        _buildFooterColumn(
            "Support", contentData["footer"]["links"]["support"]),
      ],
    );
  }

  Widget _buildFooterColumn(String title, List<dynamic> links) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 20),
        ...links
            .map<Widget>(
              (link) => Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: _buildFooterLink(link),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildFooterSocialButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: color, size: 20),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildMobileFooterBottom() {
    return Column(
      children: [
        Text(
          contentData["footer"]["copyright"],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 16),
        Text(
          contentData["footer"]["made_with"],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopFooterBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          contentData["footer"]["copyright"],
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
        Text(
          contentData["footer"]["made_with"],
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

Color hexToColor(String hex) {
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'speed':
      return Icons.speed;
    case 'security':
      return Icons.security;
    case 'support_agent':
      return Icons.support_agent;
    case 'trending_up':
      return Icons.trending_up;
    case 'attach_money':
      return Icons.attach_money;
    case 'insights':
      return Icons.insights;
    case 'web':
      return Icons.web;
    case 'smartphone':
      return Icons.smartphone;
    case 'cloud':
      return Icons.cloud;
    case 'location_on':
      return Icons.location_on;
    case 'phone':
      return Icons.phone;
    case 'email':
      return Icons.email;
    case 'access_time':
      return Icons.access_time;
    case 'person':
      return Icons.person;
    case 'message':
      return Icons.message;
    default:
      return Icons.star;
  }
}
