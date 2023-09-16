class CategoriesResponse {
  List<Dummy>? dummy;
  String? error;

  CategoriesResponse({
    this.dummy,
    this.error
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    dummy: List<Dummy>.from(json["dummy"].map((x) => Dummy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dummy": List<dynamic>.from(dummy!.map((x) => x.toJson())),
  };

  CategoriesResponse.withError(String errorValue)
      : dummy = null,
        error = errorValue;
}

class Dummy {
  int? id;
  String? image;
  String? name;
  String? mount;
  String? rating;

  Dummy({
    this.id,
    this.image,
    this.name,
    this.mount,
    this.rating,
  });

  factory Dummy.fromJson(Map<String, dynamic> json) => Dummy(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    mount: json["mount"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "mount": mount,
    "rating": rating,
  };
}
