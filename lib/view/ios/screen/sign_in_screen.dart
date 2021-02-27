import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
          child: Consumer<SignInViewModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(model.email),
                    Text(model.password),
                    CupertinoButton(child: Text(model.email), onPressed: () {
                      model.email = "hund";
                      model.write();
                    })
                  ],
                ),
              );
            }
          ),
        )
    );
  }
}
