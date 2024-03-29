import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';

import '../../../blocs/complaints/complaints_bloc.dart';

class AddComplaintDialog extends StatefulWidget {
  final ComplaintsBloc complaintsBloc;
  const AddComplaintDialog({
    super.key,
    required this.complaintsBloc,
  });

  @override
  State<AddComplaintDialog> createState() => _AddComplaintDialogState();
}

class _AddComplaintDialogState extends State<AddComplaintDialog> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      isLoading: isLoading,
      title: 'Complaint',
      message: 'Send your complaint to PRODEL',
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _complaintController,
              maxLines: 3,
              validator: (value) {
                if (value != null && value.trim().isNotEmpty) {
                  return null;
                } else {
                  return 'Enter complaint';
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
                hintText: 'Complaint',
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
            widget.complaintsBloc.add(AddComplaintsEvent(
                complaint: _complaintController.text.trim()));
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
