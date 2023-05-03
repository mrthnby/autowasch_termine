class Autowash {
  int id;
  int photoId;
  String name;
  String openingHours;
  String price;
  String phoneNumber;
  String address;
  String password;
  DateTime createDate;

  Autowash({
    required this.id,
    required this.photoId,
    required this.name,
    required this.address,
    required this.price,
    required this.createDate,
    required this.phoneNumber,
    required this.openingHours,
    required this.password
  });

  String getPhoto() {
    return "assets/images/logo_car_wash_$photoId.jpg";
  }
}
