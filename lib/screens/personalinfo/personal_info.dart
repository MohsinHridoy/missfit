import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/activityselectiondashboard/activityselectiondashboard.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/heightselectiondashboard/height_selection_dashboard.dart';

import '../../widgets/common_text_widgets.dart';
import '../../widgets/custom_app_bar.dart';




class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
        color: Color(0xFFF6F6F6),

        child: Column(
          children: [

            CustomAppBar(
              title:  'Informations personnelles',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 7.0,
            ),
             SizedBox(height: 15,),
            _buildDelivaryStatusTextItem('Informations de base','Full Name : Helen Hanf','Age : 26','',BasicInfo(onNextPressed: () {  },status: 'profile',),),
            _buildDelivaryStatusTextItem('Objectif et activité','Niveau avancé : Débutant','Objectif gym : Renforcement de la force, Amélioration de la silhouette, Stimulation de la libido',"Durée de l'entraînement : activité légère (environ 10 à 20 minutes)",ActivitySelectionDashBoard()),
            _buildDelivaryStatusTextItem('Poids et taille','Poids : 56 kg','Hauteur : 5 pieds 6 pouces','',HeightSelectionDashBoard()),
          ],
        ),
      ),
    );
  }


  Widget _buildDelivaryStatusTextItem(String title,String text1,String text2,String? text3,Widget page) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 200.h,

                  child:txtArchivoSemiBoldBlack16(title)

                    ),

                    GestureDetector(
                      onTap: (){
                        print("clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => page),
                        );
                      },
                        child: Image.asset("assets/order/icon_edit.png",scale: 2.1,)
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 300,
                child: Text(
                  text1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10,),

              _buildDelivaryDetailsTextItem(text2),
              SizedBox(height: 10,),
              if(text3!.isNotEmpty)
                _buildDelivaryDetailsTextItem(text3),


            ],
          ),
        ),
      ),
    );
  }


  Widget _buildDelivaryDetailsTextItem(String text) {
    return SizedBox(
      width: 300,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 14,
          fontFamily: 'Archivo-Medium',
          fontWeight: FontWeight.w500,

        ),
      ),
    );
  }
}