import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                "How it work's ?",
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "- Goto the whatsapp",
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
              Text(
                "- view some stories",
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
              Text(
                "- come back to app",
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
              Text(
                "- pull to refresh",
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: SizedBox(
                  width: 80,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
