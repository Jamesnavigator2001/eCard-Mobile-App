import 'package:ecard_app/components/custom_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowCardAlert extends StatelessWidget {
  String image;
  String title;
  String status;
  ShowCardAlert(
      {super.key,
        required this.image,
        required this.title,
        required this.status});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: HeaderCenterWidget(
                  text: title, color: Theme.of(context).hintColor, size: '14'),
            ),
            GestureDetector(
              onTap: () {
                switch (status) {
                  case "true":
                    Navigator.pop(context);
                    break;
                  case "login":
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                    break;
                  case "home":
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/dashboard');
                    break;
                  case "no_route":
                    Navigator.pop(context);
                    break;
                  default:
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/otpchecking');
                    break;
                }
              },
              child: status == "true"
                  ? const Text("")
                  : Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  child: HeaderCenterWidget(
                      text: status == "false"
                          ? "Go Verification"
                          : status == "login"
                          ? "Back to Sign Up"
                          : status == "home"
                          ? "Got to Dashboard"
                          : "Accept",
                      color: Theme.of(context).highlightColor,
                      size: "14"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
