import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/complaints/add_complaint_dialog.dart';
import 'package:prodel_user/ui/widget/complaints/complaint_card.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Complaints',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 1,
        leading: const BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AddComplaintDialog(),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List<Widget>.generate(
                      10,
                      (index) => const ComplaintCard(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
