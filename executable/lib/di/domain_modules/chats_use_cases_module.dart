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

  @lazySingleton
  GetFirstMessagesPageUseCase getFirstMessagesPageUseCase(
    ChatsRepository chatsRepository,
    PreferencesRepository preferencesRepository,
    ChatsOutputPort chatsOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      GetFirstMessagesPageUseCase(
        chatsRepository: chatsRepository,
        preferencesRepository: preferencesRepository,
        chatsOutputPort: chatsOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
