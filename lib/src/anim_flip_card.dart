import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedFlipCard extends StatefulWidget {
  /// Set the front image of the card
  final Image front;

  /// Set the back image of the card
  final Image back;

  /// Animated Flip Card
  const AnimatedFlipCard({Key? key, required this.front, required this.back})
      : super(key: key);

  @override
  _AnimatedFlipCardState createState() => _AnimatedFlipCardState();
}

class _AnimatedFlipCardState extends State<AnimatedFlipCard>
    with TickerProviderStateMixin {
  // Animation controller
  late AnimationController controller;
  // Toggle front-back image
  bool isFront = true;
  double anglePlus = 0;

  final FlipCardController cardController = FlipCardController();

  @override
  void initState() {
    super.initState();

    // Load images directly into cache to prevent the switching lag
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      precacheImage(widget.front.image, context);
      precacheImage(widget.back.image, context);
    });
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    cardController.state = this;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future flipCard() async {
    // To prevent stopping animation by pressing multiple times
    if (controller.isAnimating) return;
    // Change the showing side of the card
    isFront = !isFront;

    // To set the flipping animation on one direction
    await controller.forward(from: 0).then((value) => anglePlus = pi);

    // To make the flipping animation change directions
    // if (isFront) {
    //   await controller.reverse();
    // } else {
    //   await controller.forward();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await cardController.flipCard();
      },
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            // Flipping angle
            double angle = controller.value * -pi;
            if (isFront) angle += anglePlus;
            final transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(angle);
            //Transform the child between front and back images
            return Transform(
              alignment: Alignment.center,
              transform: transform,
              child: isFrontImage(angle.abs())
                  ? widget.front
                  : Transform(
                      transform: Matrix4.identity()..rotateX(pi),
                      alignment: Alignment.center,
                      child: widget.back),
            );
          }),
    );
  }

  isFrontImage(double abs) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;

    return abs <= degrees90 || abs >= degrees270;
  }
}

class FlipCardController {
  _AnimatedFlipCardState? state;

  Future flipCard() async {
    state?.flipCard();
  }
}
