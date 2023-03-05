import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/auth_controller.dart';
import '../widgets/green_intro_widget.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController shopController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null? Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ):Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.yellow),
                          image: DecorationImage(
                              image: FileImage(selectedImage!),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          color: Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget("Ism", Icons.person_outline, nameController, (String? input){
                      if(input!.isEmpty){
                        return "Ism kiritish shart!";
                      }
                      if(input.length<5){
                        return "Iltimos ism to'liq kiriting!";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        "Uy Manzil", Icons.home_outlined, homeController, (String? input){
                      if(input!.isEmpty){
                        return "Uy manzili kiritish shart!";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget("Bezness Markaz", Icons.card_travel,
                        businessController, (String? input){
                          if(input!.isEmpty){
                            return "Bizness markazini kiritish shart!";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget("Savdo Markaz",
                        Icons.shopping_cart_outlined, shopController, (String? input){
                          if(input!.isEmpty){
                            return "Savdo markazini kiritish shart!";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => authController.isProfileUploading.value
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : yellowButton('Submit', () {
                          if(!formKey.currentState!.validate()){
                            return;
                          }

                      if (selectedImage == null) {
                        Get.snackbar('Ogohlik!', 'Itimos rasmingiz joylashtiring');
                        return;
                      }
                      authController.isProfileUploading(true);
                      authController.storeUserInfo(
                          selectedImage!,
                          nameController.text,
                          homeController.text,
                          businessController.text,
                          shopController.text,
                      );
                    })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFieldWidget(
      String title, IconData iconData, TextEditingController controller, Function validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffA7A7A7)),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: Colors.yellow,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget yellowButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color:Colors.yellow,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
