import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPaletteGenerator(),
    );
  }
}

class ColorPaletteGenerator extends StatefulWidget {
  @override
  _ColorPaletteGeneratorState createState() => _ColorPaletteGeneratorState();
}

class _ColorPaletteGeneratorState extends State<ColorPaletteGenerator> {
  List<Color> colors = [];
  double opacity = 0.0; // Initial opacity for the fade-in animation

  // Generate a random color palette consisting of 5 colors
  void generateColorPalette() {
    final randomColor = RandomColor();
    List<Color> newColors = [];
    for (int i = 0; i < 5; i++) {
      newColors.add(randomColor.randomColor());
    }
    setState(() {
      colors = newColors;
      opacity = 1.0; // Set opacity to 1 for fade-in animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // AnimatedOpacity for the color palette with a fade-in effect
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1), // Animation duration
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: colors
                    .map((color) => Container(
                          width: 50,
                          height: 50,
                          color: color,
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateColorPalette,
              child: const Text('Generate Color Palette'),
            ),
          ],
        ),
      ),
    );
  }
}
