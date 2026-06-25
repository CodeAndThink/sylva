import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/enums/load_status.dart';

class ContactState extends Equatable {
  final LoadStatus summitStatus;
  final LoadStatus getDeviceStatus;
  final bool isAttached;
  final ContactType selectedType;
  final String title;
  final String description;
  final String deviceInfo;
  final int cooldownRemaining;

  const ContactState({
    this.selectedType = ContactType.suggestion,
    this.summitStatus = LoadStatus.initial,
    this.getDeviceStatus = LoadStatus.initial,
    this.isAttached = true,
    this.title = '',
    this.description = '',
    this.deviceInfo = '',
    this.cooldownRemaining = 0,
  });

  bool get isCooldown => cooldownRemaining > 0;

  ContactState copyWith({
    ContactType? selectedType,
    LoadStatus? summitStatus,
    LoadStatus? getDeviceStatus,
    bool? isAttached,
    String? title,
    String? description,
    String? deviceInfo,
    int? cooldownRemaining,
  }) {
    return ContactState(
      selectedType: selectedType ?? this.selectedType,
      summitStatus: summitStatus ?? this.summitStatus,
      getDeviceStatus: getDeviceStatus ?? this.getDeviceStatus,
      isAttached: isAttached ?? this.isAttached,
      title: title ?? this.title,
      description: description ?? this.description,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      cooldownRemaining: cooldownRemaining ?? this.cooldownRemaining,
    );
  }

  @override
  List<Object?> get props => [
    selectedType,
    summitStatus,
    getDeviceStatus,
    isAttached,
    title,
    description,
    deviceInfo,
    cooldownRemaining,
  ];
}
