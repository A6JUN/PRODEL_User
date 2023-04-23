import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';
import 'package:prodel_user/ui/widget/suggestions/suggestion_card.dart';

import '../../blocs/suggestion/suggestion_bloc.dart';
import '../widget/suggestions/add_suggestion_dialog.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final SuggestionBloc suggestionsBloc = SuggestionBloc();

  @override
  void initState() {
    super.initState();
    suggestionsBloc.add(GetAllSuggestionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuggestionBloc>.value(
      value: suggestionsBloc,
      child: BlocConsumer<SuggestionBloc, SuggestionState>(
        listener: (context, state) {
          if (state is SuggestionFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
                primaryButtonLabel: 'Ok',
                primaryOnPressed: () {
                  suggestionsBloc.add(GetAllSuggestionEvent());
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
                'Suggestion',
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
                        builder: (context) => AddSuggestionDialog(
                          suggestionsBloc: suggestionsBloc,
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
                      child: state is SuggestionSuccessState
                          ? state.suggestions.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) =>
                                      SuggestionCard(
                                    suggestionDetails: state.suggestions[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: state.suggestions.length,
                                )
                              : const Center(
                                  child: Text('No Suggestion'),
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
