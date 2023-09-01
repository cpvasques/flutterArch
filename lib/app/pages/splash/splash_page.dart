import 'package:app_flutter_arch/app/core/router/app_router_extensions.dart';
import 'package:app_flutter_arch/app/core/ui/helpers/size_extensions.dart';
import 'package:app_flutter_arch/app/core/ui/widgets/button_example.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(255, 0, 127, 231),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 0, 127, 231).withOpacity(
                      0.3,
                    ), // Ajuste a opacidade conforme desejado
                    BlendMode.srcOver,
                  ),
                  child: Image.asset(
                    'assets/images/splash_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.5),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ButtonExample(
                    width: context.percentWidth(.5),
                    height: 35,
                    label: 'Ir para home',
                    onPressed: () {
                      context.popAndPushNamed('/home');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
