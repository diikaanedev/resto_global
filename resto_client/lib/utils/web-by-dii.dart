import 'dart:io';

import 'package:http/http.dart' as http;

const base_url = 'https://541abcc0358c.ngrok.io/big-faim/api/';

class UtilsHttp {
  static postByIssa(body, endPoint) {
    var url = base_url + endPoint;
    return http
        .post(
          url,
          body: body,
        )
        .then((success) => success);
  }

  static getByIssa(endPoint) {
    var url = base_url + endPoint;
    return http
        .get(
          url,
        )
        .then((success) => success);
  }
}
