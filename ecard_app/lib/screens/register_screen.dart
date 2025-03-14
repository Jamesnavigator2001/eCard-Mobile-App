import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_widgets.dart';
import '../utils/resources/images/images.dart';
import '../utils/resources/strings/strings.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});
  @override
  State<StatefulWidget> createState() => _RegisterPageState();

}
class _RegisterPageState extends State<RegisterPage>{
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _companyTitleController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                              HeaderBoldWidget(text: Headlines.registerHeader, color: Theme.of(context).highlightColor, size: "24.0"),
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
                            child: NormalHeaderWidget(text: Headlines.registerDesc, color: Theme.of(context).highlightColor, size: "18.0"),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/2,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                          child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20,),
                                  InputField(controller: _firstNameController, icon: Icon(Icons.person), hintText: "First Name",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _middleNameController, icon: Icon(Icons.person), hintText: "Second Name",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _lastNameController, icon: Icon(Icons.person), hintText: "Last Name",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _emailController, icon: Icon(Icons.email), hintText: "Email",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _phoneNumberController, icon: Icon(Icons.phone), hintText: "Phone number",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _bioController, icon: Icon(FontAwesomeIcons.borderNone), hintText: "Your bio (Optional)",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _companyTitleController, icon: Icon(CupertinoIcons.house_alt_fill), hintText: "Company Title",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _jobTitleController, icon: Icon(FontAwesomeIcons.mailchimp), hintText: "job Title",),
                                  const SizedBox(height: 20,),
                                  InputField(controller: _usernameController, icon: Icon(Icons.contact_mail), hintText: "username",),
                                  const SizedBox(height: 20,),
                                  InputField.passwordField(context, _passwordController),
                                  const SizedBox(height: 20,),
                                  ElevatedButton(
                                    onPressed: () {

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
                                            text: Texts.register,
                                            color: Theme.of(context).highlightColor,
                                            size: '24.0',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        NormalHeaderWidget(text: Texts.haveAccount, color: Theme.of(context).highlightColor, size: '14.0'),
                                        SizedBox(width: 3,),
                                        GestureDetector(
                                          child:HeaderBoldWidget(text: Texts.login, color: Theme.of(context).primaryColor, size: '14.0'),
                                          onTap: (){
                                            Navigator.pushNamed(context, '/login');
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                          ),
                        ),
                    ),
                  ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
