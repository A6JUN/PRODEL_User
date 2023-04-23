import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_user/blocs/complaints/complaints_bloc.dart';
import 'package:prodel_user/ui/widget/complaints/add_complaint_dialog.dart';
import 'package:prodel_user/ui/widget/complaints/complaint_card.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final ComplaintsBloc complaintsBloc = ComplaintsBloc();

  @override
  void initState() {
    super.initState();
    complaintsBloc.add(GetAllComplaintsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintsBloc>.value(
      value: complaintsBloc,
      child: BlocConsumer<ComplaintsBloc, ComplaintsState>(
        listener: (context, state) {
          if (state is ComplaintsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
                primaryButtonLabel: 'Ok',
                primaryOnPressed: () {
                  complaintsBloc.add(GetAllComplaintsEvent());
                },
              ),
            );
          }
        },
        builder: (context, state) {
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
                        builder: (context) => AddComplaintDialog(
                          complaintsBloc: complaintsBloc,
                        ),
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
                      child: state is ComplaintsSuccessState
                          ? state.complaints.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) =>
                                      ComplaintCard(
                                    complaintDetails: state.complaints[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: state.complaints.length,
                                )
                              : const Center(
                                  child: Text('No Complaints'),
                                )
                          : const Center(
                              child: CupertinoActivityIndicator(),
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
        },
      ),
    );
  }
}
