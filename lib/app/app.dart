import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/app/controller_binding.dart';
import '../presentation/UI/splashScreen.dart';

class InventoryManagment extends StatefulWidget {
  const InventoryManagment({super.key});

  @override
  State<InventoryManagment> createState() => _InventoryManagmentState();
}

class _InventoryManagmentState extends State<InventoryManagment> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent.shade100),borderRadius: BorderRadius.circular(25),),
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent.shade100),borderRadius: BorderRadius.circular(25),),
          disabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent.shade100),borderRadius: BorderRadius.circular(25),),
          fillColor: Colors.white70,
          filled: true,
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blueAccent.shade100)

                )
            ),
          )
      ),
      home: SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
