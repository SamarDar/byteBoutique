import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:focalx_task6/core/classes/status_requests.dart';
import 'package:http/http.dart' as http;
import 'check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postDate(String linkUrl,
      Map<String, dynamic> data, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        final response = await http.post(Uri.parse(linkUrl),
            body: jsonEncode(data), headers: headers);
        print("Response Status Code: ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          print("Error Response: ${response.body}");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getData(
      String linkUrl, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        final response = await http.get(Uri.parse(linkUrl), headers: headers);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> putData(String linkUrl,
      Map<String, dynamic> data, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        final response = await http.put(
          Uri.parse(linkUrl),
          body: jsonEncode(data),
          headers: headers,
        );
        print("Response Status Code: ${response.statusCode}");
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          print("Error Response: ${response.body}");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> deleteData(
      String linkUrl, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        final response = await http.delete(
          Uri.parse(linkUrl),
          headers: headers,
        );
        print("Response Status Code: ${response.statusCode}");
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          print("Error Response: ${response.body}");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }
}
