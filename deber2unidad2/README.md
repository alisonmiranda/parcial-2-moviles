# Deber 2 - Unidad 2: Pokédex con Arquitectura Limpia

## Descripción
Aplicación Flutter que consume la **PokeAPI** utilizando arquitectura limpia (Clean Architecture) con el patrón MVVM y Provider para el manejo de estado. Muestra información detallada de los primeros 20 Pokémon.

## API Utilizada
- **PokeAPI**: https://pokeapi.co/api/v2/pokemon
- Muestra los primeros 20 Pokémon con sus detalles completos

## Estructura del Proyecto

```
lib/
├── main.dart
└── src/
    ├── data/
    │   ├── datasources/
    │   │   ├── base_datasource.dart
    │   │   └── post_api_datasource.dart
    │   ├── models/
    │   │   └── post_model.dart
    │   └── repositories/
    │       ├── base_repository.dart
    │       └── post_repository_impl.dart
    ├── domain/
    │   ├── entities/
    │   │   └── pokemon_entity.dart
    │   └── usecases/
    │       ├── get_pokemons_usecase.dart
    │       └── get_pokemon_by_id_usecase.dart
    └── presentation/
        ├── viewmodels/
        │   ├── base_viewmodel.dart
        │   └── pokemon_viewmodel.dart
        ├── views/
        │   ├── home_page.dart
        │   └── pokemon_detail_page.dart
        └── routes/
            └── app_routes.dart
```

## Capas de la Arquitectura

### 1. **Capa de Datos (Data Layer)**
- **DataSources**: Maneja la comunicación con la API usando el paquete `http`
- **Models**: Modelos de datos que extienden de las entidades del dominio
- **Repositories**: Implementación de los repositorios que conectan datasources con el dominio

### 2. **Capa de Dominio (Domain Layer)**
- **Entities**: Entidades del negocio (PokemonEntity con id, name, imageUrl, height, weight, types)
- **UseCases**: Casos de uso que contienen la lógica de negocio
  - `GetPokemonsUseCase`: Obtiene la lista de los primeros 20 Pokémon
  - `GetPokemonByIdUseCase`: Obtiene un Pokémon específico por ID

### 3. **Capa de Presentación (Presentation Layer)**
- **ViewModels**: Manejo de estado usando Provider (MVVM)
- **Views**: Interfaces de usuario
  - `HomePage`: Pokédex con lista de Pokémon (muestra imagen, nombre, tipos y número)
  - `PokemonDetailPage`: Detalle completo del Pokémon (imagen grande, tipos con colores, altura y peso)
- **Routes**: Configuración de rutas de navegación

## Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0       # Para consumir la API REST
  provider: ^6.1.0   # Para manejo de estado (MVVM)
```

## Instalación y Ejecución

1. Clonar el repositorio
2. Instalar dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

## Características

- ✅ Arquitectura Limpia (Clean Architecture)
- ✅ Patrón MVVM con Provider
- ✅ Inyección de dependencias manual
- ✅ Separación de responsabilidades
- ✅ Consumo de API REST
- ✅ Manejo de errores
- ✅ Estados de carga (loading)
- ✅ Temas personalizados (inspirados en diseño atómico)
- ✅ Esquema de colores Pokémon (rojo, amarillo, azul)
- ✅ Colores específicos por tipo de Pokémon
- ✅ Cards con elevación y sombras
- ✅ Interfaz limpia sin imágenes
- ✅ Navegación entre pantallas

## Funcionalidades

1. **Pokédex Principal**: Muestra los primeros 20 Pokémon con:
   - Imagen del Pokémon
   - Nombre
   - Número de Pokédex
   - Tipos con colores distintivos

2. **Detalle de Pokémon**: Al hacer clic en un Pokémon, se muestra:
   - Imagen grande
   - Número de Pokédex
   - Nombre
   - Tipos con colores personalizados por elemento
   - Altura (en metros)
   - Peso (en kilogramos)

3. **Recarga**: Botón para recargar la lista de Pokémon
4. **Manejo de errores**: Muestra mensajes de error si falla la conexión
5. **Colores por tipo**: Cada tipo de Pokémon tiene su color característico (fuego=naranja, agua=azul, etc.)

## Diseño Frontend

El proyecto utiliza un sistema de temas personalizado inspirado en la arquitectura de **Tarea Personalización Interfaces**:

### Temas (`themes/`)
- **esquema_color.dart**: Paleta de colores Pokémon (rojo #DC0A2D, amarillo #FFCB05, azul #3B4CCA) + colores por tipo
- **tipografia.dart**: Estilos de texto consistentes
- **tema_appbar.dart**: Configuración del AppBar
- **tema_botones.dart**: Estilos de botones
- **tema_general.dart**: Tema global de la aplicación

### Características del Diseño
- **Sin imágenes**: Uso de iconos y gradientes en lugar de imágenes de red
- **Cards con elevación**: Diseño Material 3 con sombras y bordes redondeados
- **Colores por tipo**: Cada tipo de Pokémon tiene su color característico
- **Gradientes**: Efectos visuales atractivos sin depender de imágenes
- **Responsive**: Diseño adaptable y limpio

## Notas

- El proyecto sigue la estructura genérica de arquitectura limpia
- La PokeAPI es pública y no requiere autenticación
- El frontend usa un sistema de temas personalizado sin imágenes
- Se obtienen los datos completos de cada Pokémon mediante llamadas individuales a la API
- Los iconos y colores reemplazan las imágenes para un diseño más liviano
