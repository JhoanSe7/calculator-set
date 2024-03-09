import 'package:calculator/helpers/paths/assets_path.dart';
import 'package:calculator/helpers/paths/images_path.dart';
import 'package:calculator/helpers/widgets/paragraph_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Colors.lightGreen.withOpacity(.7)),
        child: Column(
          children: [
            SizedBox(height: size.height * .25),
            Hero(
              tag: 'info',
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path.images + images.calc),
                  ),
                ),
              ),
            ),
            const TitleWidget(
              "Calculator",
              textColor: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
              shadow: true,
            ),
            const TitleWidget(
              "v1.0.0",
              fontSize: 16,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 30),
            const ParagraphWidget(
              'Automatas y Lenguajes Formales',
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            const ParagraphWidget('Jhoan Silva'),
            const ParagraphWidget('Carlos Santos'),
            const ParagraphWidget('Brayan Villamizar'),
            const Spacer(),
            const ParagraphWidget(
              'Powered by: @JhoanSe7',
              fontSize: 10,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
