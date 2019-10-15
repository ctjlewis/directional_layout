
# Directional Layouts  
  
A lightweight version of the more robust [Layout library](https://pub.dev/packages/layout). Create symmetric, fully responsive layouts with ease.  
  
## Getting Started  
  
VerticalLayout and HorizontalLayout are effectively just shortcuts for Columns and Rows with `MainAxisSize.max` and `MainAxisAlignment.center` set by default, and each of the provided is wrapped in an `Expanded` widget. The `SetFlex` widget can be used to give the Expanded widgets a flex other than 1, which is the default.

This allows for quick implementation of flex-based layouts.  

**Notes**
It is recommended to set the `resizeToAvoidBottomInset: false` flag for `Scaffold`s containing DirectionalLayout widgets to prevent resizing the entire UI when a keyboard is opened.

In the example below, the UI is divided into 3 sections using `flex: true` in a DirectionalLayout parent, and the middle `SignInSection` widget given flex 2 using `SetFlex` wrapper.  `VerticalShrink` is a helper widget that prevents the child (expanded inside a Column) from stretching vertically.

*This example contains the `GoogleSignInButton` widget and static methods from the [Login package](https://pub.dev/packages/login).* 
```
class SignInSection extends StatelessWidget {  
  final email = TextEditingController();  
  final password = TextEditingController();  
  
  @override  
  Widget build(BuildContext context) {  
    return Card(  
      child: VerticalLayout(  
        padding: 16,  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
        children: [  
          TextField(  
              controller: email,  
              keyboardType: TextInputType.emailAddress,  
              decoration: InputDecoration(labelText: "Email")),  
          TextField(  
              controller: password,  
              obscureText: true,  
              decoration: InputDecoration(labelText: "Password")),  
          HorizontalLayout(  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  
            children: [  
              RaisedButton(  
                child: Text("No account? Register"),  
                onPressed: () => debugPrint("Register tapped."),  
              ),  
              RaisedButton(  
                child: Text("Login"),  
                onPressed: () => Login.signInWithEmail(  
                    email: email, password: password, context: context),  
              ),  
            ],  
          )  
        ],  
      ),  
    );  
  }  
}

class HerculesLogin extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return SafeArea(  
        child: VerticalLayout(children: [  
          VerticalLayout(children: [  
            HorizontalLayout(children: [  
              Image.asset("images/hercules_logo.png", height: 48),  
              Text("Hercules",  
                  style: TextStyle(  
                    fontWeight: FontWeight.w300,  
                    fontSize: 48,  
                    color: darkBlue,  
                  )),  
            ]),  
            Text("The world's first realtime remote workplace.",  
                style: TextStyle(  
                  fontSize: 16,  
                )),  
          ]),  
          SetFlex(  
            child: SignInSection(),  
            flex: 2,  
            padding: 16,  
          ),  
          VerticalShrink(  
            child: GoogleSignInButton(),  
          ),  
        ],  
        flex: true,  
      ),  
    );  
  }  
}
```
![Example.](https://i.imgur.com/xQ7uFCe.png)