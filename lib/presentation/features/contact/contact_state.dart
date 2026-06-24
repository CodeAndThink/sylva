import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/enums/load_status.dart';

class ContactState extends Equatable {
  final LoadStatus summitStatus;
  final ContactType selectedType;
  final String title;
  final String description;

  const ContactState({
    this.selectedType = ContactType.bug,
    this.summitStatus = LoadStatus.initial,
    this.title = '',
    this.description = '',
  });

  ContactState copyWith({
    ContactType? selectedType,
    LoadStatus? summitStatus,
    String? title,
    String? description,
  }) {
    return ContactState(
      selectedType: selectedType ?? this.selectedType,
      summitStatus: summitStatus ?? this.summitStatus,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [selectedType, summitStatus, title, description];
}
