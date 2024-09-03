import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ShowModalBottomSheet({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            'Supprimer la carte existante',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 18,
              fontFamily: 'Archivo-SemiBold',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Voulez-vous supprimer cette carte ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onCancel();// Close the modal when tapped
                    },
                    child: Container(
                      height: 52,

                      decoration: ShapeDecoration(
                        shape:
                        RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Color(
                                  0xFFFF4343)),
                          borderRadius:
                          BorderRadius
                              .circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Non',
                          style: TextStyle(
                            color: Color(
                                0xFFFF4343),
                            fontSize: 16,
                            fontFamily:
                            'Archivo',
                            fontWeight:
                            FontWeight.w600,
                            height: 1.09,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onConfirm();
                    },
                    child: Container(
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape:
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                                8)),
                      ),
                      child: Center(
                        child: Text(
                          'Oui',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily:
                            'Archivo-SemiBold',
                            fontWeight:
                            FontWeight.w600,
                            height: 1.09,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
