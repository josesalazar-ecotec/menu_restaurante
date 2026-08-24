# Menú de Restaurante — Flutter

Autor: Jose Salazar Campodonico
Materia: Programación IV
Período: Bimestre 4 - 2026
Actividad: Integradora 1
Repositorio: https://github.com/josesalazar-ecotec/menu_restaurante

## Descripción

Desarrollo una aplicación móvil en Flutter llamada El Sabor Ecuatoriano. La app muestra un menú de restaurante con entradas, platos fuertes y bebidas, información de contacto del local y un botón que revela el plato especial del día con un contador de segundos que indica cuánto tiempo lleva visible.

## Proceso

Para comenzar verifico que tengo Git instalado en mi equipo con Windows ejecutando git --version en la terminal, lo cual me confirma que cuento con la versión 2.54.0. Luego abro Visual Studio Code e instalo la extensión oficial de Flutter desde el Marketplace. Una vez instalada presiono Ctrl + Shift + P, selecciono Flutter: New Project y como no tengo el SDK descargado elijo la opción Download SDK apuntando a la carpeta C:\Flutter.

Cuando termina la descarga VS Code me pregunta si agrego Flutter al PATH del sistema y acepto. Sin embargo al abrir una terminal nueva y ejecutar flutter --version el comando no es reconocido. Investigo el problema y descubro que Windows truncó el PATH automáticamente al superar el límite de 1024 caracteres con el comando setx. Lo soluciono abriendo las variables de entorno del sistema mediante sysdm.cpl, localizo la variable Path y agrego manualmente la ruta C:\Flutter\flutter\bin. Después de reiniciar la terminal confirmo que Flutter 3.47.1 está correctamente instalado.

Con Flutter funcionando creo el proyecto desde VS Code con el nombre menu_restaurante en la ruta de mis clases. VS Code genera toda la estructura del proyecto incluyendo las carpetas lib, android, ios y web junto con el archivo pubspec.yaml. Luego creo el repositorio público en GitHub sin inicializar README ni .gitignore ya que Flutter los genera automáticamente, y conecto el proyecto local con los comandos git init, git add, git commit, git branch y git push.

Para el desarrollo de la pantalla principal reemplazo el contenido de lib/main.dart con el código de la aplicación. Implemento un MaterialApp con tema personalizado en rojo, un Scaffold con AppBar, un banner de bienvenida usando Container, las secciones del menú usando ListTile con CircleAvatar para los íconos y una sección de información del restaurante usando Row. Utilizo StatefulWidget para manejar el estado del botón interactivo y dart:async para el timer del contador.

Instalo el paquete externo google_fonts ejecutando flutter pub add google_fonts en la terminal. El comando instala la versión 8.2.1 junto con 28 dependencias adicionales. Aplico la fuente Poppins en toda la aplicación lo cual le da una tipografía más moderna y uniforme. Verifico que pubspec.yaml muestra correctamente google_fonts en la sección de dependencias.

Antes de configurar el emulador pruebo la app en Chrome con flutter run -d chrome y funciona correctamente mostrando el diseño completo y la interacción del botón. Luego instalo Android Studio Quail 3 y creo un dispositivo virtual Pixel 8 con Android 17.0 API 37 desde el Virtual Device Manager. Al intentar ejecutar la app en el emulador aparece el error Package ndk not found con la versión 28.2.13676358. Regreso a Android Studio, activo Show Package Details en SDK Tools y localizo e instalo esa versión exacta del NDK. También instalo las Android SDK Command-line Tools necesarias. Después de esos ajustes Gradle compila correctamente y la aplicación se instala y ejecuta en el emulador Pixel 8.

## Paquete utilizado

Uso google_fonts 8.2.1 para aplicar la fuente Poppins en toda la interfaz. Se instala con flutter pub add google_fonts y se usa tanto en el tema global con GoogleFonts.poppinsTextTheme() como en cada texto con GoogleFonts.poppins().

## Cómo ejecutar el proyecto

Clonar el repositorio con git clone https://github.com/josesalazar-ecotec/menu_restaurante.git, entrar a la carpeta con cd menu_restaurante, instalar dependencias con flutter pub get y ejecutar con flutter run -d chrome para web o flutter run -d emulator-5554 para el emulador Android.