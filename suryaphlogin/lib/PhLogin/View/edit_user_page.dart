import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suryaphlogin/PhLogin/Authentication/authentication_bloc.dart';
import 'package:suryaphlogin/PhLogin/Model/user_details.dart';
import 'package:suryaphlogin/PhLogin/Utils/edit_text_utils.dart';
import 'package:suryaphlogin/PhLogin/Utils/validators.dart';
import 'package:suryaphlogin/PhLogin/View/home_page.dart';
import 'package:suryaphlogin/PhLogin/phlogin.dart';

class EditUserDetail extends StatefulWidget {
  @override
  _EditUserDetailState createState() => _EditUserDetailState();
}

class _EditUserDetailState extends State<EditUserDetail> {
  final _formKey = GlobalKey<FormState>();
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    userRepository = UserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserDetails userDetails = UserDetails();
    final firestoreInstance = FirebaseFirestore.instance;
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController addressLine1 = TextEditingController();
    TextEditingController addressLine2 = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController pincode = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter your details!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.firstName = firstName.text.toString();
                          print(firstName.text.toString().trim());
                        },
                        controller: firstName,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "First Name",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.account_circle),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.lastName =
                              lastName.text.toString().trim();
                        },
                        controller: lastName,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                          userDetails.lastName = data;
                        },
                        labelValue: "Last Name",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.account_circle),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.email = email.text.toString().trim();
                        },
                        controller: email,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "Personal Email",
                        hintValue: "abc@hello.com",
                        validator: (value) {
                          validateEmail(value);
                        },
                        icon: Icons.email),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.addressLine1 =
                              addressLine1.text.toString().trim();
                        },
                        controller: addressLine1,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "Address Line 1",
                        hintValue: "abc xyz street",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.place),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.addressLine2 =
                              addressLine2.text.toString().trim();
                        },
                        controller: addressLine2,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "Address Line 2",
                        hintValue: "Near xbc ",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.place),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.city = city.text.toString().trim();
                        },
                        controller: city,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "City",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.place),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.state = state.text.toString().trim();
                        },
                        controller: state,
                        action: TextInputAction.next,
                        onsubmit: (data) {
                          FocusScope.of(context).nextFocus();
                        },
                        labelValue: "State",
                        hintValue: "Tamil Nadu",
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.place),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: EditTextUtils().getCustomEditTextArea(
                        onchanged: (value) {
                          userDetails.pincode = int.parse(pincode.text.trim());
                        },
                        controller: pincode,
                        action: TextInputAction.go,
                        onsubmit: (data) async {
                          FocusScope.of(context).unfocus();
                          print('hello');
                          // await firestoreInstance
                          //     .collection("users")
                          //     .doc(
                          //         FirebaseAuth.instance.currentUser.phoneNumber)
                          //     .set(
                          //   {
                          //     "firstname": userDetails.firstName,
                          //     "lastname": userDetails.lastName,
                          //     "email": userDetails.email,
                          //     "addressone": userDetails.addressLine1,
                          //     "addresstwo": userDetails.addressLine2,
                          //     "city": userDetails.city,
                          //     "state": userDetails.state,
                          //     "pincode": userDetails.pincode,
                          //     "phone":
                          //         FirebaseAuth.instance.currentUser.phoneNumber
                          //   },
                          // ).whenComplete(() {
                          //   // authenticationBloc.add(LoggedIn(
                          //   //     token: FirebaseAuth
                          //   //         .instance.currentUser.refreshToken));

                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Homepage(
                          //           //user: user,
                          //           ),
                          //     ),
                          //   );
                          //   print('im done');
                          // }).catchError((error) {
                          //   print(error);
                          // });
                        },
                        labelValue: "Pincode",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          validateMinLength(value, length: 3);
                        },
                        icon: Icons.pin_drop),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: RaisedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  Text('Processing Data')
                                ],
                              ),
                            ),
                          );
                          await firestoreInstance
                              .collection("users")
                              .doc(
                                  FirebaseAuth.instance.currentUser.phoneNumber)
                              .set(
                            {
                              "firstname": userDetails.firstName,
                              "lastname": userDetails.lastName,
                              "email": userDetails.email,
                              "addressone": userDetails.addressLine1,
                              "addresstwo": userDetails.addressLine2,
                              "city": userDetails.city,
                              "state": userDetails.state,
                              "pincode": userDetails.pincode,
                              "phone":
                                  FirebaseAuth.instance.currentUser.phoneNumber,
                              "registered": true
                            },
                          ).whenComplete(() {
                            // authenticationBloc.add(LoggedIn(
                            //     token: FirebaseAuth
                            //         .instance.currentUser.refreshToken));

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(
                                    //user: user,
                                    ),
                              ),
                            );
                            print('im done');
                          }).catchError((error) {
                            print(error);
                          });

                          // If the form is valid, display a Snackbar.

                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
