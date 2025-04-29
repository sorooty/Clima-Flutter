# 🌦️ Clima App – Application Météo en Flutter

Clima App est une application mobile moderne développée avec **Flutter** et **Dart** permettant aux utilisateurs d’obtenir la météo actuelle de leur localisation ou d'une ville de leur choix. Elle consomme l'API [OpenWeatherMap](https://openweathermap.org/api) et illustre l'intégration de données météo avec une UI réactive et stylée.

---

## 📱 Capture d’écran (à venir)

![ClimAppImage](images/ClimApp_Logo.png)

---

## 🚀 Fonctionnalités

- 🔍 **Recherche météo** par nom de ville.
- 📍 **Localisation automatique** pour obtenir la météo actuelle.
- 🌡️ Affichage des **températures**, **conditions météo** et **icônes** dynamiques.
- 🧭 Intégration de l’API OpenWeatherMap.
- 📱 Responsive UI avec des images de fond selon la météo.
- 💬 Messages météo personnalisés en fonction de la température.

---

## 🛠️ Stack technique

- **Framework** : Flutter (Dart)
- **API** : OpenWeatherMap REST API
- **State Management** : setState (local), précurseur à Provider/BLoC si évolutions
- **Outils de développement** : Visual Studio Code, Android Studio

---

## 📁 Structure des fichiers

```
lib/
├── main.dart
├── screens/
│   ├── loading_screen.dart
│   ├── location_screen.dart
│   └── city_screen.dart
├── services/
│   ├── weather.dart
│   └── location.dart
├── utilities/
│   └── constants.dart
assets/
└── images/
    └── location_background.jpg
```

---

## 🔑 Configuration API

1. Crée un compte sur [OpenWeatherMap](https://openweathermap.org/).
2. Récupère ta clé API.
3. Ajoute-la dans `weather.dart` :
   ```dart
   const String apiKey = 'TON_API_KEY_ICI';
   ```

---

## ▶️ Lancer l’application

```bash
flutter pub get
flutter run
```

> Assure-toi d'avoir un émulateur Android/iOS ouvert ou un appareil connecté.

---

## 🎯 Objectifs pédagogiques

Cette application a été développée dans le cadre de ma formation sur Flutter (Angela Yu, Udemy). Elle m’a permis de :
- Approfondir mes compétences en Flutter et Dart.
- Comprendre la gestion d'état local.
- Intégrer une API REST dans une app mobile.
- Manipuler les widgets dynamiques et les entrées utilisateur.

---

## 🔄 Améliorations prévues

- [ ] Ajouter un système de thème jour/nuit.
- [ ] Intégrer des animations météo (pluie, neige…).
- [ ] Gestion d’erreurs avancée (ville inconnue, déconnexion réseau).
- [ ] Passage à Provider pour une meilleure gestion d’état.

---

## 👤 Auteur

**Sorooty**  
Étudiant ingénieur passionné par le développement mobile, web, IA et les technologies cloud.  
📧 Contact : mailto:senseybalde@gmail.com  
🔗 [Profil GitHub](https://github.com/sorooty)

---

## 📝 Licence

Ce projet est en open-source sous licence MIT.  
Tu peux l’utiliser, le modifier ou le partager librement.

