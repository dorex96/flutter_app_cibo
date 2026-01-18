# 🍽️ Cibo

Tieniti in forma senza stress: calcola le porzioni, i grammi da prelevare e tieni traccia dei tuoi piatti… tutto offline, con semplicità! 😄

![Flutter](https://img.shields.io/badge/Flutter-Ready-blue?logo=flutter)
![Piattaforme](https://img.shields.io/badge/iOS%20%26%20Android-Supportate-green)
![Versione](https://img.shields.io/badge/Versione-0.1.0-green)
[![Codemagic build status](https://api.codemagic.io/apps/6969689ced3b3cf5c7be53ae/6969689ced3b3cf5c7be53ad/status_badge.svg)](https://codemagic.io/app/6969689ced3b3cf5c7be53ae/6969689ced3b3cf5c7be53ad/latest_build)
![Offline](https://img.shields.io/badge/Funziona-Offline-success)
![License](https://img.shields.io/badge/License-MIT-blue)

---

## 📑 Indice
- [Introduzione](#introduzione)
- [Funzionalità](#funzionalità)
- [Come funziona](#come-funziona)
- [Installazione](#installazione)
- [Struttura del progetto](#struttura-del-progetto)
- [Sviluppo](#sviluppo)
- [Roadmap](#roadmap)
- [FAQ](#faq)
- [Contribuire](#contribuire)
- [Licenza](#licenza)

---

## 📖 Introduzione
Quante volte hai preparato più porzioni per i prossimi giorni e poi, davanti al frigo, ti sei chiesto: "Ok, ma oggi quanti grammi devo prelevare?" 🤔

**flutter_app_cibo** nasce esattamente per questo: semplificare le piccole noie quotidiane di chi cucina in anticipo. Inserisci il peso del contenitore, il peso totale (contenitore + cibo), il peso di una porzione, e l'app ti dice quante porzioni hai e quanti grammi prelevare di volta in volta. Tutto rimane sul tuo dispositivo, senza internet.

👨🏻‍🍳 È un progetto personale, reso pubblico perché magari può essere utile anche a te!

---

## ✨ Funzionalità
- 📦 Registra i piatti che hai in frigo (nome, peso del contenitore, peso totale, peso porzione)
- 🧮 Calcolo automatico delle porzioni disponibili e dei grammi da prelevare
- 🔁 Aggiorna il peso totale nel tempo (per essere super precisi)
- 📴 Funziona completamente offline
- 🎨 Supporto tema chiaro/scuro
- 🌐 Localizzazione multi-lingua (Italiano, English)
- 🧑‍🍳 Interfaccia semplice e pensata per uso quotidiano

---

## 🔧 Come funziona
1. Crea un nuovo "piatto" indicando:
	- Nome (es. "Ceci cotti")
	- Peso del contenitore (mettiamolo subito, così non lo dimentichiamo!)
	- Peso totale del contenitore + cibo
	- Peso di una porzione
2. L'app calcola:
	- Quante porzioni hai in totale
	- Quanti grammi prelevare ora/in futuro
3. Quando il peso totale cambia (condensa? piccole variazioni?), aggiorni il dato e il calcolo resta corretto.

---

## 💻 Installazione

### Prerequisiti
- Flutter SDK (versione 3.9.0+) - [Installa Flutter](https://flutter.dev/docs/get-started/install)
- Dispositivo iOS (macOS) o Android per il testing

### Esecuzione locale

```bash
# Clone il repository
git clone https://github.com/your-username/flutter_app_cibo.git
cd flutter_app_cibo

# Scarica le dipendenze
flutter pub get

# Genera i file di localizzazione
flutter gen-l10n

# Esegui l'app
flutter run
```

### Build per il rilascio

```bash
# iOS
flutter build ios

# Android
flutter build apk
flutter build appbundle
```

---

## 📁 Struttura del progetto

```
lib/
├── bloc/					 # BLoC (Business Logic)
|	└── elenco_contenitori_frigo_screen/
├── config/                  # Configurazioni dell'app
│   ├── app_router.dart      # Configurazione routing
│   └── app_theme.dart       # Configurazione tema
├── constants/               # Costanti dell'applicazione
│   ├── app_constants.dart   # Costanti generali
│   └── theme_constants.dart # Costanti tema
├── cubit/                   # BLoC (Business Logic)
│   └── theme_cubit/
│       ├── theme_cubit.dart
│       └── theme_state.dart
├── l10n/                    # Localizzazione
│   ├── app_en.arb
│   ├── app_it.arb
│   └── app_localizations.dart
├── models/                  # Modelli di dati
│	└── entities/			 # Entità
│		└── contenitore_entity.dart
├── objectbox/               # File generati automaticamente per objectbox
├── repositories/            # Raccoglitori di dati
├── screens/                 # Schermate dell'app
│   ├── elenco_contenitori_frigo_screen.dart
|	└── dettaglio_contenitore_frigo_screen
├── services/                # Funzionalità di servizio
├── widgets/                 # Widget riutilizzabili
|	├── contenitore_frigo_widget.dart
|	└── input_dettaglio_contenitore_widget.dart
├──	theme/                   # File dei temi
└── main.dart                # Punto di ingresso
```

---

## 🚀 Sviluppo

### Aggiungere una nuova dipendenza

```bash
flutter pub add package_name
```

### Linting e formattazione

```bash
# Analizza il codice
dart analyze

# Formatta il codice
dart format .

# Applica fix automatici
dart fix --apply
```

### Generare traduzioni

```bash
flutter gen-l10n
```

### Hotload durante lo sviluppo

```bash
flutter run
# Premi 'r' per hot reload
# Premi 'R' per hot restart
```

---

## 📚 Convenzioni di codice

- Segui la [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Usa nomi significativi per variabili e funzioni
- Aggiungi commenti di documentazione per le API pubbliche
- Limita le funzioni a una singola responsabilità
- Utilizza const quando possibile
- Preferisci null safety

---

## 🗺️ Roadmap

- ✅ v1.0.0:
  - Inserimento e rimozione di contenitori
  - Modifica dei contenitori esistenti
  - Elenco contenitori in frigo

Hai un'idea? Apri una [issue](../../issues) e parliamone!

---

## ❓ FAQ

**Serve internet per utilizzare l'applicazione?**
No: funziona interamente offline.

**I dati sono salvati online?**
No: tutto rimane sul dispositivo.

**È solo in italiano?**
Per ora italiano e inglese.

---

## 🤝 Contribuire

Le PR sono benvenute! 🧑‍💻

Per contribuire:
1. Fai un fork del repository
2. Crea un branch per la tua feature/fix: `git checkout -b feature/amazing-feature`
3. Implementa e testa localmente
4. Apri una Pull Request con una descrizione chiara

Prima di aprire una PR, assicurati di:
- Formattare il codice: `dart format .`
- Eseguire l'analisi: `dart analyze`
- Descrivi chiaramente le modifiche effettuate.

---

## 📜 Licenza

Questo progetto è licenziato sotto la MIT License - vedi il file [LICENSE](LICENSE) per i dettagli.

---

## 📧 Contatti

- 📝 Apri una [issue](../../issues) per segnalare bug o suggerire funzionalità

---

Grazie per aver provato **Cibo**! Buone porzioni e buon appetito! 🍲
