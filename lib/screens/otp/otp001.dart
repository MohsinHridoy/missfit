import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/registration/registration.dart';

class CustomDotIndicator extends StatefulWidget {
  @override
  State<CustomDotIndicator> createState() => _CustomDotIndicatorState();
}

class _CustomDotIndicatorState extends State<CustomDotIndicator> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    // Create a timer that toggles the visibility every 1 second
    Timer.periodic(Duration(seconds: 1), (timer) {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: 25,
        width: 2,
        color: Color(0xFFFFA142),
      ),
    );
  }
}

class Otp001 extends StatefulWidget {
  final String email;

  const Otp001({super.key, required this.email});

  @override
  State<Otp001> createState() => _Otp001State();
}

class _Otp001State extends State<Otp001> {
  TextEditingController _textController = TextEditingController();
  bool visibleCorrectMark = false;
  bool visibleListItem = false;
  List<int> buttonNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  int _secondsRemaining = 57;
  late Timer _timer;
  bool _firstTextFieldFoucs = false;

  String tvSendCodeStatus = "You can request otp code in";
  String tvDidntRcvCodeStatus = "Didn’t received any code?";

  @override
  void initState() {
    super.initState();
    startTimer();
    // _focusNode1.addListener(() {
    //   _firstTextFieldFoucs = _focusNode1.hasFocus;
    //
    // });
    // Set up focus listeners to move to the next field when one is filled
    _controller1.addListener(() {
      if (_controller1.text.isNotEmpty) {
        // _firstTextFieldFoucs = _focusNode1.hasFocus;
        _firstTextFieldFoucs = true;
        FocusScope.of(context).requestFocus(_focusNode2);
      }
    });

    _controller2.addListener(() {
      if (_controller2.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(_focusNode3);
      }
    });

    _controller3.addListener(() {
      if (_controller3.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(_focusNode4);
      }
    });
  }

  void _appendToInput(int value) {
    if (_textController.text.length < 10) {
      if (value < 0) {
        // _removeLastCharacter();
        _updateFocusedTextField(0);
      } else {
        _updateFocusedTextField(value);
      }
    }
    if (_textController.text.length > 9) {
      setState(() {
        visibleCorrectMark = true;
        print(_textController.text);
      });
    }
  }

  var value1 = 0;
  var value2 = 0;

  void _updateFocusedTextField(int value) {
    if (_focusNode1.hasFocus) {
      _controller1.text = value.toString();
      value1 = 1;
      value2 = 0;

      FocusScope.of(context).requestFocus(_focusNode2);
      setState(() {});
    } else if (_focusNode2.hasFocus) {
      _controller2.text = value.toString();
      value1 = 2;
      value2 = 0;

      FocusScope.of(context).requestFocus(_focusNode3);
      setState(() {});
    } else if (_focusNode3.hasFocus) {
      value1 = 3;
      value2 = 0;

      _controller3.text = value.toString();
      FocusScope.of(context).requestFocus(_focusNode4);
      setState(() {});
    } else if (_focusNode4.hasFocus) {
      value1 = 4;
      value2 = 0;

      _controller4.text = value.toString();
      FocusScope.of(context).requestFocus(_focusNode4);
      setState(() {});
    }
  }

  OutlineInputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  );

  bool _showResendButton = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _timer.cancel();
          _showResendButton = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void resendCode() {
    setState(() {
      _secondsRemaining = 57; // Reset timer
      _showResendButton = false; // Hide the resend button
      startTimer(); // Restart timer
    });
  }

  void _removeLastCharacter() {
    if (_controller4.text.isNotEmpty) {
      setState(() {
        value2 = 1;
        _controller4.text = ''; // Clear the last text field if it has text
        FocusScope.of(context)
            .requestFocus(_focusNode3); // Move focus to the previous field
      });
    } else if (_controller3.text.isNotEmpty) {
      setState(() {
        value2 = 2;

        _controller3.text = '';
        FocusScope.of(context).requestFocus(_focusNode2);
      });
    } else if (_controller2.text.isNotEmpty) {
      setState(() {
        value2 = 3;

        _controller2.text = '';
        FocusScope.of(context).requestFocus(_focusNode1);
      });
    } else if (_controller1.text.isNotEmpty) {
      setState(() {
        value2 = 4;
        _firstTextFieldFoucs = false;

        _controller1.text = '';
        FocusScope.of(context).requestFocus(_focusNode1);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 125,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 20),
                  child: SizedBox(
                    width: 274,
                    child: Text(
                      'OTP Verification',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 24,
                        fontFamily: 'Kanit-Medium',
                        fontWeight: FontWeight.w600,
                        height: 0.05,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: 320,
                    child: Text(
                      'We sent verification code to -',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Regular',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        widget.email,
                        style: TextStyle(
                          color: Color(0xFFE88E32),
                          fontSize: 16,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          height: 1.09,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3),
                          child: Image.asset(
                            "assets/otp/icon_edit.png",
                            scale: 1.7,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 56,
                        height: 52,
                        decoration: ShapeDecoration(
                          // borderRadius: BorderRadius.circular(8.0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: _firstTextFieldFoucs
                                    ? Color(0xFF6B7280).withOpacity(0.9)
                                    : Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 20,
                            right: 10,
                            top: 1,
                            child: TextFormField(
                              controller: _controller1,
                              focusNode: _focusNode1,
                              readOnly: true,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 20,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.09,
                              ),
                              autofocus: true,
                              // Set autofocus to true for the first field
                              decoration: InputDecoration(
                                // labelText: 'Input 1',
                                border: InputBorder.none,
                                // focusedBorder: _focusedBorder,
                              ),
                            ),
                          ),
                          if (value1 == 0 || value2 == 4)
                            Center(child: CustomDotIndicator())
                        ]),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 56,
                        height: 52,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: _firstTextFieldFoucs
                                    ? Color(0xFF6B7280).withOpacity(0.9)
                                    : Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 20,
                            right: 10,
                            top: 1,
                            child: TextFormField(
                              controller: _controller2,
                              readOnly: true,
                              focusNode: _focusNode2,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 20,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.09,
                              ),
                              decoration: InputDecoration(
                                // labelText: 'Input 2',
                                //                               border: _defaultBorder,
                                border: InputBorder.none,
                                // focusedBorder: _focusedBorder,
                              ),
                            ),
                          ),
                          if (value1 == 1 || value2 == 3)
                            Center(child: CustomDotIndicator()),
                        ]),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 56,
                        height: 52,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: _firstTextFieldFoucs
                                    ? Color(0xFF6B7280).withOpacity(0.9)
                                    : Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 20,
                            right: 10,
                            top: 1,
                            child: TextFormField(
                              controller: _controller3,
                              focusNode: _focusNode3,
                              readOnly: true,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 20,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.09,
                              ),
                              decoration: InputDecoration(
                                // labelText: 'Input 3',
                                border: InputBorder.none,
                                // focusedBorder: _focusedBorder,
                              ),
                            ),
                          ),
                          if (value1 == 2 || value2 == 2)
                            Center(child: CustomDotIndicator()),
                        ]),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 56,
                        height: 52,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: _firstTextFieldFoucs
                                    ? Color(0xFF6B7280).withOpacity(0.9)
                                    : Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 20,
                            right: 10,
                            top: 1,
                            child: TextFormField(
                              controller: _controller4,
                              focusNode: _focusNode4,
                              readOnly: true,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 20,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.09,
                              ),
                              decoration: InputDecoration(
                                // labelText: 'Input 4',
                                border: InputBorder.none,
                                // focusedBorder: _focusedBorder,
                              ),
                            ),
                          ),
                          if (value1 == 3 || value2 == 1)
                            Center(child: CustomDotIndicator()),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          _showResendButton
                              ? tvDidntRcvCodeStatus
                              : tvSendCodeStatus,
                          // 'Didn’t received any code?',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _showResendButton ? resendCode : null,
                        child: Text(
                          _showResendButton ? 'Resend' : '',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFFF4343),
                            fontSize: 16,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w500,
                            height: 1.09,
                          ),
                        ),
                      ),
                      Text(
                        _secondsRemaining == 0
                            ? ''
                            : '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFFFA142),
                          fontSize: 16,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1.09,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: _controller4.text.isNotEmpty
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Registration()),
                    );
                  }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 0, vertical: 0),
                      decoration: ShapeDecoration(
                        color: _controller4.text.isNotEmpty
                            ? Color(0xFFFF4343)
                            : Color(0xFFD1D5DB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            color: _controller4.text.isNotEmpty
                                ? Colors.white
                                : Color(0xFF334155),
                            // color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40, // Adjust the percentage as needed
                width: MediaQuery.of(context).size.width,
              
                decoration: ShapeDecoration(
                  color: Color(0xFFF9FAFB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x11121315),
                      blurRadius: 15,
                      offset: Offset(0, -1),
                      spreadRadius: -3,
                    )
                  ],
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: buttonNumbers.length + 3,
                    // Plus 3 for Menu, 0, and Back buttons
                    itemBuilder: (BuildContext context, int index) {
                      if (index < buttonNumbers.length) {
                        // Render numeric buttons
                        return GestureDetector(
                          onTap: () => _appendToInput(buttonNumbers[index]),
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Color(0xFFF9FAFB),
                            child: Center(
                              child: Opacity(
                                opacity: 0.9,
                                child: Text(
                                  buttonNumbers[index].toString(),
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 22,
                                    fontFamily: 'Inter-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Render Menu, 0, and Back buttons
                        return GestureDetector(
                          onTap: () {
                            if (index == buttonNumbers.length) {
                              // Handle Menu button
                            } else if (index == buttonNumbers.length + 1) {
                              // Handle 0 button
                              _appendToInput(0);
                            } else if (index == buttonNumbers.length + 2) {
                              // Handle Back button
                              _removeLastCharacter();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: index == buttonNumbers.length
                                  ? Image.asset(
                                "assets/otp/icon_menu.png",
                                width: 20,
                                height: 20,
                              )
                                  : index == buttonNumbers.length + 1
                                  ? Opacity(
                                opacity: 0.9,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                                  : Image.asset(
                                "assets/otp/icon_back.png",
                                width: 20,
                                height: 35,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
