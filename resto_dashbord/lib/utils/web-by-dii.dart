import 'dart:io';
import 'package:http/http.dart' as http;

const base_url = 'https://541abcc0358c.ngrok.io/big-faim/api/';

class UtilsHttp {
  static postByIssa(body, endpoint) {
    String url = base_url + endpoint;
    return http
        .post(
          url,
          body: body,
        )
        .then((success) => success);
  }

  static updateByIssa(body, endpoint) {
    String url = base_url + endpoint;
    url = url + '/update';
    return http
        .post(
          url,
          body: body,
        )
        .then((success) => success);
  }

  static getByIssa(endpoint) {
    String url = base_url + endpoint;
    return http
        .get(
          url,
        )
        .then((success) => success);
  }

  static getTraitementByIssa(endpoint) {
    String url = base_url + endpoint;
    return http
        .get(
          url + '/traitement',
        )
        .then((success) => success);
  }
}
