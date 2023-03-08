import 'dart:convert';

import 'package:flutterdemo/model/home_model.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";

const homeUrl = 'http://www.devio.org/io/flutter_app/json/home_page.json';
const host = "www.devio.org";
const url = "io/flutter_app/json/home_page.json";

class HomeDao extends GetConnect {
  static Future<HomeModel> fetch() async {
    Uri uri = Uri.http(host, url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var retuslt = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(retuslt);
    } else {
      throw Exception(" error ");
    }
  }

  //  @override
  // void onInit() {
  //   // All request will pass to jsonEncode so CasesModel.fromJson()
  //   httpClient.defaultDecoder = HomeModel.fromJson();
  //   httpClient.baseUrl = 'https://api.covid19api.com';
  //   // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
  //   // Http and websockets if used with no [httpClient] instance

  //   // It's will attach 'apikey' property on header from all requests
  //   httpClient.addRequestModifier((request) {
  //     request.headers['apikey'] = '12345678';
  //     return request;
  //   });

    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    // httpClient.addResponseModifier<CasesModel>((request, response) {
    //   CasesModel model = response.body;
    //   if (model.countries.contains('Brazil')) {
    //     model.countries.remove('Brazilll');
    //   }
    // });

    // httpClient.addAuthenticator((request) async {
    //   final response = await get("http://yourapi/token");
    //   final token = response.body['token'];
    //   // Set the header
    //   request.headers['Authorization'] = "$token";
    //   return request;
    // });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    // httpClient.maxAuthRetries = 3;
  // }

  // @override
  // Future<Response<CasesModel>> getCases(String path) => get(path);

  // Future<HomeModel> fetchNew() async {
  //   final response = await get<String>(url);
  //   if (response.statusCode == 200) {
  //     final body = response.bodyBytes;
  //     body.value();
  //     Utf8Decoder utf8decoder = const Utf8Decoder();
  //     var result = json.decode(utf8decoder.convert(body!));

  //     // return HomeModel.fromJson(result);
  //   }
  //   throw Exception("error");
  // }
}
