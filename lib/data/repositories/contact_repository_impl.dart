import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/domain/repositories/contact_repository.dart';

@LazySingleton(as: ContactRepository)
class ContactRepositoryImpl implements ContactRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> submitContact({
    required String title,
    required String description,
    required String deviceInfo,
    required String uuid,
    required ContactType type,
  }) async {
    await _firestore.collection('feedbacks').add({
      'title': title,
      'description': description,
      'device_info': deviceInfo,
      'uuid': uuid,
      'type': type.value,
      'create_at': FieldValue.serverTimestamp(),
    });
  }
}
