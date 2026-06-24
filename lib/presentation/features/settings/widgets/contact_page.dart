import 'package:flutter/material.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/buttons/app_filled_button.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';
import 'package:sylva/presentation/widgets/text_fields/app_text_field.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactType _selectedType = ContactType.bug;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _descFocus = FocusNode();
  late ThemeData _theme;
  late S _l10n;

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

  void _submit() {
    unfocusAll();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    // TODO: Implement actual submission API/logic here

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_l10n.contactSuccessMessage),
        backgroundColor: Colors.green,
      ),
    );

    // Clear form after submitting
    _titleController.clear();
    _descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);

    return AppScaffold(
      title: _l10n.contact,
      body: SingleChildScrollView(
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
              Wrap(
                spacing: 8.0,
                children: ContactType.values.map((type) {
                  return _buildTypeChip(type: type);
                }).toList(),
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
              ),
              20.height,

              // Submit Button
              AppFilledButton(onPressed: _submit, text: _l10n.submit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeChip({required ContactType type}) {
    final isSelected = _selectedType == type;
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
          setState(() {
            _selectedType = type;
          });
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
