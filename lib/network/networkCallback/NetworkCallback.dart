import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tamyez/network/client/ApiClient.dart';
import 'package:tamyez/utils/Enums.dart';



class NetworkCall {
  static Future<Map<String, dynamic>> makeCall(
      {String endPoint,
      HttpMethod method,
      dynamic requestBody,
      Map<String, dynamic> queryParams,
      bool isMultipart = false,
      List<MultipartFile> multiPartValues}) async {
    try {
      Response response;
      if (method == HttpMethod.GET) {
        response = (await ApiClient.getRequest(endPoint, queryParams));
      } else if (method == HttpMethod.POST) {
        response = (await ApiClient.postRequest(endPoint, requestBody,
            isMultipart: isMultipart, multiPartValues: multiPartValues));
      } else if (method == HttpMethod.PUT) {
        response = (await ApiClient.putRequest(endPoint, requestBody,
            isMultipart: isMultipart, multiPartValues: multiPartValues));
      } else if (method == HttpMethod.DELETE) {
        response = (await ApiClient.deleteRequest(endPoint, queryParams));
      }

      ////      if (response.statusCode >= NetworkStatusCodes.OK_200.value&&response.statusCode<= NetworkStatusCodes.OK_299.value) {
      // if (response.statusCode == NetworkStatusCodes.OK_200.value) {
      if (response.statusCode >= NetworkStatusCodes.OK_200.value &&
          response.statusCode <= NetworkStatusCodes.OK_299.value) {
        //Api logger
        log("Api Response: ${response.body}");
        return jsonDecode(response.body);
      } else if (response.statusCode ==
              NetworkStatusCodes.ServerInternalError.value ||
          response.statusCode == NetworkStatusCodes.BadRequest.value) {
        //Api logger
        log("API Error: ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        //log("API Error:${response.body}");
        var result = jsonDecode(response.body) as Map<String, dynamic>;
        log('$result');
        return result;
      } else if (response.statusCode ==
          NetworkStatusCodes.UnAuthorizedUser.value) {
        var result = jsonDecode(response.body) as Map<String, dynamic>;

        result['status'] = response.statusCode;

        //Api logger
        log("API Error: ${response.statusCode} / ${response.reasonPhrase} - $result");
        return result;
      } else {
        //Api logger
        log("API Error: ${response.statusCode} /-/ ${response.reasonPhrase} - ${response.body}");
        /*return {
          "success": false,
          "error": {
            "code": response.statusCode,
            "message": response.reasonPhrase,
            "details": ""
          }
        };*/
        var result = jsonDecode(response.body) as Map<String, dynamic>;
        return result;
        //return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return {
        "success": false,
        "error": {
          "code": 0,
          "message":
              "No internet connection, please check you network and try again",
          "details": ""
        }
      };
    }
  }
}