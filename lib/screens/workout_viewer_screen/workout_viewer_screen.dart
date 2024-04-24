import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//
//
// class WorkoutPage extends StatefulWidget {
//   @override
//   _WorkoutPageState createState() => _WorkoutPageState();
// }
//
// class _WorkoutPageState extends State<WorkoutPage> {
//   List<int> _itemDurations = [10, 15, 20, 25]; // Durations for each item in seconds
//   List<bool> _itemStarted = []; // Tracks if each item's timer has started
//   List<double> _progressValues = []; // Progress values for each item
//   List<int> _secondsRemainingList = []; // Remaining seconds for each item
//   int _currentIndex = 0; // Index of the current item being displayed
//   Timer? _timer;
//   ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _initItemStarted();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//
//
//   // Method to navigate to the next item
//   // void _nextItem() {
//   //   if (_currentIndex < _itemDurations.length - 1) {
//   //     if (_secondsRemainingList[_currentIndex] <= 0) {
//   //       setState(() {
//   //         _currentIndex++;
//   //         _scrollToItem(_currentIndex);
//   //         // Update progress for the current item
//   //         _progressValues[_currentIndex] =
//   //             (_itemDurations[_currentIndex] -
//   //                 _secondsRemainingList[_currentIndex]) /
//   //                 _itemDurations[_currentIndex];
//   //       });
//   //     }
//   //   }
//   // }
//   void _nextItem() {
//     if (_currentIndex < _itemDurations.length - 1) {
//       setState(() {
//         _currentIndex++;
//         _scrollToItem(_currentIndex);
//         // Ensure the timer starts for the new current index if it hasn't already started
//         if (!_itemStarted[_currentIndex]) {
//           _itemStarted[_currentIndex] = true;
//           _secondsRemainingList[_currentIndex] = _itemDurations[_currentIndex];
//           _progressValues[_currentIndex] = 0.0;
//         }
//         // Update progress for the current item
//         _progressValues[_currentIndex] =
//             (_itemDurations[_currentIndex] - _secondsRemainingList[_currentIndex]) /
//                 _itemDurations[_currentIndex];
//       });
//     }
//   }
//
// // Method to scroll to a particular item
//   // Scroll to the current item
//   void _scrollToItem(int index) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     _scrollController.animateTo(
//       index * screenWidth, // Assuming each item takes up the full width of the screen
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   // Method to initialize _itemStarted list and other lists
//   void _initItemStarted() {
//     _itemStarted = List<bool>.filled(_itemDurations.length, false);
//     _progressValues = List<double>.filled(_itemDurations.length, 0.0);
//     _secondsRemainingList = List<int>.filled(_itemDurations.length, 0);
//   }
//
//   // Method to start the timer
//   // Method to start the timer
//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (timer) {
//       setState(() {
//         if (_currentIndex >= _itemDurations.length) {
//           timer.cancel();
//         } else {
//           if (_secondsRemainingList[_currentIndex] <= 0 && _currentIndex < _itemDurations.length - 1) {
//             _currentIndex++;
//             _itemStarted[_currentIndex] = true;
//             _secondsRemainingList[_currentIndex] = _itemDurations[_currentIndex];
//             _progressValues[_currentIndex] = 0.0;
//             _scrollToItem(_currentIndex);
//           } else if (_secondsRemainingList[_currentIndex] > 0) {
//             _secondsRemainingList[_currentIndex]--;
//             _progressValues[_currentIndex] =
//                 (_itemDurations[_currentIndex] - _secondsRemainingList[_currentIndex]) /
//                     _itemDurations[_currentIndex];
//           }
//         }
//       });
//     });
//
//     // Start the timer for the first item if it hasn't been started
//     if (!_itemStarted[_currentIndex]) {
//       _itemStarted[_currentIndex] = true;
//       _secondsRemainingList[_currentIndex] = _itemDurations[_currentIndex];
//       _progressValues[_currentIndex] = 0.0;
//     }
//   }
//
//
//   // Method to navigate to the previous item
//   void _previousItem() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//         _scrollToItem(_currentIndex);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Workout Page'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20.0,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _itemDurations.length,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width / 3.6,
//                     child: LinearProgressIndicator(
//                       value: _progressValues[index],
//                       backgroundColor: Colors.white,
//                       valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF22C55E)),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               itemCount: _itemDurations.length,
//               itemBuilder: (context, index) {
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width / 1,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Card(
//                       child: ListTile(
//                         title: Text('Item ${index + 1}'),
//                         subtitle: Text(_itemStarted[index]
//                             ? _secondsRemainingList[index] > 0 && index == _currentIndex
//                             ? 'Time Remaining: ${_secondsRemainingList[index]} seconds'
//                             : 'Completed'
//                             : 'Not Started'),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _previousItem,
//                 child: Text('Previous'),
//               ),
//               ElevatedButton(
//                 onPressed: _nextItem,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class WorkoutItem {
  final String name;
  final int durationInSeconds;
  final String details;

  WorkoutItem({
    required this.name,
    required this.durationInSeconds,
    required this.details,
  });
}

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

