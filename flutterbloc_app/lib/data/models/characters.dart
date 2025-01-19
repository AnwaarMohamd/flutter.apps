class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCasllSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickName"];
    image = json["image"];
    jobs = json["jobs"];
    statusIfDeadOrAlive = json["statusIfDeadOrAlive"];
    actorName = json["actorName"];
    categoryForTwoSeries = json["categoryForTwoSeries"];
    betterCasllSaulAppearance = json["betterCasllSaulAppearance"];
  }
}
