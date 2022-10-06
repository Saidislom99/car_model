import 'dart:convert';
import 'package:car_model/api/model/cars_mod.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as h;


class ApiProvider{
  ///GET ALL COMPANIES
  Future<List<Cars>> getCompaniesList() async {
    try {
      Response response =
      await h.get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));
      if (response.statusCode == 200) {
        List<Cars> companies = (jsonDecode(response.body)['data'] as List?)
            ?.map((e) => Cars.fromJson(e))
            .toList() ??
            [];
        return companies;
      } else {
        throw Exception();
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error);
    }
  }

  /// GET SINGLE COMPANY
  Future<Cars> getSingleCompany({required int companyId}) async {
    try {
      Response response = await h
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/$companyId"));
      if (response.statusCode == 200) {
        return Cars.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}