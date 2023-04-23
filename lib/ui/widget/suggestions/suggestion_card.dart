import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';

class SuggestionCard extends StatelessWidget {
  final dynamic suggestionDetails;
  const SuggestionCard({
    super.key,
    required this.suggestionDetails,
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
                  DateTime.parse(suggestionDetails['created_at']).toLocal()),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(
              height: 30,
            ),
            Text(
              suggestionDetails['feedback'],
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
