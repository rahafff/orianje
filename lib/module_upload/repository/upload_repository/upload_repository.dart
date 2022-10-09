import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:oringe/consts/urls.dart';
import 'package:oringe/module_upload/response/imgbb/imgbb_response.dart';
import 'package:oringe/utils/logger/logger.dart';

@injectable
class UploadRepository {
  Future<ImgBBResponse?> upload(String filePath) async {
    var client = Dio();
    MultipartFile? multi;
    if (kIsWeb) {
      var file = await File(filePath).readAsBytes();
      multi = MultipartFile.fromBytes(file,
          filename: DateTime.now().toIso8601String() + '-image');
    }
    FormData data = FormData.fromMap({
      'formFile': kIsWeb ? multi : await MultipartFile.fromFile(filePath),
    });

    Logger().info('UploadRepo', 'Uploading: ' + filePath);
    Logger().info('URL', 'Uploading: ' +  Urls.UPLOAD_FILE);
    try {
      Response? response = await client.post(
        Urls.UPLOAD_FILE,
        data: data,
      );
      Logger().info('Got a Response', response.toString());
      return ImgBBResponse.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
