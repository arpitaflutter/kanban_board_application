import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get settings => 'Ajustes';

  @override
  String get appLanguage => 'Idioma de la aplicación';

  @override
  String get appTheme => 'Tema de la aplicación';

  @override
  String get kanbanBoard => 'Tablero Kanban';

  @override
  String get createBoard => 'Crear tablero';

  @override
  String get createNewTask => 'Crear nueva tarea';

  @override
  String get boardName => 'Nombre de la placa\n:';

  @override
  String get description => 'Descripción:';

  @override
  String get create => 'Crear';

  @override
  String get update => 'Actualizar';

  @override
  String get toDo => 'Hacer';

  @override
  String get createdAt => 'Creado en';

  @override
  String get neww => 'Nueva';

  @override
  String get inProgress => 'En curso';

  @override
  String get aTaskStatusCannotBeChangedToDoneUntilTheTimeIsLogged => 'El estado de una tarea no se puede cambiar a Listo hasta que se registre la hora.';

  @override
  String get close => 'Cerca';

  @override
  String get done => 'Hecho';

  @override
  String get task => 'Tarea';

  @override
  String get title => 'Título';

  @override
  String get timeLog => 'Registro de tiempo';

  @override
  String get ok => 'De acuerdo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get updateTime => 'Tiempo de actualizacion';

  @override
  String get addTime => 'Agregar tiempo';

  @override
  String get writeHere => 'Escribe aquí...';
}
