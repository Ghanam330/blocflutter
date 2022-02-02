/// char_id : 1
/// name : "Walter White"
/// birthday : "09-07-1958"
/// occupation : ["High School Chemistry Teacher","Meth King Pin"]
/// img : "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
/// status : "Presumed dead"
/// nickname : "Heisenberg"
/// appearance : [1,2,3,4,5]
/// portrayed : "Bryan Cranston"
/// category : "Breaking Bad"
/// better_call_saul_appearance : []

class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String acotrName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    appearanceOfSeasons = json["appearance"];
    acotrName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}