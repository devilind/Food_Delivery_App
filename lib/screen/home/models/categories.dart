class Categories {
  final String name;
  final String description;
  final int pricePerPlate;
  final String imageUrl;

  Categories(
      {required this.name,
      required this.description,
      required this.pricePerPlate,
      required this.imageUrl});
}

String loremIpsum =
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.";

var categories = [
  Categories(
      name: "Chole Puri",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/cholepuri.jpg"),
  Categories(
      name: "Dal Rice",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/dalrice.jpg"),
  Categories(
      name: "Paratha",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/paratha.jpg"),
  Categories(
      name: "Chole Puri",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/cholepuri.jpg"),
  Categories(
      name: "Dal Rice",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/dalrice.jpg"),
  Categories(
      name: "Paratha",
      description: loremIpsum,
      pricePerPlate: 100,
      imageUrl: "assets/categories/paratha.jpg"),
];
