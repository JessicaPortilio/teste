import 'package:rxdart/rxdart.dart';

import '../models/address.dart';
import '../services/cepaberto_service.dart';

class AdressBloc {
  final _estado = BehaviorSubject<String>();
  get estado => _estado.stream;

  final _cidade = BehaviorSubject<String>();
  get cidade => _cidade.stream;

  final _bairro = BehaviorSubject<String>();
  get bairro => _bairro.stream;

  final _endereco = BehaviorSubject<String>();
  get endereco => _endereco.stream;

  final _numero = BehaviorSubject<String>();
  get numero => _numero.stream;

  final _complemento = BehaviorSubject<String>();
  get complemento => _complemento.stream;
  final _cepp = BehaviorSubject<String>();
  get cepp => _cepp.stream;

  final _address = BehaviorSubject<Address>();
  get address => _address.stream;

  String ender() {
    address.add(
      Address(
        street: _endereco.value,
        district: _bairro.value,
        zipCode: _cepp.value,
        city: _cidade.value,
        state: _estado.value,
      ),
    );

    return _cidade.value + " " + _estado.value.toUpperCase();
  }

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
        cidade.add(cepAbertoAddress.cidade.nome);
        bairro.add(cepAbertoAddress.bairro);
        endereco.add(cepAbertoAddress.logradouro);

        Address address = Address(
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

  dispose() {
    _estado.close();
    _cidade.close();
    _bairro.close();
    _endereco.close();
    _numero.close();
    _complemento.close();
  }
}
