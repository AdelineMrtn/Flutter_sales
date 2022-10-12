class Product{
  int id;
  String nom;
  String description;
  num prix;
  String categorie;
  String image;

  Product(this.id, this.nom,  this.prix, this.description, this.categorie, this.image);

  Product.fromJson(Map<String,dynamic> map)
      : id = map["id"],
        nom = map["title"],
        prix = map["price"],
        description = map["description"],
        categorie = map["category"],
        image = map["image"];
}
