import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:teste/bloc/adress_bloc.dart';

import 'package:teste/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/address.dart';
import 'package:top_components/widgets/buttons/primary_button.dart';

class AddressInputField extends StatefulWidget {
  AdressBloc _adressBloc;
  AddressInputField(this._adressBloc);

  @override
  _AddressInputFieldState createState() => _AddressInputFieldState();
}

class _AddressInputFieldState extends State<AddressInputField> {
  final TextEditingController _controllerEstado = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerBairro = TextEditingController();
  final TextEditingController _controllerEndereco = TextEditingController();
  final TextEditingController _controllerNumero = TextEditingController();
  final TextEditingController _controllerComplemento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final cartManager = context.watch<CartManager>();

    String emptyValidator(String text) =>
        text.isEmpty ? 'Campo obrigatório' : null;
    /* if (address.zipCode != null) */

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<String>(
            stream: widget._adressBloc.estado,
            builder: (context, snapshot) {
              _controllerEstado.text = snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                enabled: false,
                controller: _controllerEstado,
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
                //onSaved: (t) => _controllerEstado.text = t,
              );
            }),
        StreamBuilder<String>(
            stream: widget._adressBloc.cidade,
            builder: (context, snapshot) {
              _controllerCity.text = snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                enabled: false,
                controller: _controllerCity,
                //initialValue: widget.address.city,
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
                // onSaved: (t) => widget.address.city = t,
              );
            }),
        StreamBuilder<String>(
            stream: widget._adressBloc.bairro,
            builder: (context, snapshot) {
              _controllerBairro.text = snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                controller: _controllerBairro,
                //initialValue: widget.address.street,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Bairro',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  //hintText: 'Av. Brasil',
                ),
                validator: emptyValidator,
                //onSaved: (t) => widget.address.district = t,
              );
            }),
        StreamBuilder<String>(
            stream: widget._adressBloc.endereco,
            builder: (context, snapshot) {
              _controllerEndereco.text = snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                controller: _controllerEndereco,
                onChanged: (value) {
                  _controllerEndereco.text = value;
                },
                //initialValue: widget.address.street,
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
                //onSaved: (t) => widget.address.street = t,
              );
            }),
        StreamBuilder<String>(
            stream: widget._adressBloc.numero,
            builder: (context, snapshot) {
              _controllerNumero.text = snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                controller: _controllerNumero,
                onChanged: (value) {
                  _controllerNumero.text = value;
                },
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
                // onSaved: (t) => _controllerNumero.text = t,
              );
            }),
        StreamBuilder<String>(
            stream: widget._adressBloc.complemento,
            builder: (context, snapshot) {
              _controllerComplemento.text =
                  snapshot.hasData ? snapshot.data : '';

              return TextFormField(
                controller: _controllerComplemento,
                onChanged: (value) {
                  _controllerComplemento.text = value;
                },
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Complemento (opcional)',
                  hintText: 'Ex: Bloco e Apartamento',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                //onSaved: (t) => widget.address.complement = t,
              );
            }),
        SizedBox(
          height: 24,
        ),
        PrimaryButton(
            background: Colors.orange,
            text: 'Salvar',
            action: () {
              if (Form.of(context).validate()) {
                Form.of(context).save();
                Navigator.of(context).pushNamed('/');
              }
            }),
      ],
    );
    /* else
      return Container(); */
  }
}
