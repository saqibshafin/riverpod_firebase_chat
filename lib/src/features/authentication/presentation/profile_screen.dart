// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_chat/src/common_widgets/app_button.dart';
import 'package:riverpod_firebase_chat/src/common_widgets/app_icon_button.dart';
import 'package:riverpod_firebase_chat/src/common_widgets/text_input_field.dart';
import 'package:riverpod_firebase_chat/src/constants/app_colors.dart';
import 'package:riverpod_firebase_chat/src/features/jobs/presentation/edit_job_screen/edit_job_screen_controller.dart';
import 'package:riverpod_firebase_chat/src/utils/validator.dart';

import '../data/firebase_auth_repository.dart';

// FIXME immutability issue
class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({super.key, required this.name});

  final String name;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    widget.nameCtrl.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
          actions: [
            AppIconButton(
              icon: Icons.logout,
              iconColor: AppColors.white,
              onTap: () async {
                // await ref.read(userLocalRepositoryProvider).deleteUser();

                // ignore: use_build_context_synchronously
                // context.goNamed("login");
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // Register button
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AppButton(
            text: "Update name",
            height: 48,
            radius: 12,
            color: AppColors.primary,
            onTap: () async {
              _submit();
            },
          ),
        ),
        body: SafeArea(
          child: Material(
            child: Container(
              height: size.height,
              color: AppColors.primaryBackground,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 72),
                child: SingleChildScrollView(
                  child: Form(
                    key: widget.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // UserDetails Form
                        // NameTextField
                        const SizedBox(height: 16),
                        Text(
                          'Name',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        TextInputField(
                          textCtrl: widget.nameCtrl,
                          hintText: 'Your name',
                          prefixIcon: const Padding(
                            padding: EdgeInsetsDirectional.only(end: 8),
                            child: Icon(Icons.account_box, size: 24),
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: Validator.name,
                        ),

                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (widget.formKey.currentState!.validate()) {
      final authRepository = ref.watch(authRepositoryProvider);

      final success =
          await ref.read(editJobScreenControllerProvider.notifier).submit(
                jobId: authRepository.currentUser!.uid,
                // oldJob: widget.job,
                name: widget.nameCtrl.text,
                ratePerHour: 0,
              );
    }
  }
}
