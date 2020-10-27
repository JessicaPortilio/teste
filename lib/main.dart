import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/bloc/adress_bloc.dart';
import 'package:teste/pages/menu/perfil/perfil.page.dart';
import 'package:teste/pages/menu/perfil/address.page.dart';
import 'package:teste/utils/app_routes.dart';
import 'package:teste/models/cart_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AdressBloc _adressBloc = AdressBloc();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartManager(),
      lazy: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        /*  theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ), */
        routes: {
          AppRoutes.HOME: (ctx) => PerfilPage(),
          AppRoutes.ADDRESS_PAGE: (ctx) => AddressPage(_adressBloc)
        },
      ),
    );
  }
}
