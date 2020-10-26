import 'package:flutter/material.dart';
import 'package:top_components/widgets/forms/form_text_input.dart';
import 'package:flutter/services.dart';
import 'package:teste/components/cep_input_field.dart';
import 'package:teste/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/address.dart';
import 'package:teste/components/address_input_field.dart';
import 'package:top_components/widgets/navigation_bar.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final address = Address();
  void initState() {}

  @override
  Widget build(BuildContext context) {
    String emptyValidator(String text) =>
        text.isEmpty ? 'Campo obrigatório' : null;
    return Scaffold(
      appBar: NavigationBar(
        elevation: 0,
        title: 'Adicionar Enderenço',
      ),
      body: Consumer<CartManager>(builder: (_, cartManager, __) {
        final address = cartManager.address ?? Address();
        print(address);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 6,
              ),
              Form(child: CepInputField(address)),
              SizedBox(
                height: 6,
              ),
              Form(child: AddressInputField(address)),
            ],
          ),
        );
      }),
    );
  }
}
