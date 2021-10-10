<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Animated Flip Card
**Animated Flip Card** package lets you add an animated flip card to your Flutter app that hide and show more informations.


## Features
The AnimatedFlipCard widget is built to be an animated card that show or hide more informations about the displayed item.
It takes two images. One for the `front` face of the card and the other for the `back` of the card.

## **Recommended** 
By providing the AnimatedFlipCard widget's `front` and `back` images make sure to set your desired `width` and `height` inside the image asset (*See the example for more details*).

* *How it works?*

By pressing the widget card it will flip to the front or the back side of the card depending on the current state.

*The package will handle the animation by itself.*

![animated flip card](https://user-images.githubusercontent.com/68671238/136711160-9b56f8f4-d606-44dc-a401-9e843525a431.png)

  
<hr>

## Getting started

1. Add the latest version of package to your `pubspec.yaml` (and run `dart pub get`):
```dart
dependencies:
  animated_flip_card: ^1.0.0
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:animated_flip_card/animated_flip_card.dart';
```
<hr>

## Usage

There are a number of properties that you can modify:

* front (the front side image of the card)
* back (the back side image of the card)

**Example Usage ( complete with all params ):**
<table>
 <tr>
 <td>
      
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedFlipCard(
          front: Image.asset(
            'assets/images/front.png',
            width: 250,
            fit: BoxFit.contain,
          ),
          back: Image.asset(
            'assets/images/back.png',
            width: 250,
            fit: BoxFit.contain,
          )),
    );
  }
}
```
   </td>
   <td>
     Here's what it looks like:
     
<hr>



https://user-images.githubusercontent.com/68671238/136711345-3a2d11b0-2b66-43d0-bbcf-89e6ea79c7e5.mp4




   </td>
  </tr>
  </table>
<hr>

## Next Goals
We are working on some improvements including:

- [ ] add the possibility to choose the direction of the flipping animation.
- [ ] Customize the speed of the flip animation.

## Issues & Feedback
Please file an [issue!](https://github.com/aliMissaoui/Flutter-Package-Animated-Flip-Card/issues) to send feedback or report a bug. Thank you!

