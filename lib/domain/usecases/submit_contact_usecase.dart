import 'package:injectable/injectable.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/domain/repositories/contact_repository.dart';

@lazySingleton
class SubmitContactUseCase {
  final ContactRepository _repository;

  SubmitContactUseCase(this._repository);

  Future<void> call({
    required String title,
    required String description,
    required String deviceInfo,
    required String uuid,
    required ContactType type,
  }) async {
    return _repository.submitContact(
      title: title,
      description: description,
      deviceInfo: deviceInfo,
      uuid: uuid,
      type: type,
    );
  }
}
