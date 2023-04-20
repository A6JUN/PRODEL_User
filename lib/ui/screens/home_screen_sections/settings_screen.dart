import 'package:flutter/material.dart';
import 'package:prodel_user/ui/screens/complaints_screen.dart';
import 'package:prodel_user/ui/screens/login_screen.dart';
import 'package:prodel_user/ui/screens/suggestions_screen.dart';
import 'package:prodel_user/ui/widget/change_password_dialog.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/custom_progress_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              runSpacing: 15,
              children: [
                SettingsCard(
                  icon: Icons.report_outlined,
                  label: 'Complaints',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComplaintsScreen(),
                      ),
                    );
                  },
                ),
                SettingsCard(
                  icon: Icons.comment_outlined,
                  label: 'Suggestions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuggestionsScreen(),
                      ),
                    );
                  },
                ),
                SettingsCard(
                  icon: Icons.lock_open_outlined,
                  label: 'Change Password',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ChangePasswordDialog(),
                    );
                  },
                ),
                isLoading
                    ? Center(
                        child: CustomProgressIndicator(
                          color: Colors.yellow[900]!,
                        ),
                      )
                    : SettingsCard(
                        icon: Icons.exit_to_app_outlined,
                        label: 'Logout',
                        onTap: () async {
                          isLoading = true;
                          setState(() {});

                          await Supabase.instance.client.auth.signOut();

                          isLoading = false;
                          setState(() {});

                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => true,
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final Function() onTap;
  final String label;
  final IconData icon;
  const SettingsCard({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: onTap,
      borderWidth: 0,
      color: Colors.yellow[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.yellow[900]!,
              size: 30,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
