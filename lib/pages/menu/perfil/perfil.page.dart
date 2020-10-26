import 'package:flutter/material.dart';
import 'package:top_components/TopIcons.dart';
import 'package:top_components/widgets/forms/form_input.dart';
import 'package:top_components/widgets/forms/form_text_input.dart';
import 'package:top_components/widgets/inputs/top_inputs.dart';
import 'package:top_components/widgets/buttons/add_button.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 33),
          child: Container(
            height: 33,
            child: Text(
              'Perfil',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
            child: IconButton(
                icon: Icon(
                  TopIcons.close,
                  color: Colors.orange,
                ),
                onPressed: () {}),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //Aqui a porca torce o rabo.
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Container(
                padding: EdgeInsets.all(2), //se quiser mais grosso troque aqui.
                margin: const EdgeInsets.only(left: 72, right: 72),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          //fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://img.elo7.com.br/product/zoom/260517E/caricatura-digital-de-crianca-tema-rosto-inocente.jpg'))),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FormTextInput(
              title: 'Como quer ser chamada',
            ),
            FormTextInput(
              title: 'E-mail',
            ),
            FormTextInput(
              title: 'Telefone',
            ),
            FormInput(
              textField: TopInputDefault(
                decoration: (context, defaultInputDecoration) =>
                    defaultInputDecoration.copyWith(
                  hintStyle: TextStyle(
                    height: 2.1,
                    color: Colors.orange,
                    fontSize: 20,
                    letterSpacing: 0.15,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        TopIcons.arrow_right,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              title: 'Endereço de faturamento',
            ),
            FormInput(
              textField: TopInputDefault(
                decoration: (context, defaultInputDecoration) =>
                    defaultInputDecoration.copyWith(
                  hintStyle: TextStyle(
                    height: 2.1,
                    color: Colors.orange,
                    fontSize: 20,
                    letterSpacing: 0.15,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        TopIcons.arrow_right,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              title: 'Endereço de entrega',
            ),
            FormInput(
              textField: TopInputDefault(
                decoration: (context, defaultInputDecoration) =>
                    defaultInputDecoration.copyWith(
                  hintStyle: TextStyle(
                    height: 2.1,
                    color: Colors.orange,
                    fontSize: 20,
                    letterSpacing: 0.15,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        TopIcons.arrow_right,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              title: 'Endereço de entrega 2',
            ),
            AddButton(
              action: () {
                Navigator.of(context).pushNamed('/AddressPage');
              },
              text: 'CADASTAR NOVO ENDEREÇO',
              icon: TopIcons.plus_circle,
              colorButton: Colors.orange,
              font: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
