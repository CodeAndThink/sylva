import 'package:sylva/core/enums/contact_type.dart';

abstract class ContactRepository {
  Future<void> submitContact({
    required String title,
    required String description,
    required String deviceInfo,
    required ContactType type,
  });
}
