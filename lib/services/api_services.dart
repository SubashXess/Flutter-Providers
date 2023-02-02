import 'dart:convert';
import 'package:flutter_provider_state_management/constants/apis.dart';
import 'package:flutter_provider_state_management/models/posts_models.dart';
import 'package:flutter_provider_state_management/models/products_models.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiSevices {
  ApiSevices._instantiate();
  static final ApiSevices service = ApiSevices._instantiate();

  Future<List<PostsModel>> getPosts() async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.POSTS_API1);

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => PostsModel.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel1>> getProducts1() async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.PRODUCT_API2);

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => ProductModel1.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
