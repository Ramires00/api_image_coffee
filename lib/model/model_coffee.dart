class Model {
  final String coffeeImg;

  Model({required this.coffeeImg});

  factory Model.fromJson(Map<String, dynamic> json) {
    String coffeeImg = json['file'];
    return Model(coffeeImg: coffeeImg);
  }
}
