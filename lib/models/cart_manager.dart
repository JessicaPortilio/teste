import 'package:flutter/material.dart';
import 'package:teste/services/cepaberto_service.dart';
import 'package:teste/models/address.dart';

class CartManager extends ChangeNotifier {
  //isso vai mudar para
  Address address;
  //AddressModel address;
  Future<void> getAddress(String cep) async {
    //Isso vai sair daqui
    final cepAbertoService = CepAbertoService();
    print(cep);
    try {
      //colocar isso aqui
      //cep = cep.trim().replaceAll('.', '').replaceAll('-', '');
      //isso vai ser trocado para
      final cepAbertoAddress = await cepAbertoService.getAddressFromCep(cep);
      //address = await Utils.getAddressByCep(cep);

      //no lugar do cepAbertoAddress vai ser address
      if (cepAbertoAddress != null) {
        //isso tudo vai sair daqui
        address = Address(
            street: cepAbertoAddress.logradouro,
            district: cepAbertoAddress.bairro,
            zipCode: cepAbertoAddress.cep,
            city: cepAbertoAddress.cidade.nome,
            state: cepAbertoAddress.estado.sigla,
            lat: cepAbertoAddress.latitude,
            long: cepAbertoAddress.longitude);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeAddress() {
    address = null;
    notifyListeners();
  }
}
