import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ChatsUseCasesModule {
  @lazySingleton
  SendMessageUseCase sendMessageUseCase(
    ChatsRepository chatsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    PreferencesRepository preferencesRepository,
  ) =>
      SendMessageUseCase(
        chatsRepository: chatsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        preferencesRepository: preferencesRepository,
      );
}
