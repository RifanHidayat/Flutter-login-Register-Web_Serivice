import 'dart:convert';

import 'package:appservice/layout/Home.dart';
import 'package:appservice/layout/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appservice/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum statusLogin { signIn, notSignIn }
class _LoginScreenState extends State<LoginScreen>{

  statusLogin _loginStatus = statusLogin.notSignIn;

  var cEmail= new TextEditingController();

  var cPassword = new TextEditingController();


  var email = '';
  var password = '';
  var _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,

          child:TextFormField(
//            validator: validasiEmail,
//            onSaved: (String value){
//              email=value;
//            },
          controller: cEmail,


            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),

              hintText: 'contoh@email.com',
              hintStyle: kHintTextStyle,

            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: new TextField(
            controller: cPassword,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Masukan Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Lupa password"),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Lupa Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
            email=cEmail.text;
            password=cPassword.text;
           if (!email.contains("@")){
             showSnakeBar(scaffoldState, 'Email tidak valide');
           }else if (password.length<4 || password.length>15 ){
             showSnakeBar(scaffoldState, 'Minimal password 4 karakter dan Maximal password 15 karakter');


           }else{

               submitDataLogin(email,password);


           }

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          'Belum Mempunyai Akun?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),

      ],
    );
  }
  Widget _buildRegisterbtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: ()  {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => RegisterScreen()
          ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(
          key: scaffoldState,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF73AEF5),
                          Color(0xFF61A4F1),
                          Color(0xFF478DE0),
                          Color(0xFF398AE5),
                        ],
                        stops: [0.1, 0.4, 0.7, 0.9],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,

                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 50.0,
                      ),


                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          _buildEmailTF(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTF(),
                          _buildForgotPasswordBtn(),
                          //_buildRememberMeCheckbox(),
                          _buildLoginBtn(),
                          _buildSignInWithText(),
                          _buildRegisterbtn(),


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return Home();
        break;
    }
  }



  final GlobalKey<ScaffoldState> scaffoldState =
  new GlobalKey<ScaffoldState>();

  void showSnakeBar(scaffoldState, String _pesan) {
    scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: Text(_pesan),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
}
// method untuk soimpan share pref
  saveDataPref(int value,String dIdUser, Namauser, Emailuser, Telpuser,JkUser) async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("id", dIdUser);
      sharedPreferences.setString("nama", Namauser);
      sharedPreferences.setString("email", Emailuser);
      sharedPreferences.setString("telp", Telpuser);
      sharedPreferences.setString("jk", JkUser);

    });
  }

  submitDataLogin(String email,String password) async {
    final responseData = await
    http.post("http://192.168.43.49/flutter_service/login.php", body: {
      "email": email,
      "password": password,
    });

    final data = jsonDecode(responseData.body);

    int value = data['value'];
    String pesan = data['message'];
    print(data);
// get data respon
    String dataId = data['id'];
    String dataNama = data['nama'];
    String dataTelp = data['email'];
    String dataEmail = data['telp'];
    String datajk = data['jk'];

// cek value 1 atau 0
    if (value == 1) {

// set status loginnya sebagai login
        _loginStatus = statusLogin.signIn;
// simpan data ke share preferences
      showSnakeBar(scaffoldState,
          'login berhasil $value $dataId $dataNama $dataTelp $dataEmail $pesan');
        saveDataPref(value,dataId, dataNama, dataTelp,dataEmail,datajk);

    } else if (value == 0) {
      showSnakeBar(scaffoldState,
          'gagal login');
    }
  }
  getDataPref() async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    setState(() {
      int nvalue = sharedPreferences.getInt("value");
      _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;


});
}
  @override
  void initState() {
    getDataPref();
    super.initState();
  }

}

