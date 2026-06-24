import 'package:sylva/generated/l10n.dart';

enum ContactType { suggestion, bug, other }

extension ContactTypeExtension on ContactType {
  bool get isSuggestion => this == ContactType.suggestion;
  bool get isBug => this == ContactType.bug;
  bool get isOther => this == ContactType.other;

  String get label {
    switch (this) {
      case ContactType.suggestion:
        return S.current.contactFormTypeSuggestion;
      case ContactType.bug:
        return S.current.contactFormTypeBug;
      case ContactType.other:
        return S.current.contactFormTypeOther;
    }
  }

  int get value {
    switch (this) {
      case ContactType.suggestion:
        return 0;
      case ContactType.bug:
        return 1;
      case ContactType.other:
        return 2;
    }
  }
}
