import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/ui/login/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(
              "assets/logo/spotify_logo.svg",
              width: 150,
              height: 150,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 50),
            Text(
              "Millions of songs.\nFree on Spotify.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Sign up free",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 15),
            buildSocialButton(
              "Continue with Phone Number",
              Colors.white,
              Icons.phone_android_outlined,
            ),
            SizedBox(height: 15),
            buildSocialButton(
              "Continue with Google",
              Colors.white,
              Icons.apple,
            ),
            SizedBox(height: 15),
            buildSocialButton(
              "Continue with Facebook",
              Colors.white,
              Icons.facebook,
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 50),
            //Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, Color color, IconData icon) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {},
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 20),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
/*   MyCustomRoundedBtn(
              onTap: () {},
              bgColor: AppColors.primaryColor,
              text: "Sign up free",
            ),
            SizedBox(height: 10),
            MyCustomRoundedBtn(
              onTap: () {},
              bgColor: Colors.black,
              text: "Continue with phone number",
            ),*/
