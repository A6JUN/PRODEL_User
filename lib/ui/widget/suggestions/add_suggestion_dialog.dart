import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';

import '../../../blocs/suggestion/suggestion_bloc.dart';

class AddSuggestionDialog extends StatefulWidget {
  final SuggestionBloc suggestionsBloc;
  const AddSuggestionDialog({
    super.key,
    required this.suggestionsBloc,
  });

  @override
  State<AddSuggestionDialog> createState() => _AddSuggestionDialogState();
}

class _AddSuggestionDialogState extends State<AddSuggestionDialog> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _suggestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      isLoading: isLoading,
      title: 'Suggestion',
      message: 'Send your suggestion to PRODEL',
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _suggestionController,
              maxLines: 3,
              validator: (value) {
                if (value != null && value.trim().isNotEmpty) {
                  return null;
                } else {
                  return 'Enter suggestion';
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
                hintText: 'Suggestion',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      primaryButtonLabel: 'Send',
      primaryOnPressed: () async {
        try {
          if (_formKey.currentState!.validate()) {
            widget.suggestionsBloc.add(AddSuggestionEvent(
                suggestion: _suggestionController.text.trim()));
            Navigator.pop(context);
          }
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: 'Failed!',
              message: e.toString(),
              primaryButtonLabel: 'Ok',
            ),
          );
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
