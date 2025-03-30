# FoodBank Delivery App

FoodBank Delivery App es una aplicación móvil desarrollada en **Flutter** para gestionar la entrega de alimentos a personas necesitadas. El proyecto sigue una arquitectura modular y utiliza herramientas avanzadas para mantener un código limpio y escalable.

## 📌 Tecnologías y Herramientas

- **Flutter** (3.29.0 - gestionado con `fvm`)
- **Dart**
- **BLoC** (para la gestión del estado)
- **SQLite** (almacenamiento local)
- **Melos** (gestión de monorepo)
- **Pigeon** (comunicación con plataformas nativas)
- **Autenticación Biométrica**

## 📂 Estructura del Proyecto

```
foodbank-delivery-app/
│-- android/                 # Proyecto Android nativo
│-- ios/                     # Proyecto iOS nativo
│-- lib/                     # Código fuente principal
│   │-- core/                # Lógica compartida y configuración global
│   │-- features/            # Funcionalidades separadas por módulos
│   │   │-- auth/            # Módulo de autenticación
│   │   │-- delivery/        # Módulo de entregas
│   │   │-- user/            # Módulo de usuario
│   │-- main.dart            # Punto de entrada de la app
│-- packages/                # Paquetes internos (si aplica)
│-- test/                    # Pruebas unitarias y de widget
│-- pubspec.yaml             # Configuración de dependencias
│-- melos.yaml               # Configuración de Melos (monorepo)
│-- analysis_options.yaml    # Configuración de linting
```

El proyecto esta dividido en dos ambientes, develop y production, ambos representados por:
- main_develop.dart
- main_production.dart

Cada uno de ellos ya tiene seteado dentro de el la baseUrl a donde debe de apuntar.


## 🚀 Instalación y Configuración

### Requisitos previos
- Tener **Flutter 3.24.5** instalado (se recomienda gestionarlo con `fvm`)
- Tener `melos` instalado si el proyecto usa múltiples paquetes:
  ```sh
  dart pub global activate melos
  ```
- Configurar el entorno nativo con:
  ```sh
  flutter pub get
  melos bootstrap # Si el proyecto usa monorepo
  ```

### Ejecución
Para correr la aplicación en modo desarrollo:
```sh
flutter run
```
Si usas `fvm`, puedes ejecutar:
```sh
fvm flutter run
```

## 🛠️ Desarrollo
### Arquitectura
El proyecto sigue **Clean Architecture**, dividiendo la lógica en:
- **Presentación** (Widgets y BLoC)
- **Dominio** (Casos de uso y entidades)
- **Datos** (Repositorios y fuentes de datos)

### Pruebas
Para ejecutar las pruebas unitarias:
```sh
flutter test
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT. Puedes ver más detalles en el archivo `LICENSE`.

---
_¡Contribuciones y sugerencias son bienvenidas! 🎉_