import 'dart:convert';

import 'features.dart';

class LandingPageData {
  final Company company;
  final Navigation navigation;
  final HeroSection hero;
  final Features features;
  final Services services;
  final Stats stats;
  final Testimonials testimonials;
  final Team team;
  final Pricing pricing;
  final Contact contact;
  final Footer footer;
  final ThemeConfig theme;

  LandingPageData({
    required this.company,
    required this.navigation,
    required this.hero,
    required this.features,
    required this.services,
    required this.stats,
    required this.testimonials,
    required this.team,
    required this.pricing,
    required this.contact,
    required this.footer,
    required this.theme,
  });

  factory LandingPageData.fromJson(Map<String, dynamic> json) =>
      LandingPageData(
        company: Company.fromJson(json['company']),
        navigation: Navigation.fromJson(json['navigation']),
        hero: HeroSection.fromJson(json['hero']),
        features: Features.fromJson(json['features']),
        services: Services.fromJson(json['services']),
        stats: Stats.fromJson(json['stats']),
        testimonials: Testimonials.fromJson(json['testimonials']),
        team: Team.fromJson(json['team']),
        pricing: Pricing.fromJson(json['pricing']),
        contact: Contact.fromJson(json['contact']),
        footer: Footer.fromJson(json['footer']),
        theme: ThemeConfig.fromJson(json['theme']),
      );

  Map<String, dynamic> toJson() => {
        "company": company.toJson(),
        "navigation": navigation.toJson(),
        "hero": hero.toJson(),
        "features": features.toJson(),
        "services": services.toJson(),
        "stats": stats.toJson(),
        "testimonials": testimonials.toJson(),
        "team": team.toJson(),
        "pricing": pricing.toJson(),
        "contact": contact.toJson(),
        "footer": footer.toJson(),
        "theme": theme.toJson(),
      };

  static LandingPageData fromRawJson(String str) =>
      LandingPageData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

class Company {
  final String name;
  final String logo;

  Company({required this.name, required this.logo});

  factory Company.fromJson(Map<String, dynamic> json) =>
      Company(name: json['name'], logo: json['logo']);

  Map<String, dynamic> toJson() => {"name": name, "logo": logo};
}

class Navigation {
  final List<String> items;
  final String ctaPrimary;
  final String ctaSecondary;

  Navigation({
    required this.items,
    required this.ctaPrimary,
    required this.ctaSecondary,
  });

  factory Navigation.fromJson(Map<String, dynamic> json) => Navigation(
        items: List<String>.from(json['items']),
        ctaPrimary: json['cta_primary'],
        ctaSecondary: json['cta_secondary'],
      );

  Map<String, dynamic> toJson() => {
        "items": items,
        "cta_primary": ctaPrimary,
        "cta_secondary": ctaSecondary,
      };
}

class HeroSection {
  final String title;
  final String subtitle;
  final String primaryButton;
  final String secondaryButton;

  HeroSection({
    required this.title,
    required this.subtitle,
    required this.primaryButton,
    required this.secondaryButton,
  });

  factory HeroSection.fromJson(Map<String, dynamic> json) => HeroSection(
        title: json['title'],
        subtitle: json['subtitle'],
        primaryButton: json['primary_button'],
        secondaryButton: json['secondary_button'],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "primary_button": primaryButton,
        "secondary_button": secondaryButton,
      };
}

// ---- Services ----
class Services {
  final String title;
  final String subtitle;
  final List<ServiceItem> items;

