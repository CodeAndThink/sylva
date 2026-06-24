import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/domain/usecases/submit_contact_usecase.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/contact/contact_cubit.dart';
import 'package:sylva/presentation/features/contact/contact_navigator.dart';
import 'package:sylva/presentation/features/contact/contact_state.dart';
import 'package:sylva/presentation/widgets/buttons/app_filled_button.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';
import 'package:sylva/presentation/widgets/text_fields/app_text_field.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactCubit(
        navigator: ContactNavigator(context),
        submitContactUseCase: locator<SubmitContactUseCase>(),
      ),
      child: const _ContactChildPage(),
    );
  }
}

class _ContactChildPage extends StatefulWidget {
  const _ContactChildPage();

  @override
  State<_ContactChildPage> createState() => __ContactChildPageState();
}

class __ContactChildPageState extends State<_ContactChildPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _descFocus = FocusNode();
  late ThemeData _theme;
  late S _l10n;
  late final ContactCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ContactCubit>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _titleFocus.dispose();
    _descFocus.dispose();
    super.dispose();
  }

  void unfocusAll() {
    _titleFocus.unfocus();
    _descFocus.unfocus();
  }

  Future<void> _submit() async {
    unfocusAll();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    _cubit.submitContact();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);

    return AppScaffold(
      title: _l10n.contact,
      body: BlocListener<ContactCubit, ContactState>(
        listenWhen: (previous, current) =>
            previous.summitStatus != current.summitStatus,
        listener: (context, state) {
          if (state.summitStatus.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_l10n.contactSuccessMessage),
                backgroundColor: Colors.green,
              ),
            );
            _titleController.clear();
            _descController.clear();
            _cubit.changeTitle(value: '');
            _cubit.changeDescription(value: '');
          } else if (state.summitStatus.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_l10n.contactErrorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        12.0,
        MediaQuery.of(context).padding.top + 75 + 12,
        12.0,
        MediaQuery.of(context).padding.bottom + 12.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Contact Type Selection
            AppTitleText(title: _l10n.contactType), 8.height,
            BlocBuilder<ContactCubit, ContactState>(
              buildWhen: (previous, current) =>
                  previous.selectedType != current.selectedType,
              builder: (context, state) {
                return Wrap(
                  spacing: 8.0,
                  children: ContactType.values.map((type) {
                    return _buildTypeChip(
                      type: type,
                      isSelected: state.selectedType == type,
                    );
                  }).toList(),
                );
              },
            ),

            16.height,

            // Title Field
            AppTitleText(title: _l10n.contactFormTitle), 8.height,
            AppTextField(
              focusNode: _titleFocus,
              controller: _titleController,
              hintText: _l10n.contactFormTitleHint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return _l10n.contactFormTitleError;
                }
                return null;
              },
              onChanged: (value) {
                _cubit.changeTitle(value: value);
              },
            ),
            16.height,

            // Description Field
            AppTitleText(title: _l10n.contactFormDescription),
            8.height,
            AppTextField(
              focusNode: _descFocus,
              controller: _descController,
              maxLines: 5,
              hintText: _l10n.contactFormDescriptionHint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return _l10n.contactFormDescriptionError;
                }
                return null;
              },
              onChanged: (value) {
                _cubit.changeDescription(value: value);
              },
            ),
            20.height,

            // Submit Button
            BlocBuilder<ContactCubit, ContactState>(
              buildWhen: (previous, current) =>
                  previous.summitStatus != current.summitStatus,
              builder: (context, state) {
                return AppFilledButton(
                  onPressed: _submit,
                  text: _l10n.submit,
                  isLoading: state.summitStatus.isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip({required ContactType type, required bool isSelected}) {
    final theme = Theme.of(context);

    Color getSelectedColor() {
      switch (type) {
        case ContactType.bug:
          return theme.colorScheme.errorContainer;
        case ContactType.suggestion:
          return theme.colorScheme.primaryContainer;
        case ContactType.other:
          return theme.colorScheme.surfaceContainerHighest;
      }
    }

    Color getOnSelectedColor() {
      switch (type) {
        case ContactType.bug:
          return theme.colorScheme.onErrorContainer;
        case ContactType.suggestion:
          return theme.colorScheme.onPrimaryContainer;
        case ContactType.other:
          return theme.colorScheme.onSurfaceVariant;
      }
    }

    return ChoiceChip(
      label: Text(type.label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          _cubit.changeSelectedType(type: type);
        }
      },
      selectedColor: getSelectedColor(),
      showCheckmark: false,
      labelStyle: _theme.textTheme.titleSmall?.copyWith(
        color: isSelected ? getOnSelectedColor() : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(borderRadius: 20.borderRadius),
    );
  }
}
