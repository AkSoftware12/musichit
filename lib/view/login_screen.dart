import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../UI/Widgets/Atoms/custom_button.dart';
import '../UI/Widgets/Organisms/login_screen_otp_sheet.dart';
import '../routes/name_routes.dart';
import '../utils/app_colors.dart';
import '../utils/common_toast.dart';
import '../view_model/login_provider.dart';


// class LogInScreen extends StatefulWidget {
//   final Map args;
//   const LogInScreen({super.key, required this.args});
//
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }
//
// class _LogInScreenState extends State<LogInScreen> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     final logInProvider =  Provider.of<LogInProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         backgroundColor: primaryColor,
//         title: Text(widget.args['title'].toString(), style: TextStyle(color: whiteColor),),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             TextFormField(
//               controller: email,
//               decoration: const InputDecoration(
//                 hintText: "Enter email",
//               ),
//             ),
//
//             const SizedBox(height: 10,),
//             TextFormField(
//               controller: password,
//               decoration: const InputDecoration(
//                 hintText: "Enter password",
//               ),
//             ),
//
//
//             const SizedBox(height: 30),
//
//             SizedBox(
//               height: 50,width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: (){
//
//
//
//
//
//                     if(email.text.isEmpty){
//                       commonToast("Please enter email");
//                     }else if(password.text.isEmpty){
//                       commonToast("Please enter password");
//                     }else{
//                       Map data=  {
//                         "email": email.text.toString(),
//                         "password": password.text.toString()
//                       };
//                       logInProvider.useLogIn(data, context);
//                     }
//
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: whiteColor
//                   ),
//                   child: logInProvider.isLoading?CircularProgressIndicator(color: whiteColor,): const Text("LogIn")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


class LogInScreen extends StatefulWidget {
  final Map args;
  const LogInScreen({super.key, required this.args});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Set your design size here
      minTextAdapt: true, // Ensure this is initialized
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/music.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward();
                    _controller.repeat();
                  },
                  repeat: true,
                  frameRate: FrameRate.max,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/music_logo.png",
                    height: 80.sp,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Welcome to the Music Hit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Online and Offline Songs',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: customTextButton(context,
                      title: "Continue",
                      callback: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) => const LoginwithMobileWidget(),
                        );
                      }),
                ),
                const Divider(),
                const Text(
                  'By continuing, you agree to our terms of service and privacy policy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
