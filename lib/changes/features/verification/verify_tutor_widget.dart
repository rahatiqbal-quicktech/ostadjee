import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'model/tutor_details_model.dart';
import 'service/tutor_verfiy_service.dart';

class VerfyTutorWidget extends StatefulWidget {
  const VerfyTutorWidget({required this.thisId, Key? key}) : super(key: key);
  final String thisId;

  @override
  State<VerfyTutorWidget> createState() => _VerfyTutorWidgetState();
}

class _VerfyTutorWidgetState extends State<VerfyTutorWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TutorVerifyDetailsModel?>(
        future: TutorVerifyService().getDetails(id: widget.thisId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data?.tutordetails;
            if (temp?.nidCard != null &&
                temp?.nidCardBack != null &&
                temp?.studentCard != null &&
                temp?.studentCardBack != null) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Verified",
                    style: TextStyle(
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green.shade700,
                  ),
                ],
              );
            } else {
              return const SizedBox(
                height: 1,
                width: 1,
              );
            }
          } else {
            return SizedBox(
              height: 50,
              width: 50,
              child: JumpingDotsProgressIndicator(
                fontSize: 30.0,
                color: Colors.green,
              ),
            );
          }
        });
  }
}
