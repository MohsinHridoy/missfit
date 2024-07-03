import 'package:flutter/material.dart';
import 'package:miss_fit/screens/challenge_details/challenge_details.dart';

import '../../common_utils.dart';

class Challenge {
  final String name;
  final String imagePath;

  Challenge({required this.name, required this.imagePath});
}

class TakeChallenge extends StatefulWidget {
  String? status;

   TakeChallenge({super.key,this.status});

  @override
  _TakeChallengeState createState() => _TakeChallengeState();
}

class _TakeChallengeState extends State<TakeChallenge> {
  List<Challenge> challenges = [
    Challenge(name: 'Calorie Torcher', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Strength Builder', imagePath: 'assets/takechallenge/img_challenge_item2.png'),
    Challenge(name: 'Cardio King', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Flexibility Master', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Mindfulness Journey', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Quick HIIT', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Endurance Challenge', imagePath: 'assets/takechallenge/img_challenge_item.png'),
    Challenge(name: 'Muscle Gain', imagePath: 'assets/takechallenge/img_challenge_item.png'),
  ];

  final List<String> chipItemsChallenges = [
    'Lose Weight',
    'Calorie Burn',
    'Cardio',
    'Strength',
    'Six Pack',
    'Yoga',
    'Yoga',
  ];

  final List<String> chipItemsDifficulty = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  final List<String> chipItemsDuration = [
    '10-20 min',
    '20-30 min',
    '30-40 min',
    '40-50+ min',
  ];

  final List<String> selectedChallenges = [];
   List<String> selectedTotalChallenges = [];
  final List<String> selectedChallengesDifficulty = [];
  final List<String> selectedChallengesDurations = [];
  String? selectedDifficulty;
  String? selectedDuration;


  List<Challenge> filteredChallenges = [];
  TextEditingController searchController = TextEditingController();
  bool isAdded=true;
  String chipText='';
  String chipText1='';
  bool firstTextViewVisible = true;

  void toggleVisibility() {
    setState(() {
      isAdded = !isAdded;
    });
  }
  @override
  void initState() {
    super.initState();
    filteredChallenges = challenges;
    searchController.addListener(filterChallenges);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterChallenges() {
    List<Challenge> _filteredChallenges = challenges
        .where((challenge) =>
        challenge.name.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    setState(() {
      filteredChallenges = _filteredChallenges;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),

      body: Column(
        children: [
          Container(
            height: 97,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              border: Border.all(color: Colors.white.withOpacity(0.11)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/cart/icon_left_arrow.png",
                      scale: 2,
                    ),
                  ),
                  isAdded!? SizedBox(width: MediaQuery.of(context).size.width / 4):SizedBox(width: MediaQuery.of(context).size.width / 2.8),
                  Text(
                    isAdded!? (widget.status == 'workout' ? 'Entraînement' : 'Relever un défi') : 'Filter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 18,
                      fontFamily: 'Kanit-Medium',
                      fontWeight: FontWeight.w500,
                      height: 0.07,

                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(

                        child: Visibility(
                          visible: isAdded,

                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                                  // child: SearchBar(controller: searchController, isadded: isAdded,),
                                  child: Container(
                                    width: double.infinity,
                                    height: 55,
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            decoration: ShapeDecoration(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/takechallenge/icon_search.png",scale: 2,),

                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(bottom: 7.0),
                                                      child: TextField(
                                                        controller: searchController,
                                                        decoration: InputDecoration(
                                                          hintText: 'Search',
                                                          hintStyle: TextStyle(
                                                            color: Color(0xFF9CA3AF),
                                                            fontSize: 14,
                                                            fontFamily: 'Archivo-Regular',
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.5,
                                                          ),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        GestureDetector(
                                          onTap: (){
                                            selectedChallenges.clear();

                                            toggleVisibility();

                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            padding: const EdgeInsets.all(8),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ),
                                            child: Image.asset(
                                              "assets/takechallenge/icon_filter.png", // Replace with your image path
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Challenges',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 20,
                                      fontFamily: 'Kanit-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                  ),
                                ),


                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Visibility(
                                        visible:selectedChallenges.isEmpty,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage('assets/takechallenge/img_challenge_item.png'), // Replace with your image path
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Calorie Torcher',
                                                        style: TextStyle(
                                                          color: Color(0xFF334155),
                                                          fontSize: 18,
                                                          fontFamily: 'Archivo-Medium',
                                                          fontWeight: FontWeight.w500,
                                                          height: 1.2,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 10),

                                                      Text(
                                                        '64%',
                                                        style: TextStyle(
                                                          color: Color(0xFF66758C),
                                                          fontSize: 14,
                                                          fontFamily: 'Archivo-Regular',
                                                          fontWeight: FontWeight.w400,
                                                          height: 0.10,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      LinearProgressBar(progress: 0.44),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 15),
                                            Container(
                                              width: double.infinity,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFE5E7EB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //   top:25,
                                    //   left:20,
                                    //   right:20,
                                    //   bottom:15,
                                    //   child: ,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,top:20,right: 15),
                                      child: Container(
                                        child: Wrap(
                                          spacing: 12.0, // Spacing between items
                                          runSpacing: 12.0, // Spacing between lines
                                          children: selectedChallenges.map((chipitems) => _buildItemfilterList(selectedChallenges,selectedChallenges.indexOf(chipitems))).toList(),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                                SizedBox(height: 15),

                                // Expanded(
                                //   child: ListView.builder(
                                //     padding: EdgeInsets.all(16.0),
                                //     itemCount: filteredChallenges.length,
                                //     itemBuilder: (context, index) {
                                //       return ChallengeCard(challenge:  filteredChallenges[index]!);
                                //     },
                                //   ),
                                // ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: List.generate(filteredChallenges.length, (index) {
                                      final challenge = filteredChallenges[index];
                                      return ChallengeCard(challenge: challenge,status: widget.status,);
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: !isAdded,

                        child:Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0,top: 30),
                                child: _buildTitle('Challenge Type'),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0,top: 15),
                                child: Wrap(
                                  spacing: 12.0, // Spacing between items
                                  runSpacing: 12.0, // Spacing between lines
                                  children: chipItemsChallenges.map((item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedChallenges.contains(item)) {
                                            selectedChallenges.remove(item);
                                          } else {
                                            selectedChallenges.add(item);
                                          }
                                        });
                                      },
                                      child: _buildItem(item, selectedChallenges.contains(item)),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0,top: 35),
                                child: _buildTitle('Difficulty'),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Wrap(
                                  spacing: 12.0, // Spacing between items
                                  runSpacing: 12.0, // Spacing between lines
                                  children: chipItemsDifficulty.map((item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedDifficulty == item) {
                                            selectedDifficulty = null;


                                          } else {
                                            selectedDifficulty = item;
                                            chipText=item;
                                          }

                                          // if (selectedChallengesDifficulty.contains(item)) {
                                          //   selectedChallengesDifficulty.remove(item);
                                          // } else {
                                          //   selectedChallengesDifficulty.add(item);
                                          // }
                                        });
                                      },
                                      child: _buildItem(item, selectedDifficulty == item),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0,top: 25),
                                child: _buildTitle('Duration'),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, top: 20),
                                child: Wrap(
                                  spacing: 12.0, // Spacing between items
                                  runSpacing: 12.0, // Spacing between lines
                                  children: chipItemsDuration.map((item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedDuration == item) {
                                            selectedDuration = null;
                                          } else {
                                            selectedDuration = item;
                                            chipText1=item;

                                          }

                                          // if (selectedChallengesDurations.contains(item)) {
                                          //   selectedChallengesDurations.remove(item);
                                          // } else {
                                          //   selectedChallengesDurations.add(item);
                                          // }
                                        });
                                      },
                                      child: _buildItem(item, selectedDuration == item),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: (){
                                    selectedChallenges.add(chipText);
                                    selectedChallenges.add(chipText1);
                                    print(selectedTotalChallenges);
                                    toggleVisibility();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 52,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFF4343),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Archivo-Semibold',
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
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return SizedBox(
      width: 320,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 20,
          fontFamily: 'Kanit-Medium',
          fontWeight: FontWeight.w500,
          height: 0.06,
        ),
      ),
    );
  }

  Widget _buildItem(String item, bool isSelected) {
    return Container(
      height: 36,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.white:Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color:isSelected ?  Color(0xFFFFA142):Color(0xFFD1D5DB),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 13.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 12.0),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ?  Color(0xFFE88E32):Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemfilterList(List<String> filteredChallenges, int index) {
    String item = filteredChallenges[index]; // Get the item at the specified index

    return Container(
      height: 36,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            // strokeAlign: StrokeAlign.center,
            color: Color(0xFFFFA142),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 13.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  filteredChallenges.removeAt(index); // Remove the item from the list
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  "assets/shophome/icon_delete.png",
                  scale: 1.7,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 12.0),
              child: Text(
                item,
                style: TextStyle(
                  color: Color(0xFFE88E32),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
class LinearProgressBar extends StatelessWidget {
  final double progress; // progress percentage (0.0 to 1.0)

  const LinearProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      height: 8,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 243,
              height: 8,
              decoration: ShapeDecoration(
                color: Color(0xFFD1D5DB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 243 * progress, // Progress width based on percentage
              height: 8,
              decoration: ShapeDecoration(
                color: Color(0xFFFF4343),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  String? status;

   ChallengeCard({super.key, required this.challenge,this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        navigateToNextPage(context,ChallengesDetails(status: status,));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Container(
          color:  Color(0xFFF6F6F6),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(challenge.imagePath), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          challenge.name,
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _buildLabelWithIcon('assets/takechallenge/icon_level.png', 'Intermediate'),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: _buildLabelWithIcon('assets/takechallenge/icon_time.png', '25 min'),
                            )),
                            _buildLabelWithIcon('assets/takechallenge/icon_flame.png', '247 cal'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xFFE5E7EB),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelWithIcon(String assetPath, String label) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF66758C),
            fontSize: 14,
            fontFamily: 'Archivo-Regular',
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  bool? isadded;

   SearchBar({super.key, required this.controller,required this.isadded});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                children: [
                  Image.asset("assets/takechallenge/icon_search.png",scale: 2,),

                  const SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: (){
              isadded=false;

            },
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Image.asset(
                "assets/takechallenge/icon_filter.png", // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}