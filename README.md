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

## Capturas subidas
01_flutter_doctor
Resultado del comando flutter doctor en la terminal confirmando que Flutter 3.47.1 está instalado correctamente en Windows.

02_proyecto_vscode
Explorador de VS Code mostrando la estructura completa del proyecto menu_restaurante con todas sus carpetas generadas.

03_app_pantalla_principal
Aplicación ejecutándose en Chrome mostrando el banner de bienvenida y las secciones del menú.

04_app_boton
Panel del plato especial visible en Chrome tras presionar el botón interactivo de la aplicación.

05_repositorio_github
Repositorio público creado en GitHub con el nombre menu_restaurante y visibilidad pública.

08_android_license
Pantalla de aceptación de licencias del Android SDK durante la configuración inicial de Android Studio.

09_android_studio_welcome
Pantalla de bienvenida de Android Studio Quail 3 ya instalado y listo para usar.

11_add_device
Asistente de creación de dispositivo virtual con el Pixel 8 seleccionado como emulador.

12_configure_pixel8
Configuración final del emulador Pixel 8 con sistema Android 17 API 37 listo para descargar.

14_emulador_corriendo
Emulador Pixel 8 encendido mostrando la pantalla de inicio de Android correctamente.

16_app_emulador_scroll
Aplicación ejecutándose en el emulador mostrando la sección de bebidas y el botón principal.

17_app_emulador_boton
Plato especial del día visible en el emulador tras presionar el botón interactivo de la app.

18_instalacion_google_fonts
Terminal mostrando la instalación exitosa del paquete google_fonts 8.2.1 con sus dependencias.

19_repositorio_github
Repositorio en GitHub con el historial de commits del proyecto completamente visible.

20_pubspec_google_fonts
Archivo pubspec.yaml abierto en VS Code con google_fonts agregado en la sección de dependencias.

## Actividad Integradora 2 — Navegación y Nuevos Widgets

Fecha: 30 de agosto de 2026

## Descripción

Continúo mejorando la aplicación desarrollada en la Actividad Integradora 1. Agrego navegación entre cuatro pantallas, imágenes de los platos generadas con inteligencia artificial, un carrito de pedidos interactivo, cambio de ícono de la aplicación y el paquete url_launcher. La aplicación mantiene la identidad visual de El Sabor Ecuatoriano con la paleta de colores rojo y crema.

## Nuevas funcionalidades

Implemento navegación fluida entre cuatro pantallas usando Navigator.push y Navigator.pop. Agrego un modelo de datos Plato para centralizar la información de cada plato del menú. Incorporo imágenes reales de los platos en la pantalla de menú y detalle. El carrito permite agregar, incrementar, decrementar y eliminar platos con confirmación mediante AlertDialog. El botón de favoritos en cada plato cambia de estado con setState. Los filtros de categoría en la pantalla de menú actualizan la lista en tiempo real.

## Pantallas desarrolladas

HomeScreen es la pantalla principal que muestra el logo del restaurante y tres botones de navegación hacia el menú, el carrito y la sección de nosotros. MenuScreen muestra la lista completa de platos con imágenes, precios y un sistema de filtros por categoría. DetalleScreen presenta la información completa de cada plato con dos vistas de imagen, contador de porciones y botón para agregar al carrito con SnackBar de confirmación. NosotrosScreen muestra el logo, descripción del restaurante, información de contacto y los valores institucionales. CarritoScreen permite gestionar los pedidos con controles de cantidad, eliminación con AlertDialog y confirmación del pedido.

## Widgets utilizados

Uso ListView.builder para la lista de platos y el carrito, Card para cada tarjeta de plato, Image.asset para mostrar las imágenes, IconButton para los favoritos y controles de cantidad, ElevatedButton para confirmar pedidos y navegar, FloatingActionButton para limpiar el carrito, Padding y SizedBox para el espaciado, Expanded para distribuir el espacio, Container para el banner y los filtros, CircleAvatar para los íconos de contacto y Divider para separar secciones.

## Interacciones implementadas

La navegación entre pantallas usa Navigator.push con MaterialPageRoute. El ícono de favorito cambia entre lleno y vacío con setState al tocarlo. Los filtros de categoría actualizan la lista de platos en tiempo real. El contador de porciones en el detalle incrementa y decrementa el precio total. El botón de agregar al carrito muestra un SnackBar de confirmación. La eliminación de un plato del carrito muestra un AlertDialog de confirmación. El botón de confirmar pedido muestra un AlertDialog y vacía el carrito.

## Funcionalidad con setState

Implemento setState en tres lugares principales. En MenuScreen actualizo la categoría seleccionada para filtrar los platos y el estado de favorito de cada plato. En DetalleScreen controlo el contador de porciones y el cambio entre las dos vistas de imagen del plato. En CarritoScreen manejo el incremento, decremento y eliminación de items, además de vaciar el carrito al confirmar el pedido.

## Paquete externo

Instalo url_launcher para abrir enlaces, correos y WhatsApp directamente desde la aplicación. También instalo flutter_launcher_icons para cambiar el ícono de la app en Android e iOS usando la imagen icon_app.png generada con inteligencia artificial.

## Personalización

El nombre de la aplicación es El Sabor Ecuatoriano definido en el MaterialApp. El ícono de la app fue generado con inteligencia artificial mostrando un tenedor y cuchara cruzados sobre fondo rojo con el nombre del restaurante, y se aplica en Android e iOS mediante flutter_launcher_icons. El logotipo aparece en la pantalla de inicio y en la pantalla de Nosotros. La paleta de colores mantiene el rojo #C0392B como color principal y el crema #FDF6EC como fondo.

## Capturas integradora 2

01_home — Pantalla principal con logo y botones de navegación hacia las demás secciones.
02_nosotros — Pantalla de información del restaurante con logo, descripción y datos de contacto.
03_menu_todas — Pantalla de menú mostrando todos los platos con imágenes y filtros de categoría.
04_menu_platos_fuertes — Filtro de platos fuertes activo mostrando solo esa categoría.
05_detalle_plato — Detalle de un plato con imagen, descripción, contador de porciones y botón de carrito.
06_carrito — Carrito de pedidos con lista de platos, controles de cantidad y total.
07_icono_app — Ícono personalizado de la aplicación generado con inteligencia artificial.

## Instrucciones para ejecutar

Clonar el repositorio con git clone https://github.com/josesalazar-ecotec/menu_restaurante.git, entrar a la carpeta con cd menu_restaurante, instalar dependencias con flutter pub get y ejecutar con flutter run -d chrome para web o flutter run -d emulator-5554 para el emulador Android.