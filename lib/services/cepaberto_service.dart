import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teste/models/cepaberto_address.dart';

const token = '6c4bbd9503820f2c4454da4edcbd9213';

class CepAbertoService {
  Future<CepAbertoAddress> getAddressFromCep(String cep) async {
    //cep limpo
    final cleanCep = cep.replaceAll('.', '').replaceAll('-', '');
    print(cleanCep);
    final endpoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleanCep";

    final Dio dio = Dio();

    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try {
      final response = await dio.get<Map<String, dynamic>>(endpoint);

      if (response.data.isEmpty) {
        return Future.error('CEP Inválido');
      }

      final CepAbertoAddress address = CepAbertoAddress.fromMap(response.data);

      return address;
    } on DioError catch (e) {
      return Future.error('Erro ao buscar CEP');
    }
  }
}
