enum Company {
  metiskaFarma('01', 'Metiska Farma'),
  teguhsindoLestaritama('02', 'Teguhsindo Lestaritama');

  const Company(this.id, this.name);

  factory Company.fromId(String id) {
    if (id == Company.metiskaFarma.id) {
      return Company.metiskaFarma;
    } else if (id == Company.teguhsindoLestaritama.id) {
      return Company.metiskaFarma;
    }
    throw ArgumentError();
  }

  final String id;
  final String name;
}
