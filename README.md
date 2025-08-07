# siqma_field

A fully customizable and secure `TextFormField` widget built for Flutter. `SiqmaField` simplifies form creation while providing input sanitization and styling flexibility.

![Pub Version](https://img.shields.io/pub/v/siqma_field)
![Flutter](https://img.shields.io/badge/flutter-compatible-blue)

---

## ✨ Features

- Highly customizable text field widget
- Input sanitization (protects against special characters)
- Support for:
  - Toggle password visibility
  - Prefix and suffix icons
  - Border styling
  - Custom label, hint, and input styles

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  siqma_field: ^1.0.1
```

## 🔧 Usage

```dart
import 'package:siqma_field/siqma_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController exampleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    exampleController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SiqmaField(
                controller: exampleController,
                label: "Email",
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16),
              SiqmaField(
                controller: passwordController,
                label: "Password",
                obscureText: !isPasswordVisible,
                textInputAction: TextInputAction.next,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              SiqmaField(
                controller: confirmPasswordController,
                label: "Confirm Password",
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
