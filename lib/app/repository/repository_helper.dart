import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';

class RepositoryHelper {
  Future<ResponseObject> apiCall(
      {required String url,
      String method = "GET",
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<http.MultipartFile>? files}) async {
    Utils.loadingDialog();

    Uri uri = Uri.parse(Constants.baseUrl + url);

    try {
      final request = http.MultipartRequest(method, uri);
      request.headers['Accept'] = 'application/json';
      request.headers['Connection'] = 'keep-alive';

      if (Storage.getValue(Constants.token) != null) {
        request.headers['Authorization'] =
            "Bearer ${Storage.getValue(Constants.token)}";
      }

      request.headers['customer_id'] = "kxmxo61gcqftyescd39";

      if (headers != null) {
        request.headers.addAll(headers);
      }

      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      final _response =
          await request.send().timeout(const Duration(seconds: 30));
      final responseData =
          await _response.stream.transform(utf8.decoder).join();

      // log(_response.statusCode.toString());
      // log(responseData);

      final decodedJson = json.decode(responseData);

      Utils.closeDialog();

      if (_response.statusCode == 200 ||
          _response.statusCode == 201 ||
          _response.statusCode == 403) {
        if (decodedJson['status'].toString().toLowerCase() == 'error' ||
            decodedJson['status'].toString().toLowerCase() == 'inactive') {
          return ResponseObject(
            id: ResponseCode.FAILED,
            object: decodedJson.toString().contains('message')
                ? decodedJson['message']
                : 'Something went wrong!!!',
          );
        } else {
          return ResponseObject(
            id: ResponseCode.SUCCESSFUL,
            object: responseData,
          );
        }
      } else if (_response.statusCode == 401) {
        Storage.clearStorage();

        return ResponseObject(
            id: ResponseCode.AUTHORIZATION_FAILED,
            object: 'Please login again');
      } else if (decodedJson.toString().contains('errors')) {
        return ResponseObject(
            id: ResponseCode.FAILED, object: decodedJson['errors']);
      } else if (decodedJson.toString().contains('message')) {
        return ResponseObject(
            id: ResponseCode.FAILED, object: decodedJson['message']);
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            object: 'Status code for request ${_response.statusCode}');
      }
    } catch (e) {
      Utils.closeDialog();

      // log(e.toString());
      // log(uri.toString());
      // log(Storage.getValue(Constants.token));

      return ResponseObject(
        id: ResponseCode.FAILED,
        object: "",
      );
    }
  }
}
