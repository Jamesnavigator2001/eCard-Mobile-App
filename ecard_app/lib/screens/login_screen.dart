import 'package:ecard_app/components/alert_reminder.dart';
import 'package:ecard_app/components/custom_widgets.dart';
import 'package:ecard_app/router/page_router.dart';
import 'package:ecard_app/utils/raw/model_icons.dart';
import 'package:ecard_app/utils/resources/images/images.dart';
import 'package:ecard_app/utils/resources/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isTextObscured = true;
  final bool _showLoader = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.0 , top: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeaderBoldWidget(text: Headlines.loginToAccessAccount, color: Theme.of(context).highlightColor, size: "24.0"),
                              const SizedBox(width: 100,),
                              ClipOval(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: -10,
                                          child: Image.asset(Images.splashImage,
                                            height: 60 , width: 60 , fit: BoxFit.cover,))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.0 , top: 20.0),
                            child: NormalHeaderWidget(text: Headlines.loginDesc, color: Theme.of(context).highlightColor, size: "18.0"),
                          ),
                        ],
                  )
                  ),
                ),
              ),

              const SizedBox(height: 20,),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).primaryColor),
                      bottom: BorderSide(color: Theme.of(context).primaryColor),
                      left: BorderSide(color: Theme.of(context).primaryColor),
                      right: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    width: double.infinity,
                    child: Padding(padding: EdgeInsets.only(left: 50 , right:50 ,top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InputField(controller: _usernameController , hintText: "username", icon: Icon(Icons.mail)),
                          const SizedBox(height: 20,),
                          TextField(
                            obscureText: _isTextObscured,
                            controller: _passwordController,
                            cursorColor: Theme.of(context).primaryColor,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(color: Theme.of(context).primaryColor),
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.white,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.padlock_solid),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isTextObscured = !_isTextObscured; // Toggle state
                                    });
                                  },
                                  icon: Icon(_isTextObscured ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
                                  ),
                              ),)
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () {
                              try{
                                void queryFn() async{
                                  if(_showLoader){
                                    showDialog(
                                        context: context,
                                        builder: (context)=>ShowCardAlert(image: Images.splashImage, title: Loaders.wait, status: 'true'));
                                  }
                                  var response ;

                                }
                              }catch(e){
                                if(kDebugMode){
                                  print('An error occurred');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor, // Set the background color to green
                              minimumSize: Size(MediaQuery.of(context).size.width / 4, 48.0), // Set width to half of the screen width and height to 48.0
                              padding: EdgeInsets.symmetric(vertical: 12.0), // Adjust padding for better appearance
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.1),
                                shape: BoxShape.rectangle,
                              ),
                              child: SizedBox(
                                height: 30.0,
                                width: MediaQuery.of(context).size.width / 6, // Reduce width further if needed
                                child: Center( // Center the child widget
                                  child: HeaderBoldWidget(
                                    text: Headlines.login,
                                    color: Theme.of(context).highlightColor,
                                    size: '24.0',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      color: Colors.white, // Match background color to "hide" the line behind the text
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "OR",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1, // Thickness of the line
                                      color: Theme.of(context).primaryColor, // Color of the line
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for(int i=0; i<LoginWidgetClickableIcons.icons(context).length; i++)...[
                                Padding(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(padding: const EdgeInsets.all(16.0),
                                    child: Icon(LoginWidgetClickableIcons.icons(context)[i].icon,size: 18,color: Theme.of(context).highlightColor,),),
                                  ),
                                )
                              ]
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                NormalHeaderWidget(text: Texts.noAccount, color: Theme.of(context).highlightColor, size: '14.0'),
                                SizedBox(width: 3,),
                                GestureDetector(
                                  child:HeaderBoldWidget(text: Texts.register, color: Theme.of(context).primaryColor, size: '14.0'),
                                  onTap: (){
                                      Navigator.pushNamed(context, '/register');
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 3,),
                    GestureDetector(
                      child:HeaderBoldWidget(text: Texts.forgotEmail, color: Theme.of(context).primaryColor, size: '14.0'),
                      onTap: (){
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}