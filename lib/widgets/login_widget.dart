import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oson_taxi/widgets/text_widget.dart';
import '../utils/app_constants.dart';

Widget LoginWidget(CountryCode countryCode, Function onCountryChange, Function onSubmind) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: AppConstants.sizniKorganimizdanHursandmiz),
        textWidget(
            text: AppConstants.osonTaksiBilanHarakatlaning,
            fontWeight: FontWeight.bold,
            fontSize: 22),
        SizedBox(
          height: 40,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white60,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: ()=> onCountryChange(),
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            child: countryCode.flagImage,
                          ),
                        ),
                        SizedBox(width: 2,),
                        textWidget(text: countryCode.dialCode),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.2),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onSubmitted: (String? input) => onSubmind(input),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      hintText: AppConstants.telefonRaqamingizKiriting,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 13),
                children: [
                  TextSpan(
                    text:
                        AppConstants.hisobyaratishOrqaliSizBizningRoziligimiz +
                            ". ",
                  ),
                  TextSpan(
                    text: AppConstants.xizmatKorsatishShartlari + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "va ",
                  ),
                  TextSpan(
                    text: AppConstants.maxfiylikSiyosati + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ),
      ],
    ),
  );
}