  Services({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        title: json['title'],
        subtitle: json['subtitle'],
        items: List<ServiceItem>.from(
            json['items'].map((x) => ServiceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ServiceItem {
  final String title;
  final String description;
  final List<String> technologies;
  final String icon;

  ServiceItem({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
        title: json['title'],
        description: json['description'],
        technologies: List<String>.from(json['technologies']),
        icon: json['icon'],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "technologies": technologies,
        "icon": icon,
      };
}

// ---- Stats ----
class Stats {
  final List<StatItem> items;

  Stats({required this.items});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        items:
            List<StatItem>.from(json['items'].map((x) => StatItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {"items": List<dynamic>.from(items.map((x) => x.toJson()))};
}

class StatItem {
  final String number;
  final String label;

  StatItem({required this.number, required this.label});

  factory StatItem.fromJson(Map<String, dynamic> json) =>
      StatItem(number: json['number'], label: json['label']);

  Map<String, dynamic> toJson() => {"number": number, "label": label};
}

// ---- Testimonials ----
class Testimonials {
  final String title;
  final List<TestimonialItem> items;

  Testimonials({required this.title, required this.items});

  factory Testimonials.fromJson(Map<String, dynamic> json) => Testimonials(
        title: json['title'],
        items: List<TestimonialItem>.from(
            json['items'].map((x) => TestimonialItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class TestimonialItem {
  final String text;
  final String name;
  final String position;
  final int rating;

  TestimonialItem({
    required this.text,
    required this.name,
    required this.position,
    required this.rating,
  });

  factory TestimonialItem.fromJson(Map<String, dynamic> json) =>
      TestimonialItem(
        text: json['text'],
        name: json['name'],
        position: json['position'],
        rating: json['rating'],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "name": name,
        "position": position,
        "rating": rating,
      };
}

// ---- Team ----
class Team {
  final String title;
  final String subtitle;
  final List<TeamMember> members;

  Team({required this.title, required this.subtitle, required this.members});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        title: json['title'],
        subtitle: json['subtitle'],
        members: List<TeamMember>.from(
            json['members'].map((x) => TeamMember.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class TeamMember {
  final String name;
  final String role;
  final String experience;

  TeamMember({
    required this.name,
    required this.role,
    required this.experience,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        name: json['name'],
        role: json['role'],
        experience: json['experience'],
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "role": role, "experience": experience};
}

// ---- Pricing ----
class Pricing {
  final String title;
  final String subtitle;
  final List<PricingPackage> packages;

  Pricing({
    required this.title,
    required this.subtitle,
    required this.packages,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        title: json['title'],
        subtitle: json['subtitle'],
        packages: List<PricingPackage>.from(
            json['packages'].map((x) => PricingPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}

class PricingPackage {
  final String name;
  final String price;
  final List<String> features;
  final bool popular;

  PricingPackage({
    required this.name,
    required this.price,
    required this.features,
    required this.popular,
  });

  factory PricingPackage.fromJson(Map<String, dynamic> json) => PricingPackage(
        name: json['name'],
        price: json['price'],
        features: List<String>.from(json['features']),
        popular: json['popular'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "features": features,
        "popular": popular,
      };
}

// ---- Contact ----
class Contact {
  final String title;
  final String subtitle;
  final List<ContactInfo> info;
  final ContactForm form;

  Contact({
    required this.title,
    required this.subtitle,
    required this.info,
    required this.form,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        title: json['title'],
        subtitle: json['subtitle'],
        info: List<ContactInfo>.from(
            json['info'].map((x) => ContactInfo.fromJson(x))),
        form: ContactForm.fromJson(json['form']),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
        "form": form.toJson(),
      };
}

class ContactInfo {
  final String icon;
  final String title;
  final String value;

  ContactInfo({
    required this.icon,
    required this.title,
    required this.value,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        icon: json['icon'],
        title: json['title'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() =>
      {"icon": icon, "title": title, "value": value};
}

class ContactForm {
  final String title;
  final List<ContactFormField> fields;

  ContactForm({required this.title, required this.fields});

  factory ContactForm.fromJson(Map<String, dynamic> json) => ContactForm(
        title: json['title'],
        fields: List<ContactFormField>.from(
            json['fields'].map((x) => ContactFormField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
      };
}

class ContactFormField {
  final String label;
  final String icon;
  final String type;

  ContactFormField({
    required this.label,
    required this.icon,
    required this.type,
  });

  factory ContactFormField.fromJson(Map<String, dynamic> json) =>
      ContactFormField(
        label: json['label'],
        icon: json['icon'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {"label": label, "icon": icon, "type": type};
}

// ---- Footer ----
class Footer {
  final String description;
  final FooterLinks links;
  final List<SocialItem> social;
  final String copyright;
  final String madeWith;

  Footer({
    required this.description,
    required this.links,
    required this.social,
    required this.copyright,
    required this.madeWith,
  });

  factory Footer.fromJson(Map<String, dynamic> json) => Footer(
        description: json['description'],
        links: FooterLinks.fromJson(json['links']),
        social: List<SocialItem>.from(
            json['social'].map((x) => SocialItem.fromJson(x))),
        copyright: json['copyright'],
        madeWith: json['made_with'],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "links": links.toJson(),
        "social": List<dynamic>.from(social.map((x) => x.toJson())),
        "copyright": copyright,
        "made_with": madeWith,
      };
}

class FooterLinks {
  final List<String> services;
  final List<String> company;
  final List<String> support;

  FooterLinks({
    required this.services,
    required this.company,
    required this.support,
  });

  factory FooterLinks.fromJson(Map<String, dynamic> json) => FooterLinks(
        services: List<String>.from(json['services']),
        company: List<String>.from(json['company']),
        support: List<String>.from(json['support']),
      );

  Map<String, dynamic> toJson() => {
        "services": services,
        "company": company,
        "support": support,
      };
}

class SocialItem {
  final String icon;
  final String color;

  SocialItem({required this.icon, required this.color});

  factory SocialItem.fromJson(Map<String, dynamic> json) =>
      SocialItem(icon: json['icon'], color: json['color']);

  Map<String, dynamic> toJson() => {"icon": icon, "color": color};
}

// ---- Theme ----
class ThemeConfig {
  final ThemeColors colors;
  final ThemeGradients gradients;
  final ThemeLayout layout;

  ThemeConfig({
    required this.colors,
    required this.gradients,
    required this.layout,
  });

  factory ThemeConfig.fromJson(Map<String, dynamic> json) => ThemeConfig(
        colors: ThemeColors.fromJson(json['colors']),
        gradients: ThemeGradients.fromJson(json['gradients']),
        layout: ThemeLayout.fromJson(json['layout']),
      );

  Map<String, dynamic> toJson() => {
        "colors": colors.toJson(),
        "gradients": gradients.toJson(),
        "layout": layout.toJson(),
      };
}

class ThemeColors {
  final String primary;
  final String secondary;
  final String accent;
  final String background;
  final String surface;
  final String textPrimary;
  final String textSecondary;
  final String success;
  final String error;
  final String warning;

  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.error,
    required this.warning,
  });

  factory ThemeColors.fromJson(Map<String, dynamic> json) => ThemeColors(
        primary: json['primary'],
        secondary: json['secondary'],
        accent: json['accent'],
        background: json['background'],
        surface: json['surface'],
        textPrimary: json['text_primary'],
        textSecondary: json['text_secondary'],
        success: json['success'],
        error: json['error'],
        warning: json['warning'],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
        "accent": accent,
        "background": background,
        "surface": surface,
        "text_primary": textPrimary,
        "text_secondary": textSecondary,
        "success": success,
        "error": error,
        "warning": warning,
      };
}

class ThemeGradients {
  final List<String> hero;
  final List<String> stats;
  final List<String> footer;

  ThemeGradients({
    required this.hero,
    required this.stats,
    required this.footer,
  });

  factory ThemeGradients.fromJson(Map<String, dynamic> json) => ThemeGradients(
        hero: List<String>.from(json['hero']),
        stats: List<String>.from(json['stats']),
        footer: List<String>.from(json['footer']),
      );

  Map<String, dynamic> toJson() => {
        "hero": hero,
        "stats": stats,
        "footer": footer,
      };
}

class ThemeLayout {
  final int maxWidth;
  final int mobileBreakpoint;
  final int tabletBreakpoint;

  ThemeLayout({
    required this.maxWidth,
    required this.mobileBreakpoint,
    required this.tabletBreakpoint,
  });

  factory ThemeLayout.fromJson(Map<String, dynamic> json) => ThemeLayout(
        maxWidth: json['max_width'],
        mobileBreakpoint: json['mobile_breakpoint'],
        tabletBreakpoint: json['tablet_breakpoint'],
      );

  Map<String, dynamic> toJson() => {
        "max_width": maxWidth,
        "mobile_breakpoint": mobileBreakpoint,
        "tablet_breakpoint": tabletBreakpoint,
      };
}
