import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

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
    WorkoutItem(
        name: 'Exercise 3',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    WorkoutItem(
        name: 'Exercise 3',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    WorkoutItem(
        name: 'Exercise 4',
        durationInSeconds: 10,
        details: 'Details for Exercise 1',
        videoUrl: 'assets/workout/www.mp4'),
    WorkoutItem(
        name: 'Exercise 5',
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

  bool _isWorkoutStarted = false;

  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    _timer.cancel();
    _workoutItems.forEach((item) {
      item.controller!.dispose();
    });
    super.dispose();
  }

  void _initItemStarted() {
    _itemStarted = List<bool>.filled(_workoutItems.length, false);
    _progressValues = List<double>.filled(_workoutItems.length, 0.0);
    _secondsRemainingList = List<int>.filled(_workoutItems.length, 0);
  }

  // void _startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(oneSec, (timer) {
  //     if (!_isPaused) {
  //       setState(() {
  //         if (_secondsRemainingList[_currentIndex] > 0) {
  //           _secondsRemainingList[_currentIndex]--;
  //           _progressValues[_currentIndex] =
  //               (_workoutItems[_currentIndex].durationInSeconds! - _secondsRemainingList[_currentIndex]) /
  //                   _workoutItems[_currentIndex].durationInSeconds!;
  //         } else if (_currentIndex < _workoutItems.length - 1) {
  //           _nextItem();
  //         }
  //       });
  //     }
  //   });
  //
  //   if (!_itemStarted[_currentIndex]) {
  //     _itemStarted[_currentIndex] = true;
  //     _progressValues[_currentIndex] = 0.0;
  //     _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds!;
  //   }
  // }
  void _showRestDialog() {
    setState(() {
      _isRestDialogVisible = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rest Time'),
          content: Text('Rest for 45 seconds'),
          // Adjust as per your requirement
          actions: <Widget>[
            TextButton(
              child: Text('Skip'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _nextItem(); // Skip to the next exercise
              },
            ),
            TextButton(
              child: Text('Next Exercise Image'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate or display the next exercise's image as required
                setState(() {
                  _isRestDialogVisible = false;
                });
              },
            ),
          ],
        );
      },
    );
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
            _showRestDialog(); // Show rest dialog when exercise completes
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

  // void _nextItem() {
  //   if (_currentIndex < _workoutItems.length - 1) {
  //     _saveRemainingTime(_currentIndex);
  //     setState(() {
  //       _currentIndex++;
  //       _restoreRemainingTime(_currentIndex);
  //     });
  //     _timer.cancel(); // Cancel the current timer
  //     _startTimer(); // Start a new timer for the next exercise
  //
  //     // Calculate the scroll offset based on the index of the current exercise
  //     double scrollOffset = (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);
  //
  //     // Scroll to the calculated offset
  //     WidgetsBinding.instance!.addPostFrameCallback((_) {
  //       _scrollController.animateTo(
  //         scrollOffset,
  //         duration: Duration(milliseconds: 500),
  //         curve: Curves.easeInOut,
  //       );
  //     });
  //   }
  // }
  void _nextItem() {
    if (_currentIndex < _workoutItems.length - 1) {
      _saveRemainingTime(_currentIndex);
      setState(() {
        _currentIndex++;
        _restoreRemainingTime(_currentIndex);
      });
      _timer.cancel(); // Cancel the current timer

      // Start a new timer for the next exercise
      _startTimer();

      // Initialize and play the video for the next item
      _workoutItems[_currentIndex].controller!.play();

      // Calculate the scroll offset based on the index of the current exercise
      double scrollOffset = (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Page'),
      ),
      body: Column(
        children: [
          Visibility(
            visible: !_isWorkoutStarted,
            child: Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Expanded(
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: _workoutItems.length,
              itemBuilder: (context, index) {
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
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_workoutItems[_currentIndex].name!),
                      Text(
                          'Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
                      Text('Details: ${_workoutItems[_currentIndex].details}'),
                      if (_workoutItems[_currentIndex]
                          .controller!
                          .value
                          .isInitialized) // Check if the video is initialized
                        if (_workoutItems[_currentIndex]
                                .controller!
                                .value
                                .isInitialized &&
                            !_isRestDialogVisible)
                          Container(
                            height: 100,
                            child: AspectRatio(
                              aspectRatio: _workoutItems[_currentIndex]
                                  .controller!
                                  .value
                                  .aspectRatio,
                              child: VideoPlayer(
                                  _workoutItems[_currentIndex].controller!),
                            ),
                          ),
                      Text(_itemStarted[_currentIndex]
                          ? _secondsRemainingList[_currentIndex] > 0
                              ? 'Time Remaining: ${_secondsRemainingList[_currentIndex]} seconds'
                              : 'Completed'
                          : 'Not Started'),
                      if (_workoutItems[_currentIndex]
                          .controller!
                          .value
                          .isInitialized)
                        Text(
                            'Video Duration: ${_workoutItems[_currentIndex].controller!.value.duration.inSeconds} seconds'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _previousItem,
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: _togglePause,
                child: Text(_isPaused ? 'Resume' : 'Pause'),
              ),
              ElevatedButton(
                onPressed: _nextItem,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ListView.builder(
                itemCount: _workoutItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(_workoutItems[index].name!),
                        onTap: () {
                          _selectWorkoutItem(index);
                        },
                      ),
                      LinearProgressIndicator(
                        value: _progressValues[index],
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          index == _currentIndex
                              ? Colors.green
                              : Colors.grey, // Change color for current item
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.list),
      ),
    );
  }
}
