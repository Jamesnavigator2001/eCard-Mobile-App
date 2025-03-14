import 'package:ecard_app/components/custom_widgets.dart';
import 'package:ecard_app/utils/resources/strings/strings.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: LayoutBuilder(builder: (context , constraints) => SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderBoldWidget(text: Headlines.weGotYou, color: Theme.of(context).primaryColor, size: "24.0"),
                Padding(padding: const EdgeInsets.only(top: 12.0),
                child: HeaderCenterWidget(text: Texts.forgetBanner, color: Theme.of(context).hintColor, size: '16.0'),),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 00,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:const BorderRadius.only(topLeft: Radius.circular(200), bottomLeft: Radius.circular(200))
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          ),
        )),
      ),
    );
  }

}