import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:teste/bloc/adress_bloc.dart';

import 'package:teste/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/address.dart';
import 'package:top_components/widgets/buttons/primary_button.dart';


class AddressInputField extends StatefulWidget {

  final Address address;
  AdressBloc _adressBloc;
  final TextEditingController _controller = TextEditingController();

  AddressInputField(this.address, this._adressBloc);

  @override
  _AddressInputFieldState createState() => _AddressInputFieldState();
}

class _AddressInputFieldState extends State<AddressInputField> {

  final TextEditingController _controllerStreet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final cartManager = context.watch<CartManager>();

    String emptyValidator(String text) => text.isEmpty ? 'Campo obrigatório' : null;
    /* if (address.zipCode != null) */


    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

    StreamBuilder<String>(
    stream: widget._adressBloc.estado,
        builder: (context, snapshot) {
          widget._controller.text = snapshot.hasData ? snapshot.data : '';

          return TextFormField(
            enabled: false,
            controller: widget._controller,
            decoration: const InputDecoration(
              isDense: true,
              labelText: 'Estado',
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              //hintText: 'Campinas',
            ),
            validator: emptyValidator,
            onSaved: (t) => widget.address.state = t,
          );
        }
    ),
    StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return TextFormField(
          enabled: false,
          initialValue: widget.address.city,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Cidade',
            labelStyle: TextStyle(color: Colors.black),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            //hintText: 'Campinas',
          ),
          validator: emptyValidator,
          onSaved: (t) => widget.address.city = t,
        );
      }
    )
    ,
    TextFormField(
    initialValue: widget.address.district,
    decoration: const InputDecoration(
    isDense: true,
    labelText: 'Bairro',
    labelStyle: TextStyle(color: Colors.black),
    border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    ),
    // hintText: 'Guanabara',
    ),
    validator: emptyValidator,
    onSaved: (t) => widget.address.district = t,
    ),
    TextFormField(
    controller: _controllerStreet,
    initialValue: widget.address.street,
    decoration: const InputDecoration(
    isDense: true,
    labelText: 'Endereço',
    labelStyle: TextStyle(color: Colors.black),
    border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    ),
    //hintText: 'Av. Brasil',
    ),
    validator: emptyValidator,
    onSaved: (t) => widget.address.street = t,
    ),
    TextFormField(
    initialValue: widget.address.number,
    decoration: const InputDecoration(
    isDense: true,
    labelText: 'Número',
    hintText: 'Digite o número da sua residência',
    labelStyle: TextStyle(color: Colors.black),
    border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    ),
    ),
    inputFormatters: [
    WhitelistingTextInputFormatter.digitsOnly,
    ],
    keyboardType: TextInputType.number,
    validator: emptyValidator,
    onSaved: (t) => widget.address.number = t,
    ),
    TextFormField(
    initialValue: widget.address.complement,
    decoration: const InputDecoration(
    isDense: true,
    labelText: 'Complemento (opcional)',
    hintText: 'Ex: Bloco e Apartamento',
    labelStyle: TextStyle(color: Colors.black),
    border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    ),
    ),
    onSaved: (t) => widget.address.complement = t,
    ),
    SizedBox(
    height: 24,
    ),
    PrimaryButton(
    background: Colors.orange,
    text: 'Salvar',
    action: () {
    if (Form.of(context).validate()) {
    Form.of(context).save();
    }
    })
    ,
    ]
    ,
    );
    /* else
      return Container(); */
  }
}


