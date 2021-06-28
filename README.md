# plataforma_app

Aplicacion de la plataforma de vivenciart

# Correr y buildear la aplicacion

Se esta utilizando la librería flutter_dotenv y manejando archivos de ambiente, para correrla y buildearla es necesario indicarle que main se corre:

###Ejemplo:

flutter run -t lib/main_dev_sergio.dart

flutter build apk -t lib/main_staging.dart

# Optimizar los svg

Instalar la herramienta svg cleaner

Ejecutarla sobre todos los svg para reducir su tamaño y eliminar las etiquetas no estandar y asegurarse que los estilos esten inline y no en otro formato


# Generador de codigo

Run "pub run build_runner build" to generate files into your source directory. Esto autogenera la serializacion json.

Desde la terminal se puede correr asi: flutter packages pub run build_runner build

Use the flag, to remove the files that are already generated, in some cases build_runner doesn't generate all the files because he get confused with some conflicts.
— delete-conflicting-outputs
And use the command, to keep watching all the changes that you make on the files, so you don't need to restar the build every time.
watch
Full command:
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch --delete-conflicting-outputs

# Generador de traducciones

Instalar el plugin flutter intl ya sea en vscode o android studio y se generaran automaticamente las nuevas entradas en los messages_<lnguaje>_<pais>.dart

# A Futuro:
Se copio el codigo fuente del plugin cupertino_list_tile y se actualizo a la versión nueva de flutter, a futuro habría que hacer un merge request en el package y pasar los cambios al mismo eliminando las clases implementadas.

# ALCANCE DE LA GENERACION DE CODIGO:

-json: Se crean los mapping de json con el generador
-database: Se utiliza moor, se generan las tablas y los daos con el generador
-Inyecciones: Se utiliza injectable, se genera lo necesario para que funcione el DI

# Internacionalizacion

Informacion sobre la localizacion y cambios a realizar en las aplicaciones: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
