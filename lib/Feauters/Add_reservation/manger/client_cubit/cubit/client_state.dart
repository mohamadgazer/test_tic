part of 'client_cubit.dart';

@immutable
sealed class ClientState {}

final class ClientInitial extends ClientState {}

final class ClientAdd extends ClientState {
  final List<ClinetModel> list;
  ClientAdd(this.list);
}
