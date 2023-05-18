import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:autowasch_termine/view/user/model/booking_model.dart';

class FakeUserService extends IUserService {
  @override
  Future<void> addBooking(Booking booking) {
    // TODO: implement addBooking
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBooking(String plate) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future<List<Autowash>?> fetchAutowashList() async {
    // Server delay simulation for loading state checking
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    List<Autowash> autowashList = [];
    autowashList.addAll(
      [
        Autowash(
          photoId: 4,
          name: "Kaya Autowash",
          phoneNumber: "0555 555 55 55",
          address: "Kavacık Beykoz/İstanbul",
          openingHours: "09.00 - 18.00",
          price: "150",
          //createDate: DateTime.parse("2023-05-02T22:14:39.769+00:00"),
          id: "12131",
          password: "pass",
          email:"s",
          

        ),
        Autowash(
          photoId: 1,
          name: "Shen Autowash",
          phoneNumber: "0555 555 55 55",
          address: "Çağlayan Kağıthane/İstanbul",
          openingHours: "07.00 - 20.00",
          price: "120",
          // createDate: DateTime.parse("2023-05-02T22:14:39.769+00:00"),
          id: "1213221",
          password: "pass",
          email:"s",
        ),
        Autowash(
          photoId: 2,
          name: "Han Autowash",
          phoneNumber: "0555 555 55 55",
          address: "Levent Beşiktaş/İstanbul",
          openingHours: "06.00 - 17.00",
          price: "250",
         //  createDate: DateTime.parse("2023-05-02T22:14:39.769+00:00"),
          id: "121131",
          password: "pass",
          email:"s",
        ),
        Autowash(
          photoId: 3,
          name: "Imamson Autowash",
          phoneNumber: "0555 555 55 55",
          address: "Ataket Küçükçekmece/İstanbul",
          openingHours: "10.00 - 23.00",
          price: "200",
          // createDate: DateTime.parse("2023-05-02T22:14:39.769+00:00"),
          id: "1213121",
          password: "pass",
          email:"s",
        ),
      ],
    );

    return autowashList;
  }
}
