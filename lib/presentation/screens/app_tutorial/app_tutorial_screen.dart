import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      "Busca la comida",
      "Duis ut anim incididunt ad proident id sunt anim proident ex ad labore non. Ex reprehenderit excepteur ipsum reprehenderit eiusmod ex ut. Cillum esse id nulla excepteur. Sint labore id nulla adipisicing laboris exercitation tempor est cupidatat commodo nulla sunt. In deserunt quis pariatur officia enim ipsum duis laborum Lorem aliquip ullamco. Eiusmod ipsum id qui sint consectetur irure sint laboris qui Lorem fugiat occaecat nulla voluptate.",
      "assets/images/1.png"),
  SlideInfo(
      "Entrega rápida",
      "Ullamco ut irure sunt sit ex ipsum labore ut laborum. Sunt mollit minim ullamco fugiat officia Lorem proident culpa sit dolore. Laborum consectetur esse do excepteur quis tempor fugiat nisi eiusmod. Exercitation ipsum duis ullamco enim laboris.",
      "assets/images/2.png"),
  SlideInfo(
      "Disfruta la comida",
      "Aute excepteur aliqua irure ut. Ex aliqua incididunt commodo cupidatat aute voluptate cillum eu eiusmod do nostrud. Reprehenderit pariatur sit elit nostrud Lorem duis fugiat mollit tempor qui ad excepteur ad. Cupidatat exercitation id id nostrud incididunt tempor cupidatat ex aliqua consequat nisi. Exercitation duis sunt laborum commodo nisi amet ipsum officia sint exercitation. Dolore consequat Lorem amet minim quis sit excepteur magna aliquip ut commodo culpa magna.",
      "assets/images/3.png")
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (endReached && page >= (slides.length) - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text("Salir"),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Empezar"),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                caption,
                style: captionStyle,
              ),
            ]),
      ),
    );
  }
}
