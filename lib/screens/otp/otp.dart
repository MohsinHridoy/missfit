import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
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
      setState(() {
        isVisible = !isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: 30,
        width: 2,
        color:Color(0xFFFFA142),
      ),
    );
  }
}

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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

  @override
  void initState() {
    super.initState();
    startTimer();

    // Set up focus listeners to move to the next field when one is filled
    _controller1.addListener(() {
      if (_controller1.text.isNotEmpty) {
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
      if (value == 0) {
        // _removeLastCharacter();
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

  void _updateFocusedTextField(int value) {
    if (_focusNode1.hasFocus) {
      _controller1.text = value.toString();
      value1 = 1;
      setState(() {});
      FocusScope.of(context).requestFocus(_focusNode2);
    } else if (_focusNode2.hasFocus) {
      _controller2.text = value.toString();
      value1 = 2;
      setState(() {});
      FocusScope.of(context).requestFocus(_focusNode3);
    } else if (_focusNode3.hasFocus) {
      value1 = 3;
      setState(() {});

      _controller3.text = value.toString();
      FocusScope.of(context).requestFocus(_focusNode4);
    } else if (_focusNode4.hasFocus) {
      value1 = 4;
      setState(() {});

      _controller4.text = value.toString();
      FocusScope.of(context).requestFocus(_focusNode4);
    }
  }

  OutlineInputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  );

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF18181B),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 274,
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                          height: 1.05,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
                    child: Text(
                      'We sent verification code to -',
                      style: TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 16,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        height: 1.09,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'helen83@gmail.com',
                    style: TextStyle(
                      color: Color(0xFFFFA142),
                      fontSize: 16,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w400,
                      height: 1.09,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 39.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 66,
                          height: 64,
                          decoration: ShapeDecoration(
                            // borderRadius: BorderRadius.circular(8.0),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 1, color: Color(0xFF6B7280)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              left:25,
                              right:25,
                              top: 5,
                              child: TextFormField(
                                controller: _controller1,
                                focusNode: _focusNode1,
                                readOnly: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
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
                            if (value1 == 0) Center(child: CustomDotIndicator())
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 64,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 1, color: Color(0xFF6B7280)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              left:25,
                              right:25,
                              top: 5,
                              child: TextFormField(
                                controller: _controller2,
                                readOnly: true,
                                focusNode: _focusNode2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  // labelText: 'Input 2',
                                  //                               border: _defaultBorder,
                                  border: InputBorder.none,
                                  // focusedBorder: _focusedBorder,
                                ),
                              ),
                            ),
                            if (value1 == 1) Center(child: CustomDotIndicator()),
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 64,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 1, color: Color(0xFF6B7280)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              left:25,
                              right:25,
                              top: 5,
                              child: TextFormField(
                                controller: _controller3,
                                focusNode: _focusNode3,
                                readOnly: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  // labelText: 'Input 3',
                                  border: InputBorder.none,
                                  // focusedBorder: _focusedBorder,
                                ),
                              ),
                            ),
                            if (value1 == 2) Center(child: CustomDotIndicator()),
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 64,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 1, color: Color(0xFF6B7280)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              left:25,
                              right:25,
                              top: 5,
                              child: TextFormField(
                                controller: _controller4,
                                focusNode: _focusNode4,
                                readOnly: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  // labelText: 'Input 4',
                                  border: InputBorder.none,
                                  // focusedBorder: _focusedBorder,
                                ),
                              ),
                            ),
                            if (value1 == 3) Center(child: CustomDotIndicator()),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 186,
                          child: Text(
                            'Didn’t received any code?',
                            style: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              height: 1.09,
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
                              fontFamily: 'Archivo',
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
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            height: 1.09,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 77.0,left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registration()),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 44,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF1F5F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Verify',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 14,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFF020617),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 230,
                          color: Color(0xFF020617),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    // crossAxisSpacing: 2.0,
                                    // mainAxisSpacing: 2.0,
                                    childAspectRatio: 2),
                            // shrinkWrap: true,
                            itemCount: buttonNumbers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () =>
                                    _appendToInput(buttonNumbers[index]),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Opacity(
                                      opacity: 0.9,
                                      child: Text(
                                        buttonNumbers[index].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFF020617),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 55.0,bottom: 30),
                              //   child: Image.asset(
                              //     "assets/intro/login/dot.png",
                              //     width: 18,
                              //     height: 15,
                              //   ),
                              // ),
                              SizedBox(
                                width: 1,
                              ),
                              // ElevatedButton(
                              //   style: ButtonStyle(
                              //     // backgroundColor: Colors.white,
                              //   ),
                              //   onPressed: () {
                              //     setState(() {
                              //       _textController.text =
                              //           _textController.text + 0.toString();
                              //     });
                              //   },
                              //   child: Text("0"),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 75.0, right: 45.0, bottom: 30),
                                child: Opacity(
                                  opacity: 0.9,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 16.0,right: 45),
                              //   child: IconButton(
                              //     icon: Icon(Icons.arrow_back),
                              //     onPressed: () {
                              //       _removeLastCharacter();
                              //     },
                              //   ),
                              // )
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 30.0,right: 55),
                              //   child: Image.asset(
                              //     "assets/intro/login/img_7.png",
                              //     width: 20,
                              //     height: 15,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
