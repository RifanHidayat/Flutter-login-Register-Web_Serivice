import 'package:appservice/layout/Login.dart';
import 'package:appservice/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}
String value;
enum statusLogin { signIn, notSignIn }
class _HomeState extends State<Home> {
  statusLogin _loginStatus = statusLogin.signIn;
  String nama="";
  String email="";
  String telp="";
  String jk="";
  @override
  Widget build(BuildContext context) {
    switch (_loginStatus){
      case statusLogin.signIn:
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor:  Colors.blue[400],
      ),

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
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
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
                    vertical: 10.0,
                  ),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[



                      _IconUser(),

                      _buildNama(),
                      SizedBox(height: 40.0),
                      _buildEmail(),
                      _buildJK(),
                      _buildTelp(),
                      _buidTGLLahir(),

                      _btnLogout(),


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
      case statusLogin.notSignIn:
        return LoginScreen();
        break;

  }
  }


  Future _Logout() async {
    SharedPreferences sharedPreference = await
    SharedPreferences.getInstance();
    await sharedPreference.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    //return LoginScreen();

  }

  Future _getDataUser() async{
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();

      setState(() {
        nama = sharedPreferences.getString("nama");
        telp = sharedPreferences.getString("telp");
        email = sharedPreferences.getString("email");
        jk = sharedPreferences.getString("jk");
      });

  }
  //  @override
  void initState() {
    super.initState();
    _getDataUser();
    ceklogin();
  }
  Future ceklogin() async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    setState(() {
      int value = sharedPreferences.getInt("value");
      _loginStatus = value == 1 ? statusLogin.signIn : statusLogin.notSignIn;


    });
  }
  Widget _btnLogout(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(

          width: double.infinity,
         height: 200,

         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             Container(
               width: double.infinity,
               child: RaisedButton(
                 elevation: 5.0,
                 onPressed: ()  {
                   _Logout();
                 },
                 padding: EdgeInsets.all(15.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30.0),
                 ),
                 color:  Colors.blue[500],
                 child: Text(
                   'Logout',
                   style: TextStyle(
                     color: Colors.white,
                     letterSpacing: 1.5,
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'OpenSans',
                   ),
                 ),
               ),
             )
           ],
         ),

    )
      ],


    );
  }
  // ignore: non_constant_identifier_names
  Widget _IconUser(){
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        size: 150,
        color: Colors.black,
      ),


    );
  }
  Widget _buildNama() {
    return Container(
      alignment: Alignment.center,
      child: Column(


        children: <Widget>[

          Text(
            nama,
            style: nama_shared,
          ),
          SizedBox(height: 10.0),

        ],

      ),


    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email                  : $email",
          style: data_profile,
        ),
        SizedBox(height: 10.0),

      ],
    );
  }
  Widget _buildTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Telp                     : $telp",
          style: data_profile,
        ),
        SizedBox(height: 10.0),

      ],
    );
  }

  Widget _buildJK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Jenis Kelamin   : $jk",
          style: data_profile,
        ),
        SizedBox(height: 10.0),

      ],
    );
  }
  Widget _buidTGLLahir(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Tanggal Lahir   : $email",
          style: data_profile,
        ),
        SizedBox(height: 10.0),

      ],
    );
  }

}
