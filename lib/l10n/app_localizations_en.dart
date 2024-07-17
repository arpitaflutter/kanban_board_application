import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get settings => 'Settings';

  @override
  String get appLanguage => 'App Language';

  @override
  String get appTheme => 'App Theme';

  @override
  String get kanbanBoard => 'Kanban Board';

  @override
  String get createBoard => 'Create Board';

  @override
  String get createNewTask => 'Create New Task';

  @override
  String get boardName => 'Board Name:';

  @override
  String get description => 'Description:';

  @override
  String get create => 'Create';

  @override
  String get update => 'Update';

  @override
  String get toDo => 'To - Do';

  @override
  String get createdAt => 'Created At';

  @override
  String get neww => 'New';

  @override
  String get inProgress => 'In - Progress';

  @override
  String get aTaskStatusCannotBeChangedToDoneUntilTheTimeIsLogged => 'A task\'s status cannot be changed to Done until the time is logged.';

  @override
  String get close => 'Close';

  @override
  String get done => 'Done';

  @override
  String get task => 'Task';

  @override
  String get title => 'Title';

  @override
  String get timeLog => 'Time Log';

  @override
  String get ok => 'Ok';

  @override
  String get cancel => 'Cancel';

  @override
  String get updateTime => 'Update Time';

  @override
  String get addTime => 'Add Time';

  @override
  String get writeHere => 'Write here...';
}
