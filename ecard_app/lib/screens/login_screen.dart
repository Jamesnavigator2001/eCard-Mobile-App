
import 'package:ecard_app/client/auth_requests.dart';
import 'package:ecard_app/components/custom_widgets.dart';
import 'package:ecard_app/utils/raw/model_icons.dart';
import 'package:ecard_app/utils/resources/images/images.dart';
import 'package:ecard_app/utils/resources/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonDisabled = false;
  bool _isLoading = false;

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
                          InputField.passwordField(context, _passwordController),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () async {
                                setState(() {
                                  _isLoading = true;
                                  _isButtonDisabled = true;
                                });

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => PopScope(
                                    canPop: false,
                                    child: AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          LoadingAnimationWidget.stretchedDots(
                                            color: Theme.of(context).highlightColor,
                                            size: 24.0,
                                          ),
                                          const SizedBox(height: 20),
                                          NormalHeaderWidget(
                                            text: "Loading",
                                            color: Theme.of(context).highlightColor,
                                            size: "24.0",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                                try {
                                  var response = await AuthRequests.login("login", {
                                    "username": _usernameController.text,
                                    "password": _passwordController.text
                                  });
                                  Navigator.pop(context); // Close dialog before navigation
                                  if (response.statusCode == 200) {
                                    Navigator.pushReplacementNamed(context, '/dashboard');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Login failed: ${response.body}')),
                                    );
                                  }
                                } catch (e) {
                                  Navigator.pop(context); // Close dialog on error
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: ${e.toString()}')),
                                  );
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      _isLoading = false;
                                      _isButtonDisabled = false;
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                minimumSize: Size(MediaQuery.of(context).size.width / 4, 48.0),
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                                  shape: BoxShape.rectangle,
                                ),
                                child: SizedBox(
                                  height: 30.0,
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: Center(
                                    child: HeaderBoldWidget(
                                      text: Texts.login,
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
                                          color: Theme.of(context).primaryColor,
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
                      child:HeaderBoldWidget(text: Texts.forgotPassword, color: Theme.of(context).primaryColor, size: '14.0'),
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