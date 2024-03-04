import 'package:calculator/helpers/paths/assets_path.dart';
import 'package:calculator/helpers/paths/images_path.dart';
import 'package:calculator/helpers/widgets/paragraph_widget.dart';
import 'package:calculator/helpers/widgets/title_widget.dart';
import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 50),
            const ParagraphWidget('Desarrollado por: Jhoan Silva'),
            const ParagraphWidget('Apoyo de: Carlos y Brayan', fontSize: 10)
          ],
        ),
      ),
    );
  }
}