// class _WorkoutPageState extends State<WorkoutPage> {
//   List<WorkoutItem> _workoutItems = [
//     WorkoutItem(name: 'Exercise 1', durationInSeconds: 10, details: 'Details for Exercise 1'),
//     WorkoutItem(name: 'Exercise 2', durationInSeconds: 15, details: 'Details for Exercise 2'),
//     WorkoutItem(name: 'Exercise 3', durationInSeconds: 20, details: 'Details for Exercise 3'),
//     WorkoutItem(name: 'Exercise 4', durationInSeconds: 25, details: 'Details for Exercise 4'),
//   ];
//
//   List<bool> _itemStarted = [];
//   List<double> _progressValues = [];
//   List<int> _secondsRemainingList = [];
//   int _currentIndex = 0;
//   bool _isPaused = false;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _initItemStarted();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _initItemStarted() {
//     _itemStarted = List<bool>.filled(_workoutItems.length, false);
//     _progressValues = List<double>.filled(_workoutItems.length, 0.0);
//     _secondsRemainingList = List<int>.filled(_workoutItems.length, 0);
//   }
//
//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (timer) {
//       if (!_isPaused) {
//         setState(() {
//           if (_secondsRemainingList[_currentIndex] > 0) {
//             _secondsRemainingList[_currentIndex]--;
//             _progressValues[_currentIndex] =
//                 (_workoutItems[_currentIndex].durationInSeconds - _secondsRemainingList[_currentIndex]) /
//                     _workoutItems[_currentIndex].durationInSeconds;
//           } else if (_currentIndex < _workoutItems.length - 1) {
//             _nextItem();
//           }
//         });
//       }
//     });
//
//     if (!_itemStarted[_currentIndex]) {
//       _itemStarted[_currentIndex] = true;
//       _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
//       _progressValues[_currentIndex] = 0.0;
//     }
//   }
//
//   void _nextItem() {
//     if (_currentIndex < _workoutItems.length - 1) {
//       setState(() {
//         _currentIndex++;
//         _itemStarted[_currentIndex] = true;
//         _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
//         _progressValues[_currentIndex] = 0.0;
//       });
//     }
//   }
//
//
//   void _previousItem() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//       });
//     }
//   }
//   // void _startTimer() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //
//   //   const oneSec = Duration(seconds: 1);
//   //   _timer = Timer.periodic(oneSec, (timer) {
//   //     if (!_isPaused) {
//   //       setState(() {
//   //         if (_secondsRemainingList[_currentIndex] > 0) {
//   //           _secondsRemainingList[_currentIndex]--;
//   //           _progressValues[_currentIndex] =
//   //               (_workoutItems[_currentIndex].durationInSeconds - _secondsRemainingList[_currentIndex]) /
//   //                   _workoutItems[_currentIndex].durationInSeconds;
//   //           // Save progress value
//   //           prefs.setDouble('progress_$_currentIndex', _progressValues[_currentIndex]);
//   //         } else if (_currentIndex < _workoutItems.length - 1) {
//   //           _nextItem();
//   //         }
//   //       });
//   //     }
//   //   });
//   //
//   //   if (!_itemStarted[_currentIndex]) {
//   //     _itemStarted[_currentIndex] = true;
//   //     _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
//   //     _progressValues[_currentIndex] = prefs.getDouble('progress_$_currentIndex') ?? 0.0;
//   //   }
//   // }
//   // void _nextItem() async {
//   //   if (_currentIndex < _workoutItems.length - 1) {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     setState(() {
//   //       _currentIndex++;
//   //       _itemStarted[_currentIndex] = true;
//   //       _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
//   //       _progressValues[_currentIndex] = prefs.getDouble('progress_$_currentIndex') ?? 0.0;
//   //     });
//   //   }
//   // }
//   //
//   // void _previousItem() async {
//   //   if (_currentIndex > 0) {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     setState(() {
//   //       _currentIndex--;
//   //       _progressValues[_currentIndex] = prefs.getDouble('progress_$_currentIndex') ?? 0.0;
//   //     });
//   //   }
//   // }
//
//
//   void _togglePause() {
//     setState(() {
//       _isPaused = !_isPaused;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Workout Page'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20.0,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _workoutItems.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width / 3.6,
//                     child: LinearProgressIndicator(
//                       value: _progressValues[index],
//                       backgroundColor: Colors.white,
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Card(
//                 child: ListTile(
//                   title: Text(_workoutItems[_currentIndex].name),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
//                       Text('Details: ${_workoutItems[_currentIndex].details}'),
//                       Text(_itemStarted[_currentIndex]
//                           ? _secondsRemainingList[_currentIndex] > 0
//                           ? 'Time Remaining: ${_secondsRemainingList[_currentIndex]} seconds'
//                           : 'Completed'
//                           : 'Not Started'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _previousItem,
//                 child: Text('Previous'),
//               ),
//               ElevatedButton(
//                 onPressed: _togglePause,
//                 child: Text(_isPaused ? 'Resume' : 'Pause'),
//               ),
//               ElevatedButton(
//                 onPressed: _nextItem,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _WorkoutPageState extends State<WorkoutPage> {
//   List<WorkoutItem> _workoutItems = [
//     WorkoutItem(name: 'Exercise 1', durationInSeconds: 10, details: 'Details for Exercise 1'),
//     WorkoutItem(name: 'Exercise 2', durationInSeconds: 15, details: 'Details for Exercise 2'),
//     WorkoutItem(name: 'Exercise 3', durationInSeconds: 20, details: 'Details for Exercise 3'),
//     WorkoutItem(name: 'Exercise 4', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     WorkoutItem(name: 'Exercise 5', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 6', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 7', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 8', durationInSeconds: 20, details: 'Details for Exercise 3'),
//     // WorkoutItem(name: 'Exercise 9', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 10', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 11', durationInSeconds: 25, details: 'Details for Exercise 4'),
//     // WorkoutItem(name: 'Exercise 12', durationInSeconds: 25, details: 'Details for Exercise 4'),
//   ];
//   ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);
//
//   List<bool> _itemStarted = [];
//   List<double> _progressValues = [];
//   List<int> _secondsRemainingList = [];
//   int _currentIndex = 0;
//   bool _isPaused = false;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _initItemStarted();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   void _initItemStarted() {
//     _itemStarted = List<bool>.filled(_workoutItems.length, false);
//     _progressValues = List<double>.filled(_workoutItems.length, 0.0);
//     _secondsRemainingList = List<int>.filled(_workoutItems.length, 0);
//   }
//
//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (timer) {
//       if (!_isPaused) {
//         setState(() {
//           if (_secondsRemainingList[_currentIndex] > 0) {
//             _secondsRemainingList[_currentIndex]--;
//             _progressValues[_currentIndex] =
//                 (_workoutItems[_currentIndex].durationInSeconds - _secondsRemainingList[_currentIndex]) /
//                     _workoutItems[_currentIndex].durationInSeconds;
//           } else if (_currentIndex < _workoutItems.length - 1) {
//             _nextItem();
//           }
//         });
//       }
//     });
//
//     if (!_itemStarted[_currentIndex]) {
//       _itemStarted[_currentIndex] = true;
//       _progressValues[_currentIndex] = 0.0;
//       _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
//     }
//   }
//   void _nextItem() {
//     if (_currentIndex < _workoutItems.length - 1) {
//       _saveRemainingTime(_currentIndex);
//       setState(() {
//         _currentIndex++;
//         _restoreRemainingTime(_currentIndex);
//       });
//       _timer.cancel(); // Cancel the current timer
//       _startTimer(); // Start a new timer for the next exercise
//
//       // Calculate the scroll offset based on the index of the current exercise
//       double scrollOffset = (_currentIndex) * (MediaQuery.of(context).size.width / 3.6 + 2 * 8.0);
//
//       // Scroll to the calculated offset
//       WidgetsBinding.instance!.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           scrollOffset,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }
//
//   void _previousItem() {
//     if (_currentIndex > 0) {
//       _saveRemainingTime(_currentIndex);
//       setState(() {
//         _currentIndex--;
//         _restoreRemainingTime(_currentIndex);
//       });
//       _timer.cancel(); // Cancel the current timer
//       _startTimer(); // Start a new timer for the previous exercise
//
//       // Calculate the scroll offset based on the index of the current exercise
//       double scrollOffset = (_currentIndex) * ((MediaQuery.of(context).size.width / 3.6) + (2 * 8.0) + (2 * 8.0));
//
//       // Scroll to the calculated offset
//       WidgetsBinding.instance!.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           scrollOffset,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }
//   //
//   // void _previousItem() {
//   //   if (_currentIndex > 0) {
//   //     _saveRemainingTime(_currentIndex);
//   //     setState(() {
//   //       _currentIndex--;
//   //       _restoreRemainingTime(_currentIndex);
//   //     });
//   //     _timer.cancel(); // Cancel the current timer
//   //     _startTimer(); // Start a new timer for the previous exercise
//   //   }
//   // }
//
//
//
//
//   void _saveRemainingTime(int index) {
//     _secondsRemainingList[index] = _secondsRemainingList[_currentIndex];
//   }
//
//   void _restoreRemainingTime(int index) {
//     _secondsRemainingList[_currentIndex] = _secondsRemainingList[index];
//   }
//
//   void _togglePause() {
//     setState(() {
//       _isPaused = !_isPaused;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Workout Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               controller: _scrollController,
//               child: Row(
//                 children: List.generate(_workoutItems.length, (index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width / 3.6,
//                       child: LinearProgressIndicator(
//                         value: _progressValues[index],
//                         backgroundColor: Colors.white,
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           index == _currentIndex ? Colors.green : Colors.grey, // Change color for current item
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Card(
//                 child: ListTile(
//                   title: Text(_workoutItems[_currentIndex].name),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
//                       Text('Details: ${_workoutItems[_currentIndex].details}'),
//                       Text(_itemStarted[_currentIndex]
//                           ? _secondsRemainingList[_currentIndex] > 0
//                           ? 'Time Remaining: ${_secondsRemainingList[_currentIndex]} seconds'
//                           : 'Completed'
//                           : 'Not Started'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _previousItem,
//                 child: Text('Previous'),
//               ),
//               ElevatedButton(
//                 onPressed: _togglePause,
//                 child: Text(_isPaused ? 'Resume' : 'Pause'),
//               ),
//               ElevatedButton(
//                 onPressed: _nextItem,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
// }

class _WorkoutPageState extends State<WorkoutPage> {
  List<WorkoutItem> _workoutItems = [
    WorkoutItem(name: 'Exercise 1', durationInSeconds: 10, details: 'Details for Exercise 1'),
    WorkoutItem(name: 'Exercise 2', durationInSeconds: 15, details: 'Details for Exercise 2'),
    WorkoutItem(name: 'Exercise 3', durationInSeconds: 20, details: 'Details for Exercise 3'),
    WorkoutItem(name: 'Exercise 4', durationInSeconds: 25, details: 'Details for Exercise 4'),
    WorkoutItem(name: 'Exercise 5', durationInSeconds: 25, details: 'Details for Exercise 4'),
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
                (_workoutItems[_currentIndex].durationInSeconds - _secondsRemainingList[_currentIndex]) /
                    _workoutItems[_currentIndex].durationInSeconds;
          } else if (_currentIndex < _workoutItems.length - 1) {
            _nextItem();
          }
        });
      }
    });

    if (!_itemStarted[_currentIndex]) {
      _itemStarted[_currentIndex] = true;
      _progressValues[_currentIndex] = 0.0;
      _secondsRemainingList[_currentIndex] = _workoutItems[_currentIndex].durationInSeconds;
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

    // Restart the timer for the selected exercise
    _timer.cancel();
    _initItemStarted();
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
                  title: Text(_workoutItems[_currentIndex].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Duration: ${_workoutItems[_currentIndex].durationInSeconds} seconds'),
                      Text('Details: ${_workoutItems[_currentIndex].details}'),
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
                        title: Text(_workoutItems[index].name),
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
