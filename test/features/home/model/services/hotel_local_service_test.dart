import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/home/model/models/hotel_response_model.dart';
import 'package:hotelifoz/features/home/model/services/hotel_local_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotel_local_service_test.mocks.dart';

@GenerateMocks([HotelLocalServiceImpl])
void main() {
  group('hotel local service ...', () {
    final HotelLocalServiceImpl hotelLocalServiceImpl =
        MockHotelLocalServiceImpl();

    final List<HotelResponseModel> hotelResponseAPI = [
      HotelResponseModel(
        id: "1",
        name: "Contoh Hotel",
        displayName: "Contoh Hotel",
        region: "Jakarta",
        starRating: "4.5",
        userRating: "9.0",
        numReviews: "100",
        userRatingInfo: "Bagus",
        latitude: "-6.2088",
        longitude: "106.8456",
        lowRate: "500000",
        showedFacilityTypes: ["Restaurant", "Swimming Pool"],
        hotelFeatures: [
          HotelFeatures(
            text: "WiFi Gratis",
            backgroundColor: "#00bcd4",
            textColor: "#ffffff",
            icon: "wifi",
            type: "Amenities",
          ),
          HotelFeatures(
            text: "Parkir Gratis",
            backgroundColor: "#8bc34a",
            textColor: "#ffffff",
            icon: "local_parking",
            type: "Amenities",
          ),
        ],
        imageUrl: "https://picsum.photos/200/300",
        imageUrls: [
          "https://picsum.photos/200/300",
          "https://picsum.photos/300/200"
        ],
        hotelSeoUrl: "/contoh-hotel-jakarta",
      ),
    ];

    test('get all hotel response api success', () {
      when(hotelLocalServiceImpl.getHotels())
          .thenAnswer((realInvocation) async => hotelResponseAPI);
    });
  });
}
