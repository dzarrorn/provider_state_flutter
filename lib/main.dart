import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_flutter/gender_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
      create: (context) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<GenderProvider>(
                    builder: (context, genderProvider, _) => Text(
                      'Click Your Gender',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: genderProvider.color),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = true;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.maleColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icon_male.png',
                                  color: genderProvider.maleColor,
                                ),
                                Text(
                                  'Male',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: genderProvider.maleColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = false;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.femaleColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icon_female.png',
                                  color: genderProvider.femaleColor,
                                ),
                                Text(
                                  'Female',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: genderProvider.femaleColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
