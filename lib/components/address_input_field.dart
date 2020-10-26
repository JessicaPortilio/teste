import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:teste/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/address.dart';
import 'package:top_components/widgets/buttons/primary_button.dart';

class AddressInputField extends StatelessWidget {
  const AddressInputField(this.address);

  final Address address;

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();

    String emptyValidator(String text) =>
        text.isEmpty ? 'Campo obrigatório' : null;
    /* if (address.zipCode != null) */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          enabled: false,
          initialValue: address.state,
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
          onSaved: (t) => address.state = t,
        ),
        TextFormField(
          enabled: false,
          initialValue: address.city,
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
          onSaved: (t) => address.city = t,
        ),
        TextFormField(
          initialValue: address.district,
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
          onSaved: (t) => address.district = t,
        ),
        TextFormField(
          initialValue: address.street,
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
          onSaved: (t) => address.street = t,
        ),
        TextFormField(
          initialValue: address.number,
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
          onSaved: (t) => address.number = t,
        ),
        TextFormField(
          initialValue: address.complement,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Complemento (opcional)',
            hintText: 'Ex: Bloco e Apartamento',
            labelStyle: TextStyle(color: Colors.black),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
          onSaved: (t) => address.complement = t,
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
            }),
      ],
    );
    /* else
      return Container(); */
  }
}
