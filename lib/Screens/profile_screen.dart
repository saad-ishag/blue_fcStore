import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens//tools/card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin:  EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h,bottom: 400.h),
          padding:  EdgeInsets.only(top: 140.h),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            gradient: const LinearGradient(colors: [ Color(0xff106199), Color(0xff499CC6)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               CircleAvatar(
                backgroundImage: const AssetImage('images/IMG_20210422_145802789.jpg'),
                backgroundColor: Colors.white,
                radius: 60.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Saad Ishag',
                    style: TextStyle(fontSize: 30.sp,color: Colors.white),
                  ),
                   SizedBox(width: 7.w),
                  const Icon(Icons.mode_edit ,color: Colors.white,size: 20,),
                ],
              ),
              Text(
                '#1 THIS WEEK | 1520 XP',
                style:  TextStyle(fontSize: 24.sp,color: Colors.white),
              ),
               SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    overflow: Overflow.visible,
                    fit: StackFit.expand,
                    children:[
                      Positioned(
                        bottom: -60.h,
                        height:630.h ,
                        width: 680.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)),

                          ),
                          margin:   EdgeInsets.only(left: 36.w,right: 36.w),
                          padding:  EdgeInsets.only(left: 18.w,right: 18.w,top: 18.h),
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children:const [
                                    Expanded(
                                        child: TheCard(text:'قائمة المتصدرين' ,icon:Icons.lightbulb_outline_rounded ,)),
                                    Expanded(
                                        child: TheCard(text:'النادي الأزرق',icon: Icons.search, )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(children:   const [
                                  Expanded(
                                      child: TheCard(text: 'طلباتي',icon:Icons.receipt)),
                                  Expanded(
                                      child: TheCard(text:'وسائل الدفع' ,icon: Icons.search )),
                                ]),
                              ),
                              Expanded(
                                child: Row(
                                  children:  const [
                                    Expanded(
                                        child: TheCard(text:'الإعدادات' ,icon:Icons.settings ,)),
                                    Expanded(
                                        child:TheCard(text:'الأندية' ,icon:Icons.search ,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
