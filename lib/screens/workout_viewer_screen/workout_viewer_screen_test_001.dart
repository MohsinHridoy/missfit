import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/workout/www.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        _controller!.play();

        setState(() {});
      });
    _controller?.setLooping(true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Asset Video'),
      ),
      body: Column(
        children: [
          Center(
            child: _controller?.value.isInitialized ?? false
                ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
                : CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller?.value.isPlaying ?? false) {
              _controller?.pause();
            } else {
              _controller?.play();
            }
          });
        },
        child: Icon(
          _controller?.value.isPlaying ?? false ? Icons.pause : Icons.play_arrow,
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

  WorkoutItem({this.name, this.durationInSeconds, this.details, this.videoUrl}) {
    controller = VideoPlayerController.asset(videoUrl!)
      ..initialize().then((_) {
        // Ensure the listener updates to display the video when initialized
        controller!.play();
      });
  }
}

class WorkoutPage001 extends StatefulWidget {
  @override
  _WorkoutPage001State createState() => _WorkoutPage001State();
}


class _WorkoutPage001State extends State<WorkoutPage001> {
  // List<WorkoutItem> _workoutItems = [
  //   WorkoutItem(name: 'Exercise 1', durationInSeconds: 10, details: 'Details for Exercise 1'),
  //   WorkoutItem(name: 'Exercise 2', durationInSeconds: 15, details: 'Details for Exercise 2'),
  //   WorkoutItem(name: 'Exercise 3', durationInSeconds: 20, details: 'Details for Exercise 3'),
  //   WorkoutItem(name: 'Exercise 4', durationInSeconds: 25, details: 'Details for Exercise 4'),
  //   WorkoutItem(name: 'Exercise 5', durationInSeconds: 25, details: 'Details for Exercise 4'),
  // ];

  List<WorkoutItem> _workoutItems = [
    WorkoutItem(name: 'Exercise 1', durationInSeconds: 10, details: 'Details for Exercise 1', videoUrl: 'assets/workout/www.mp4'),
    // Add other items similarly...
  ];
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);

  List<bool> _itemStarted = [];
  List<double> _progressValues = [];
  List<int> _secondsRemainingList = [];
  int _currentIndex = 0;
  bool _isPaused = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _initItemStarted();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                (_workoutItems[_currentIndex].durationInSeconds! - _secondsRemainingList[_currentIndex]) /
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
      _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds!;
    }
  }

  void _nextItem() {
    if (_currentIndex < _workoutItems.length - 1) {
      _saveRemainingTime(_currentIndex);
      setState(() {
        _currentIndex++;
        _restoreRemainingTime(_currentIndex);
      });
      _timer.cancel(); // Cancel the current timer
      _startTimer(); // Start a new timer for the next exercise

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
      double scrollOffset = (_currentIndex) * ((MediaQuery.of(context).size.width / 3.6) + (2 * 8.0) + (2 * 8.0));

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
      _isPaused = !_isPaused;
    });
  }

  void _selectWorkoutItem(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pop(context); // Close the bottom sheet after item selection
    });

    // Calculate the scroll offset based on the selected index
    double scrollOffset = (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);

    // Scroll to the calculated offset
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    if (!_itemStarted[_currentIndex]) {
      _itemStarted[_currentIndex] = true;
      _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds!;
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
                          index == _currentIndex ? Colors.green : Colors.grey, // Change color for current item
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                child: ListTile(
                  title: Text(_workoutItems[_currentIndex].name!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
                      Text('Details: ${_workoutItems[_currentIndex].details}'),

                      if (_workoutItems[_currentIndex].controller!.value.isInitialized) // Check if the video is initialized
                        Container(
                          height: 100,
                          child: AspectRatio(
                            aspectRatio: _workoutItems[_currentIndex].controller!.value.aspectRatio,
                            child: VideoPlayer(_workoutItems[_currentIndex].controller!),
                          ),
                        ),
                      Text(_itemStarted[_currentIndex]
                          ? _secondsRemainingList[_currentIndex] > 0
                          ? 'Time Remaining: ${_secondsRemainingList[_currentIndex]} seconds'
                          : 'Completed'
                          : 'Not Started'),
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
                          index == _currentIndex ? Colors.green : Colors.grey, // Change color for current item
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
