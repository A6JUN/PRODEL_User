import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/service_area/service_area_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';
import 'custom_select_box.dart';

class ServiceAreaSelector extends StatefulWidget {
  final Function(int) onSelect;
  final String label;
  const ServiceAreaSelector({
    super.key,
    required this.onSelect,
    required this.label,
  });

  @override
  State<ServiceAreaSelector> createState() => _ServiceAreaSelectorState();
}

class _ServiceAreaSelectorState extends State<ServiceAreaSelector> {
  final ServiceAreaBloc departmentBloc = ServiceAreaBloc();

  @override
  void initState() {
    departmentBloc.add(GetAllServiceAreaEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ServiceAreaBloc>.value(
        value: departmentBloc,
        child: BlocConsumer<ServiceAreaBloc, ServiceAreaState>(
          listener: (context, state) {
            if (state is ServiceAreaFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    departmentBloc.add(GetAllServiceAreaEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ServiceAreaSuccessState) {
              return CustomSelectBox(
                iconData: Icons.area_chart,
                items: List<CustomSelectBoxItem>.generate(
                  state.serviceAreas.length,
                  (index) => CustomSelectBoxItem(
                    value: state.serviceAreas[index]['id'],
                    label: state.serviceAreas[index]['name'],
                  ),
                ),
                label: widget.label,
                onChange: (selected) {
                  widget.onSelect(selected != null ? selected.value : 0);
                },
              );
            } else if (state is ServiceAreaFailureState) {
              return const SizedBox();
            } else {
              return const SizedBox(
                width: 100,
                child: SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
