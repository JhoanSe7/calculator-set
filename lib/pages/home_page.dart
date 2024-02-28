import 'package:calculator/helpers/paths/paths.dart';
import 'package:calculator/helpers/widgets/custom_dropdown_menu_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:calculator/models/item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'generator_page.dart';

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
        title: const TitleWidget(
          "Calculator",
          textColor: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
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
              items: [
                Item(title: 'Pertenencia', action: () => _goToSet('Pertenencia', 1)),
                Item(title: 'Unión', action: () => _goToSet('Unión', 2)),
                Item(title: 'Intersección', action: () => _goToSet('Intersección', 3)),
                Item(title: 'Complemento', action: () => _goToSet('Complemento', 4)),
                Item(title: 'Diferencia Absoluta', action: () => _goToSet('Diferencia Absoluta', 5)),
                Item(title: 'Diferencia Simetrica', action: () => _goToSet('Diferencia Simetrica', 6)),
              ],
            ),
            CustomDropdownMenuWidget(
              title: "Cadenas",
              icon: path.icons + icons.cadena,
              items: [
                Item(title: 'Longitud', action: () => _goToString('Longitud', 1)),
                Item(title: 'Concatenación', action: () => _goToString('Concatenación', 2)),
                Item(title: 'Potenciación', action: () => _goToString('Potenciación', 3)),
                Item(title: 'Inversa o Trasposición', action: () => _goToString('Inversa o Trasposición', 4)),
              ],
            ),
            CustomDropdownMenuWidget(
              title: "Lenguajes",
              icon: path.icons + icons.lenguaje,
              items: [
                Item(title: 'Concatenación', action: () => _goToLanguage('Concatenación', 1)),
                Item(title: 'Potenciación', action: () => _goToLanguage('Potenciación', 2)),
                Item(title: 'Inversa o Trasposición', action: () => _goToLanguage('Inversa o Trasposición', 3)),
              ],
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

  _goToSet(String page, int index) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneratorPage(title: page, index: index, view: ViewPage.set),
      ),
    );
  }

  _goToString(String page, int index) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneratorPage(title: page, index: index, view: ViewPage.string),
      ),
    );
  }

  _goToLanguage(String page, int index) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneratorPage(title: page, index: index, view: ViewPage.language),
      ),
    );
  }
}
