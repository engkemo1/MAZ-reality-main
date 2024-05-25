
class BuildItem {
  String image;
  String name;
  String title;
  String price;
  String address;
  String description;
  String area;
  String type;
  int id;
  BuildItem({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    required this.address,
    required this.description,
    required this.area,
    required this.type,
    required this.id,
  });


}


  final List<BuildItem> category = [
    BuildItem(
        image: "assets/imgs/buildItem1",
        name: "Sakana",
        title: "villa",
        price: "200\$",
        address: "El- marrag City",
        description: "this my Villa i want to sell it",
        area: "maadi",
        type: "viila",
        id: 0),
    BuildItem(
        image: "assets/imgs/buildItem2",
        name: "Salieh",
        title: "villa",
        price: "500\$",
        address: "helwan City",
        description: "this my Villa i want to sell it",
        area: "maadi",
        type: "viila",
        id: 1),
    BuildItem(
        image: "assets/imgs/buildItem1",
        name: "home",
        title: "villa",
        price: "600\$",
        address: "sayeda City",
        description: "this my Villa i want to sell it",
        area: "maadi",
        type: "viila",
        id: 2),
    BuildItem(
        image: "assets/imgs/buildItem2",
        name: "Sakana",
        title: "villa",
        price: "700\$",
        address: "Dar City",
        description: "this my Villa i want to sell it",
        area: "maadi",
        type: "viila",
        id: 3),
  
    
  ];