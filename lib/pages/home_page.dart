import 'package:calculator/helpers/paths/paths.dart';
import 'package:calculator/helpers/widgets/custom_dropdown_menu_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:calculator/pages/conjuntos/conjunto_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("Calculator"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightGreen.withOpacity(.9)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(path.images + images.calc),
                      ),
                    ),
                  ),
                  const TitleWidget('Menú', textColor: Colors.white, shadow: true),
                ],
              ),
            ),
            CustomDropdownMenuWidget(
              title: "Conjuntos",
              icon: path.icons + icons.conjunto,
              items: {
                "Pertenencia": () => _goToConjunto('Pertenencia', 1),
                "Unión": () => _goToConjunto('Unión', 2),
                "Intersección": () => _goToConjunto('Intersección', 3),
                "Complemento": () => _goToConjunto('Complemento', 4),
                "Diferencia Absoluta": () => _goToConjunto('Diferencia Absoluta', 5),
                "Diferencia Simetrica": () => _goToConjunto('Diferencia Simetrica', 6),
              },
            ),
            CustomDropdownMenuWidget(
              title: "Cadenas",
              icon: path.icons + icons.cadena,
              items: {
                'vacio': () {},
              },
            ),
            CustomDropdownMenuWidget(
              title: "Lenguajes",
              icon: path.icons + icons.lenguaje,
              items: {
                'vacio': () {},
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset(path.animations + animation.welcome),
            Padding(
              padding: const EdgeInsets.all(30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[900], height: 2, fontSize: 16, fontWeight: FontWeight.w500),
                  children: const [
                    TextSpan(text: "Dirígete al menú "),
                    WidgetSpan(child: Icon(Icons.menu)),
                    TextSpan(
                      text: " en la parte\nsuperior izquierda y selecciona una opción.",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _goToConjunto(String page, int index) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConjuntoPage(title: page, index: index),
      ),
    );
  }
}
