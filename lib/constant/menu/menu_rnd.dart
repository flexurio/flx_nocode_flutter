part of 'menu.dart';

final menuRnd = Menu1(
  label: 'research_and_development',
  menu: [
    Menu2(
      label: 'RND',
      icon: FontAwesomeIcons.flask,
      menu: [
        ...menu3MaterialDesigns,
        ...menu3BillOfMaterials,
      ],
    ),
  ],
);
