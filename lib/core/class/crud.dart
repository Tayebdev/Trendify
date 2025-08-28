import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:trendify_app/core/functions/app_check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postDataRequest(
    String url,
    Map<String, dynamic> data,
  ) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } else {
      return Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getDataRequest(
    String url,
  ) async {
    if (await checkInternet()) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(jsonDecode(response.body));
        }
        if (response.statusCode == 404) {
          return Left(StatusRequest.failure);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } on SocketException {
        return Left(StatusRequest.serverfailure);
      } catch (e) {
        return Left(StatusRequest.serverException);
      }
    } else {
      return Left(StatusRequest.offlinefailure);
    }
  }
}
