// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:ostadjee/changes/shared/models/all_price_model.dart';

class AllPriceService {
  String fullUrl = "https://ostadjee.com/api/v1/all-price";

  Future<AllPriceModel?> fetchAllPrice() async {
    try {
      final response = await http.get(Uri.parse(fullUrl));
      if (response.statusCode == 200) {
        return allPriceModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
