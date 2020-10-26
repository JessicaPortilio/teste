import 'package:flutter/material.dart';
import 'package:teste/bloc/adress_bloc.dart';
import 'package:top_components/widgets/forms/form_text_input.dart';
import 'package:flutter/services.dart';
import 'package:teste/components/cep_input_field.dart';
import 'package:teste/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/address.dart';
import 'package:teste/components/address_input_field.dart';
import 'package:top_components/widgets/navigation_bar.dart';

class AddressPage extends StatefulWidget {
  var _adressBloc;

  AddressPage(this._adressBloc);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        elevation: 0,
        title: 'Adicionar Enderenço',
      ),
      body:
         Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 6,
              ),
              Form(child: CepInputField(widget._adressBloc)),
              SizedBox(
                height: 6,
              ),
              Form(child: AddressInputField(widget._adressBloc)),
            ],
          ),
        )
,
    );
  }
}
