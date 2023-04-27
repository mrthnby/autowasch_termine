import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/product/models/autowash_model.dart';
import 'package:autowasch_termine/product/models/booking_model.dart';

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
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    List<Autowash> autowashList = [];
    autowashList.addAll([
      Autowash(
        photoId: 0,
        name: "Kaya Autowash",
        phone: "0555 555 55 55",
        address: "Kavacık Beykoz/İstanbul",
        availableTimes: "09.00 - 18.00",
        price: "150",
      ),
      Autowash(
        photoId: 0,
        name: "Shen Autowash",
        phone: "0555 555 55 55",
        address: "Çağlayan Kağıthane/İstanbul",
        availableTimes: "07.00 - 20.00",
        price: "120",
      ),
      Autowash(
        photoId: 0,
        name: "Han Autowash",
        phone: "0555 555 55 55",
        address: "Levent Beşiktaş/İstanbul",
        availableTimes: "06.00 - 17.00",
        price: "250",
      ),
      Autowash(
        photoId: 0,
        name: "Imamson Autowash",
        phone: "0555 555 55 55",
        address: "Ataket Küçükçekmece/İstanbul",
        availableTimes: "10.00 - 23.00",
        price: "200",
      ),
    ]);

    return autowashList;
  }
}
