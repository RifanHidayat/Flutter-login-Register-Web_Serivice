import 'dart:convert';

import 'package:appservice/layout/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appservice/utilities/constants.dart';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String jk = "";
  void pilihSex(String value){
    setState(() {
      jk = value;
    });

  }


  final GlobalKey<ScaffoldState> scaffoldState =
  new GlobalKey<ScaffoldState>();

  var cnama = new TextEditingController();
  var cEmail= new TextEditingController();
  var cPassword = new TextEditingController();
  var ctelp = new TextEditingController();


  var email = '';
  var password = '';
  var nama = '';
  var telp = '';

  Widget _buildnama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nama',

          style: kLabelStyle,

        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: cnama,
            keyboardType: TextInputType.name,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Masukan nama',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

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
          child: TextField(
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

  Widget _buildTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'No Telp',

          style: kLabelStyle,

        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: ctelp,
            keyboardType: TextInputType.phone,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Masukan no telp',
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
          child: TextField(
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




  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
          );
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
          'Sudah Mempunyai Akun?',
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
        onPressed: () {
          nama=cnama.text;
          email=cEmail.text;
          telp=ctelp.text;
          password=cPassword.text;

     if (nama.isEmpty) {
       showSnakeBar(scaffoldState, 'Nama tidak bole kosong');

     }else if (!email.contains("@")){
    showSnakeBar(scaffoldState, 'Email tidak valid');

    }else if (telp.isEmpty ) {
            showSnakeBar(scaffoldState,
                'No telp harus diisi');

     }else if (telp.length>13 ) {
            showSnakeBar(scaffoldState,
                'No telp tidak boleh lebih dari 13 karakter');
          }else if(jk.isEmpty){
       showSnakeBar(scaffoldState,
           'jenis kelamain belum dipilih');

     } else if (password.length<4 || password.length>15 ) {
      showSnakeBar(scaffoldState,
          'Minimal password 4 karakter dan Maximal password 15 karakter');
    }else{

         kirim_data(nama,email,telp,password,jk);



     }
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
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _buildnama(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),

                      _buildTelp(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _radioButton(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 30.0,
                      ),


                      _buildRegisterbtn(),
                      _buildSignInWithText(),
                      _buildLoginBtn(),



                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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

  kirim_data(String nama,String email,String telp,String password,String jk) async{
    final responseData = await
    http.post("http://192.168.43.49/flutter_service/register.php",
        body: {"nama" : nama, "email" : email, "telp" :
        telp,"password": password,"jk":jk }
    );
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if(value == 1){
      showSnakeBar(scaffoldState,
          'Berhasil melakukan registrasi');
      cnama.text="";
      cEmail.text="";
      ctelp.text="";
      cPassword.text="";

      showSnakeBar(scaffoldState,
          'Email telah digunakan');
      //Navigator.pop(context);

    }else if (value==0){
      showSnakeBar(scaffoldState,
          'gagal melakukan pendaftaran');

    }
}
Widget  _radioButton(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text(
            "Jenis Kelamin",
            style: kLabelStyle,


          ),


      Padding(

      padding: EdgeInsets.all(1),
      child: RadioListTile(
        value:  "Pria",
        title: Text("Pria"),
        groupValue: jk,
        onChanged: (String value){
          pilihSex(value);
        },
        activeColor: Colors.white,
        selected: true,


      ),
  ),
          Padding(

            padding: EdgeInsets.all(1),
            child: RadioListTile(
              value:  "Wanita",
              title: Text("Wanita"),
              groupValue: jk,
              onChanged: (String value){
                pilihSex(value);
              },
              activeColor: Colors.white,
              selected: true,


            ),
          ),

        ],
      ),
    );
}


}