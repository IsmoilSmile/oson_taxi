import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/green_intro_widget.dart';
import '../../widgets/my_botton.dart';
import '../login_screen.dart';

class DecisionScreen extends StatelessWidget {
  DecisionScreen({Key? key}) : super(key: key);


  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            greenIntroWidgetWithoutLogos(),

            const SizedBox(height: 50,),

            DecisionButton(
                'assets/driver.png',
                'Login As Driver',
                    (){
                  authController.isLoginAsDriver = true;
                  Get.to(()=> LoginScreen());
                },
                Get.width*0.8
            ),

            const SizedBox(height: 20,),
            DecisionButton(
                'assets/customer.png',
                'Login As User',
                    (){
                  authController.isLoginAsDriver = false;
                  Get.to(()=> LoginScreen());



                },
                Get.width*0.8
            ),
          ],
        ),
      ),
    );
  }
}
