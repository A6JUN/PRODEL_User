import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';

class ComplaintCard extends StatelessWidget {
  final dynamic complaintDetails;
  const ComplaintCard({
    super.key,
    required this.complaintDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.red[50],
      borderWidth: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('dd/MM/yyyy hh:mm a').format(
                  DateTime.parse(complaintDetails['created_at']).toLocal()),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(
              height: 30,
            ),
            Text(
              complaintDetails['complaint'],
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
