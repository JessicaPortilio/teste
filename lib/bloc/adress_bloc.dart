import 'package:rxdart/rxdart.dart';

import '../models/address.dart';
import '../services/cepaberto_service.dart';

class AdressBloc {

  final _estado = BehaviorSubject<String>();
  get estado => _estado.stream;
  
  final _cidade = BehaviorSubject<String>();
  get cidade => _cidade.stream;
  
  Future<void> getAddress(String cep) async {
    //Isso vai sair daqui
    final cepAbertoService = CepAbertoService();
   // print(cep);
    try {
      //colocar isso aqui
      //cep = cep.trim().replaceAll('.', '').replaceAll('-', '');
      //isso vai ser trocado para
      final cepAbertoAddress = await cepAbertoService.getAddressFromCep(cep);
      //address = await Utils.getAddressByCep(cep);

      //no lugar do cepAbertoAddress vai ser address
      if (cepAbertoAddress != null) {
        //isso tudo vai sair daqui

        estado.add(cepAbertoAddress.estado.sigla);

        Address  address = Address(
            street: cepAbertoAddress.logradouro,
            district: cepAbertoAddress.bairro,
            zipCode: cepAbertoAddress.cep,
            city: cepAbertoAddress.cidade.nome,
            state: cepAbertoAddress.estado.sigla,
            lat: cepAbertoAddress.latitude,
            long: cepAbertoAddress.longitude);
       // notifyListeners();
      }
    } catch (e) {
     // debugPrint(e.toString());
    }
  }

  dispose(){
    _estado.close();
  }

}