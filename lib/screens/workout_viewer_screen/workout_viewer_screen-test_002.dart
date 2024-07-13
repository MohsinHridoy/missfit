import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:miss_fit/screens/completechallengescreen/complete_challenge_screen.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../common_utils.dart';

class RestPage extends StatefulWidget {
  final VoidCallback onSkip;
  final String? videoUrl;
  final int? index;
  final int? totalListLength;

  RestPage({
    required this.onSkip,
    this.videoUrl,
    this.index,
    this.totalListLength,
  });

  @override
  _RestPageState createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  int _remainingSeconds = 45;
  late Timer _timer;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _initializeVideo();
  }

  @override
  void dispose() {
    _timer.cancel();
    _videoController.dispose();
    super.dispose();
  }

  void _initializeVideo() {
    _videoController = VideoPlayerController.asset(widget.videoUrl!);
    _videoController.initialize().then((_) {
      setState(() {
        _videoController.play();
      });
    }).catchError((error) {
      print('Video initialization error: $error');
      // Handle initialization error here
    });
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          // Timer reaches 0, trigger onSkip action
          widget.onSkip();
          Navigator.pop(context, true);
        }
      });
    });
  }

  void _incrementTime(int incrementSeconds) {
    setState(() {
      _remainingSeconds += incrementSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    String timerText =
        '${(_remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 320,
              child: Text(
                'Repos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 320,
              child: Text(
                timerText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 48,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _incrementTime(20);
                    },
                    child: Container(
                      width: 85,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '+20s',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 14,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Invoke the onSkip callback to notify the parent widget
                      widget.onSkip();
                      Navigator.pop(context, true); // Pop with skip result
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: 85,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Sauter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            if (widget.videoUrl != null && _videoController.value.isInitialized)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Suivante  ${widget.index}/${widget.totalListLength}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 14,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 320,
                      child: Text(
                        '20x Split snatches',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 20,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *
                        0.5, // Set height to 60% of screen height
                    decoration: ShapeDecoration(
                      color: Color(0xFF6B7280),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      child: AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: VideoPlayer(_videoController),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class WorkoutItem {
  String? name;
  int? durationInSeconds;
  String? details;
  String? videoUrl; // Add a video URL field
  VideoPlayerController? controller;

  WorkoutItem(
      {this.name, this.durationInSeconds, this.details, this.videoUrl}) {
    controller = VideoPlayerController.asset(videoUrl!)
      ..initialize().then((_) {
        // Ensure the listener updates to display the video when initialized
        // controller!.play();
      });
  }
}

class WorkoutPage003 extends StatefulWidget {
  @override
  _WorkoutPage003State createState() => _WorkoutPage003State();
}

class _WorkoutPage003State extends State<WorkoutPage003> {
  List<WorkoutItem> _workoutItems = [
    WorkoutItem(
        name: 'Exercise 1',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    WorkoutItem(
        name: 'Exercise 2',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    WorkoutItem(
        name: 'Exercise 3',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    // Add other items similarly...
  ];
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);

  List<bool> _itemStarted = [];
  List<double> _progressValues = [];
  List<int> _secondsRemainingList = [];
  int _currentIndex = 0;
  bool _isPaused = false;
  late Timer _timer;
  bool _isRestDialogVisible = false;
  bool _exerciseCompleted = false; // Track if the current exercise is completed

  bool _isWorkoutStarted = false;
  String selectedReason = '';

  @override
  void initState() {
    super.initState();
    // _startCountdown();
    _initItemStarted(); // Initialize item flags and timers
    _startTimer();
    // Start the timer after 8 seconds
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isWorkoutStarted = true;
        _workoutItems[_currentIndex].controller!.play();

        print('Workout items initialized: $_workoutItems');

        print('Timer started.');
      });
    });

    // for (int i = 1; i < _workoutItems.length; i++) {
    //   _workoutItems[i].controller!.initialize().then((_) {
    //     // Ensure the listener updates to display the video when initialized
    //     _workoutItems[i].controller!.play();
    //   });
    // }
  }

  void _initItemStarted() {
    _itemStarted = List<bool>.filled(_workoutItems.length, false);
    _progressValues = List<double>.filled(_workoutItems.length, 0.0);
    _secondsRemainingList = List<int>.filled(_workoutItems.length, 0);
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (!_isPaused) {
        setState(() {
          if (_secondsRemainingList[_currentIndex] > 0) {
            _secondsRemainingList[_currentIndex]--;
            _progressValues[_currentIndex] =
                (_workoutItems[_currentIndex].durationInSeconds! -
                        _secondsRemainingList[_currentIndex]) /
                    _workoutItems[_currentIndex].durationInSeconds!;
          } else if (_currentIndex < _workoutItems.length - 1) {
            _nextItem();
          }
        });
      }
    });

    if (!_itemStarted[_currentIndex]) {
      _itemStarted[_currentIndex] = true;
      _progressValues[_currentIndex] = 0.0;
      _secondsRemainingList[_currentIndex] =
          _workoutItems[_currentIndex].durationInSeconds!;
    }
  }

  void _nextItem() async {
    if (_currentIndex < _workoutItems.length - 1) {
      _saveRemainingTime(_currentIndex);

      setState(() {
        _currentIndex++;
        _restoreRemainingTime(_currentIndex);
      });

      _timer.cancel(); // Cancel the current timer

      if (_workoutItems[_currentIndex]
          .name!
          .toLowerCase()
          .contains('exercise')) {
        // Navigate to rest page
        bool skipRest = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RestPage(
            index: _currentIndex + 1,
            videoUrl: _workoutItems[_currentIndex].videoUrl,
            totalListLength: _workoutItems.length,
            onSkip: () {
              // Perform skip action if needed
            },
          ),
        ));

        if (skipRest) {
          // Skip rest logic here if needed
        }
      }

      // Start video immediately for non-rest items
      _workoutItems[_currentIndex].controller!.play();
      _startTimer(); // Start timer for the next exercise

      // Calculate the scroll offset based on the index of the current exercise
      double scrollOffset =
          (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

      // Scroll to the calculated offset
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollController.animateTo(
          scrollOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else {
      // Handle end of workout or last exercise completion here
      print('Workout completed!');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CompleteChallengeScreen(),
      ));
    }
  }

  void _nextItemButton() async {
    if (_currentIndex < _workoutItems.length - 1) {
      _saveRemainingTime(_currentIndex);

      setState(() {
        _currentIndex++;
        _restoreRemainingTime(_currentIndex);
      });

      _timer.cancel(); // Cancel the current timer

      // Start video immediately for non-rest items
      _workoutItems[_currentIndex].controller!.play();
      _startTimer(); // Start timer for the next exercise

      // Calculate the scroll offset based on the index of the current exercise
      double scrollOffset =
          (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

      // Scroll to the calculated offset
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollController.animateTo(
          scrollOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else {
      // Handle end of workout or last exercise completion here
      print('Workout completed!');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CompleteChallengeScreen(),
      ));
    }
  }

  void _previousItem() {
    if (_currentIndex > 0) {
      _saveRemainingTime(_currentIndex);
      setState(() {
        _currentIndex--;
        _restoreRemainingTime(_currentIndex);
      });
      _timer.cancel(); // Cancel the current timer
      _startTimer(); // Start a new timer for the previous exercise

      // Calculate the scroll offset based on the index of the current exercise
      double scrollOffset = (_currentIndex) *
          ((MediaQuery.of(context).size.width / 3.6) + (2 * 8.0) + (2 * 8.0));

      // Scroll to the calculated offset
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollController.animateTo(
          scrollOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _saveRemainingTime(int index) {
    _secondsRemainingList[index] = _secondsRemainingList[_currentIndex];
  }

  void _restoreRemainingTime(int index) {
    _secondsRemainingList[_currentIndex] = _secondsRemainingList[index];
  }

  void _togglePause() {
    setState(() {
      if (_isRestDialogVisible) {
        // If rest dialog is visible, pause the video
        _workoutItems[_currentIndex].controller!.pause();
      } else {
        // Otherwise, toggle play/pause based on _isPaused
        _isPaused = !_isPaused;
        if (_isPaused) {
          _workoutItems[_currentIndex].controller!.pause();
        } else {
          _workoutItems[_currentIndex].controller!.play();
        }
      }
    });
  }

  void _selectWorkoutItem(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pop(context); // Close the bottom sheet after item selection
    });

    // Calculate the scroll offset based on the selected index
    double scrollOffset =
        (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

    // Scroll to the calculated offset
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    if (!_itemStarted[_currentIndex]) {
      _itemStarted[_currentIndex] = true;
      _secondsRemainingList[_currentIndex] =
          _workoutItems[_currentIndex].durationInSeconds!;
      _progressValues[_currentIndex] = 0.0;
    }

    // Restart the timer for the selected exercise
    _timer.cancel();
    _startTimer();

    // Start video immediately for non-rest items
    if (!_workoutItems[_currentIndex].name!.toLowerCase().contains('rest')) {
      _workoutItems[_currentIndex].controller!.play();
    }
  }

  int _countdownSeconds = 5;
  int _clickCount = 0;
  Timer? _timer1;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer1 = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_countdownSeconds > 0) {
          _countdownSeconds--;
        } else {
          // When countdown reaches 0, increment click count

          _startTimer();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer1!.cancel();
    _workoutItems.forEach((item) {
      item.controller!.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            height: 20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: List.generate(_workoutItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: LinearProgressIndicator(
                        value: _progressValues[index],
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          index == _currentIndex
                              ? Colors.green
                              : Colors.grey, // Change color for current item
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    // Adjust the radius as needed
                                    topRight: Radius.circular(
                                        30), // Adjust the radius as needed
                                  ),
                                  color: Colors
                                      .white, // Background color of the container
                                  // Add other decoration properties as needed (e.g., boxShadow, border)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 20, bottom: 10),
                                          child: Image.asset(
                                            "assets/workout/icon_cross_button.png",
                                            scale: 1.7,
                                          ),
                                        )),
                                    Text(
                                      'Why give up?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1E293B),
                                        fontSize: 24,
                                        fontFamily: 'Archivo-SemiBold',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'This will help us know you better and provide the workout that is more suitable for you.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF475569),
                                          fontSize: 16,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedReason =
                                              'Don’t know how to do it';
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0, top: 20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 48,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color: selectedReason ==
                                                        'Don’t know how to do it'
                                                    ? Color(0xFFFFA142)
                                                    : Color(0xFFE5E7EB),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Image.asset(
                                                  "assets/workout/icon_giveup_1.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 185,
                                                child: Text(
                                                  'Don’t know how to do it',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        'Archivo-Regular',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.09,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Add spacing between items
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedReason = 'Too hard';
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0, top: 10.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 48,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color:
                                                    selectedReason == 'Too hard'
                                                        ? Color(0xFFFFA142)
                                                        : Color(0xFFE5E7EB),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Image.asset(
                                                  "assets/workout/icon_giveup2.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 185,
                                                child: Text(
                                                  'Too hard',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.09,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedReason =
                                              'I’m just roaming around';
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0, top: 10.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 48,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color: selectedReason ==
                                                        'I’m just roaming around'
                                                    ? Color(0xFFFFA142)
                                                    : Color(0xFFE5E7EB),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Image.asset(
                                                  "assets/workout/icon_giveup3.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 185,
                                                child: Text(
                                                  'I’m just roaming around',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.09,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          navigateToNextPage(context,DashBoard()) ;                                       },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 52,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.40,
                                                  color: Color(0xFFFF4343)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'I Want To Quit',
                                              style: TextStyle(
                                                color: Color(0xFFFF4343),
                                                fontSize: 16,
                                                fontFamily: 'Archivo-SemiBold',
                                                fontWeight: FontWeight.w600,
                                                height: 0.09,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/workout/icon_cross_button.png",
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Calorie Torcher',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 14,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          '1/12',
                          style: TextStyle(
                            color: Color(0xFF66758C),
                            fontSize: 14,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                      ),
                      Text(
                        '05:23',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 14,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(_workoutItems[_currentIndex].name!),
                // Text(
                //     'Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
                // Text('Details: ${_workoutItems[_currentIndex].details}'),
                // if (_workoutItems[_currentIndex]
                //     .controller!
                //     .value
                //     .isInitialized) // Check if the video is initialized
                //   if (_workoutItems[_currentIndex]
                //           .controller!
                //           .value
                //           .isInitialized &&
                //       !_isRestDialogVisible)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: VideoPlayer(_workoutItems[_currentIndex].controller!),
                ),
                // Text(_itemStarted[_currentIndex]
                //     ? _secondsRemainingList[_currentIndex] > 0
                //     ? 'Time Remaining: ${_secondsRemainingList[_currentIndex]} seconds'
                //     : 'Completed'
                //     : 'Not Started'),
                // if (_workoutItems[_currentIndex]
                //     .controller!
                //     .value
                //     .isInitialized)
                //   Text(
                //       'Video Duration: ${_workoutItems[_currentIndex].controller!.value.duration.inSeconds} seconds'),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 320,
            child: Text(
              'Jumping Jacks Abdominal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 18,
                fontFamily: 'Archivo-Medium',
                fontWeight: FontWeight.w500,
                height: 0.08,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            '02:0${_secondsRemainingList[_currentIndex]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFE88E32),
              fontSize: 24,
              fontFamily: 'Archivo-SemiBold',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    _previousItem();
                  },
                  child: Image.asset(
                    "assets/workout/icon_previous.png",
                    width: 24,
                    height: 24,
                  )),

              // ElevatedButton(
              //   onPressed: ,
              //   child: Text('Previous'),
              // ),

              GestureDetector(
                onTap: () {
                  _togglePause();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF4343),
                      shape: OvalBorder(),
                    ),
                    child: _isPaused
                        ? Center(
                            child: Image.asset(
                            "assets/workout/icon_play.png",
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ))
                        : Center(
                            child: Image.asset(
                            "assets/workout/icon_pause.png",
                            width: 24,
                            height: 24,
                          )),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    _nextItemButton();
                  },
                  child: Image.asset(
                    "assets/workout/icon_next.png",
                    width: 24,
                    height: 24,
                  )),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Color(0xFFF6F6F6),
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                "assets/workout/icon_dropdown.png",
                                width: 24,
                                height: 24,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 12, bottom: 30),
                          child: SizedBox(
                            width: 320,
                            child: Text(
                            "Liste d'entraînement",
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 20,
                                fontFamily: 'Kanit-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.07,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _workoutItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _playVideo(index);
                                  },
                                  child: WorkoutListItem(
                                    title: _workoutItems[index].name!,
                                    duration:
                                        'Duration: ${_workoutItems[index].durationInSeconds} seconds',
                                    progressValue: _progressValues[index],
                                    isCurrentItem: _currentIndex == index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                ),
                child: Center(
                    child: Image.asset(
                  "assets/workout/icon_uparrow.png",
                  width: 24,
                  height: 24,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _playVideo(int index) {
    setState(() {
      // Pause current video if playing
      _workoutItems[_currentIndex].controller!.pause();
      // Update current index
      _currentIndex = index;
      // Play video of tapped item
      _workoutItems[_currentIndex].controller!.play();
      // Close bottom sheet after item selection
      Navigator.pop(context);
    });

    // Calculate the scroll offset based on the selected index
    double scrollOffset =
        (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

    // Scroll to the calculated offset
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    if (!_itemStarted[_currentIndex]) {
      _itemStarted[_currentIndex] = true;
      _secondsRemainingList[_currentIndex] =
          _workoutItems[_currentIndex].durationInSeconds!;
      _progressValues[_currentIndex] = 0.0;
    }

    // Restart the timer for the selected exercise
    _timer.cancel();
    _startTimer();

    // Start video immediately for non-rest items
    if (!_workoutItems[_currentIndex].name!.toLowerCase().contains('rest')) {
      _workoutItems[_currentIndex].controller!.play();
    }
  }
}

class WorkoutListItem extends StatelessWidget {
  final String title;
  final String duration;
  final double progressValue; // Progress value between 0.0 to 1.0
  final bool
      isCurrentItem; // Flag to determine if it's the current workout item

  const WorkoutListItem({
    Key? key,
    required this.title,
    required this.duration,
    required this.progressValue,
    required this.isCurrentItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 71,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width *
                  progressValue, // Adjusted based on progress
              height: 71,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: progressValue==0?Colors.transparent:Colors.green.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 13,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: progressValue==0?Color(0xFF334155):Colors.white,
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    duration,
                    style: TextStyle(
                      color:progressValue==0?Color(0xFF334155): Colors.white,
                      fontSize: 12,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (progressValue == 0)
            Positioned(
                top: 25,
                right: 15,
                child: Image.asset(
                  "assets/workout/icon_play.png",
                  width: 24,
                  height: 24,
                )),
        ],
      ),
    );
  }
}



class VideoThumbnailView extends StatefulWidget {
  final String videoPath;

  VideoThumbnailView({required this.videoPath});

  @override
  _VideoThumbnailViewState createState() => _VideoThumbnailViewState();
}

class _VideoThumbnailViewState extends State<VideoThumbnailView> {
  Uint8List? _thumbnailBytes;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: widget.videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, you can change this
      quality: 25,
    );

    setState(() {
      _thumbnailBytes = thumbnailBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _thumbnailBytes != null
        ? Image.memory(_thumbnailBytes!)
        : Center(child: CircularProgressIndicator());
  }
}















class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int _timerDuration = 8; // Initial timer duration in seconds
  late Timer _timer;
  Uint8List? thumbnailBytes;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();

    startTimer();
  }
  Future<void> _generateThumbnail() async {
     thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: 'assets/workout/www.mp4',
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, you can change this
      quality: 25,
    );

    setState(() {
      thumbnailBytes = thumbnailBytes;
    });
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_timerDuration < 1) {
          timer.cancel();
          navigateToNextPage1();
        } else {
          _timerDuration--;
        }
      });
    });
  }

  void navigateToNextPage1() {
    // Navigate to the next page when timer reaches 0
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           WorkoutPage003()), // Replace NextPage with your actual next page widget
    // );

    navigateToNextPage(context,WorkoutPage003());
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          VideoThumbnailView(
            videoPath: 'assets/workout/www.mp4', // Your video path
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: ShapeDecoration(
                color: Color(0xFFFF4343).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6600000262260437),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                ),
                SizedBox(
                  width: 320,
                  child: Text(
                    'Prêt à partir',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 35),

                SizedBox(
                  width: 320,
                  child: Text(
                    '$_timerDuration ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE88E32),
                      fontSize: 66,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  'Exercices 1/12',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF66758C),
                    fontSize: 14,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
                SizedBox(height: 30),

                SizedBox(
                  width: 320,
                  child: Text(
                    'Jumping Jacks abdominaux',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     // Optionally, you can implement a button to manually navigate to the next page
                //     navigateToNextPage();
                //   },
                //   child: Text('Skip Challenge'), // Text for skipping the challenge
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
