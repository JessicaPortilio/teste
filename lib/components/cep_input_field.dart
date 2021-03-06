import 'package:brasil_fields/formatter/cep_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teste/bloc/adress_bloc.dart';
import 'package:teste/models/cart_manager.dart';
import 'package:teste/models/address.dart';

class CepInputField extends StatelessWidget {
  AdressBloc _adressBloc;
  final TextEditingController cepController = TextEditingController();
  final primaryColor = Colors.orange;

  CepInputField(this._adressBloc);

  @override
  Widget build(BuildContext context) {
    if (true)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: cepController,
            cursorColor: primaryColor,

            decoration: const InputDecoration(
              isDense: true,
              labelText: 'CEP',
              hintText: '12.345-678',
            ),
            //impede de ser colocado qualquer caracter que não seja número
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            keyboardType: TextInputType.number,
            validator: (cep) {
              if (cep.isEmpty)
                return 'Campo obrigatório';
              else if (cep.length != 10) return 'CEP Inválido';
              return null;
            },
            onFieldSubmitted: (cepController) async {

              WidgetsBinding.instance.addPostFrameCallback((_){

                 _adressBloc.getAddress(cepController);


              });

              //context.read<CartManager>().getAddress(cepController);
              //Navigator.of(context).pop();
            },
          ),
        ],
      );
    // else
    //   return GestureDetector(
    //     onTap: () {
    //       context.read<CartManager>().removeAddress();
    //     },
    //     child: TextFormField(
    //       enabled: false,
    //       initialValue: address.zipCode,
    //       decoration: const InputDecoration(
    //         isDense: true,
    //         labelText: 'CEP',
    //         labelStyle: TextStyle(color: Colors.black),
    //         border: UnderlineInputBorder(
    //           borderSide: BorderSide(color: Colors.orange),
    //         ),
    //       ),
    //     ),
    //   );
  }
}
