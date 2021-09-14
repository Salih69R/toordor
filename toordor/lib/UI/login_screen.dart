import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Demo Asap',
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginScreenState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  AppBar _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Simple Login ASAP"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
  }

  void _createAccountPressed() {
    print('The user wants to create an accoutn with $_email and $_password');
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}











// import 'package:flutter/material.dart';
 
// void main() {  
//  runApp(MyApp());  
// }  
 
// class MyApp extends StatefulWidget {  
//  //You have to create a list with the type of login's that you are going to import into your application  
 
//  @override  
//  _MyAppState createState() => _MyAppState();  
// }  
 
// class _MyAppState extends State<MyApp> {  
//  @override  
//  Widget build(BuildContext context) {  
 
 
//    return MaterialApp(  
//        title: 'Flutter Demo',  
//        theme: ThemeData(  
//          primarySwatch: Colors.blue,  
//          visualDensity: VisualDensity.adaptivePlatformDensity,  
//        ),  
//        home: Scaffold(  
//            body: buildLoginFresh()));  
//  }  
 
//  LoginFresh buildLoginFresh() {  
 
//    List<LoginFreshTypeLoginModel> listLogin = [  
//      LoginFreshTypeLoginModel(  
//          callFunction: (BuildContext _buildContext) {  
//            // develop what they want the facebook to do when the user clicks  
//  },  
//          logo: TypeLogo.facebook),  
//      LoginFreshTypeLoginModel(  
//          callFunction: (BuildContext _buildContext) {  
//            // develop what they want the Google to do when the user clicks  
//  },  
//          logo: TypeLogo.google),  
//      LoginFreshTypeLoginModel(  
//          callFunction: (BuildContext _buildContext) {  
//            print("APPLE");  
//            // develop what they want the Apple to do when the user clicks  
//  },  
//          logo: TypeLogo.apple),  
//      LoginFreshTypeLoginModel(  
//          callFunction: (BuildContext _buildContext) {  
//            Navigator.of(_buildContext).push(MaterialPageRoute(  
//              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
//            ));  
//          },  
//          logo: TypeLogo.userPassword),  
//    ];  
 
//    return LoginFresh(  
//            pathLogo: 'assets/logo.png',  
//            isExploreApp: true,  
//            functionExploreApp: () {  
//              // develop what they want the ExploreApp to do when the user clicks  
//  },  
//            isFooter: true,  
//            widgetFooter: this.widgetFooter(),  
//            typeLoginModel: listLogin,  
//            isSignUp: true,  
//            widgetSignUp: this.widgetLoginFreshSignUp(),  
//      );  
//  }  
 
//  Widget widgetLoginFreshUserAndPassword() {  
//    return LoginFreshUserAndPassword(  
//              callLogin: (BuildContext _context, Function isRequest,  
//                  String user, String password) {  
//                isRequest(true);  
 
//                Future.delayed(Duration(seconds: 2), () {  
//                  print('-------------- function call----------------');  
//                  print(user);  
//                  print(password);  
//                  print('-------------- end call----------------');  
 
//                  isRequest(false);  
//                });  
//              },  
//              logo: './assets/logo_head.png',  
//              isFooter: true,  
//              widgetFooter: this.widgetFooter(),  
//              isResetPassword: true,  
//              widgetResetPassword: this.widgetResetPassword(),  
//              isSignUp: true,  
//              signUp: this.widgetLoginFreshSignUp(),  
//            );  
//  }  
 
//  Widget widgetResetPassword() {  
//    return LoginFreshResetPassword(  
//      logo: 'assets/logo_head.png',  
//      funResetPassword: (BuildContext _context, Function isRequest, String email) {  
//        isRequest(true);  
 
//        Future.delayed(Duration(seconds: 2), () {  
//          print('-------------- function call----------------');  
//          print(email);  
//          print('-------------- end call----------------');  
//          isRequest(false);  
 
//        });  
//      },  
 
//      isFooter: true,  
//      widgetFooter: this.widgetFooter(),  
//    );  
//  }  
 
//  Widget widgetFooter() {  
//    return LoginFreshFooter(  
//      logo: 'assets/logo_footer.png',  
//      text: 'Power by',  
//      funFooterLogin: () {  
//        // develop what they want the footer to do when the user clicks  
//  },  
//    );  
//  }  
 
//  Widget widgetLoginFreshSignUp() {  
//    return LoginFreshSignUp(  
//      isFooter: true,  
//        widgetFooter: this.widgetFooter(),  
//        logo: 'assets/logo_head.png',  
//        funSignUp: (BuildContext _context, Function isRequest,  
//            SignUpModel signUpModel) {  
//          isRequest(true);  
 
//          print(signUpModel.email);  
//          print(signUpModel.password);  
//          print(signUpModel.repeatPassword);  
//          print(signUpModel.surname);  
//          print(signUpModel.name);  
 
//          isRequest(false);  
//        });  
//  }  

// }

