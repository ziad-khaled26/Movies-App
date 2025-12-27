class CastMember{
  final String? name;
  final String? characterName;
  final String? urlSmallImage;
  final String? imdbCode;

  const CastMember({
    required this.name,
    required this.characterName,
    required this.urlSmallImage,
    required this.imdbCode
});

  factory CastMember.fromJson(Map<String,dynamic> json){
    return CastMember(

        name: json["name"] ,
        characterName: json["character_name"],
        urlSmallImage: json["url_small_image"],
        imdbCode: json["imdb_code"]);
  }
}