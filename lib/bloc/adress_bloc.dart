import 'package:rxdart/rxdart.dart';

import '../models/address.dart';
import '../services/cepaberto_service.dart';

class AdressBloc {

  final _estado = BehaviorSubject<String>();
  get estado => _estado.stream;
  
  final _cidade = BehaviorSubject<String>();
  get cidade => _cidade.stream;

  final _address = BehaviorSubject<Address>();
  get address => _address.stream;





 // String  endereco(){
 //    address.add(
 //        Address(
 //            street: cepAbertoAddress.logradouro,
 //            district: cepAbertoAddress.bairro,
 //            zipCode: cepAbertoAddress.cep,
 //            city: _cidade.value,
 //            state: _estado.value,
 //            lat: cepAbertoAddress.latitude,
 //            long: cepAbertoAddress.longitude)
 //    );
 //
 //    return _cidade.value + " " + _estado.value.toUpperCase();
 //  }
  
  Future<void> getAddress(String cep) async {
    //Isso vai sair daqui
    var cepAbertoService = CepAbertoService();
   // print(cep);
    try {
      //colocar isso aqui
      //cep = cep.trim().replaceAll('.', '').replaceAll('-', '');
      //isso vai ser trocado para
      var cepAbertoAddress = await cepAbertoService.getAddressFromCep(cep);
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
      print('erro aqui @!!!!!!');
     // debugPrint(e.toString());
    }
  }

  dispose(){
    _estado.close();
    _cidade.close();
  }

}