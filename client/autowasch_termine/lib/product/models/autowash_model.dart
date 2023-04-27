class Autowash {
  int? id;
  int photoId;
  String name;
  String phone;
  String address;
  String availableTimes;
  String price;

  Autowash({
    required this.photoId,
    required this.name,
    required this.phone,
    required this.address,
    required this.availableTimes,
    required this.price,
    this.id,
  });

  String getPhoto() {
    return "assets/images/logo_car_wash_$photoId.jpg";
  }
}
