# 🍽️ App del Cibo

Tieniti in forma senza stress: calcola le porzioni, i grammi da prelevare e tieni traccia dei tuoi piatti… tutto offline, con semplicità! 😄

![Flutter](https://img.shields.io/badge/Flutter-Ready-blue?logo=flutter)
![Piattaforme](https://img.shields.io/badge/iOS%20%26%20Android-Supportate-green)
![Versione](https://img.shields.io/badge/Versione-1.0.0-orange)
![Offline](https://img.shields.io/badge/Funziona-Offline-success)

---

## Indice
- [Introduzione](#introduzione)
- [Funzionalità](#funzionalità)
- [Come funziona](#come-funziona)
- [Guida rapida](#guida-rapida)
- [Esempio pratico](#esempio-pratico)
- [Roadmap](#roadmap)
- [FAQ](#faq)
- [Contribuire](#contribuire)

---

## Introduzione
Quante volte hai preparato più porzioni per i prossimi giorni e poi, davanti al frigo, ti sei chiesto: “Ok, ma oggi quanti grammi devo prelevare?” 🤔

App del Cibo nasce esattamente per questo: semplificare le piccole noie quotidiane di chi cucina in anticipo. Inserisci il peso del contenitore, il peso totale (contenitore + cibo), il peso di una porzione, e l’app ti dice quante porzioni hai e quanti grammi prelevare di volta in volta. Tutto rimane sul tuo dispositivo, senza internet.

👨🏻‍🍳 È un progetto personale, reso pubblico perché magari può essere utile anche a te!

---

## Funzionalità
- 📦 Registra i piatti che hai in frigo (nome, peso del contenitore, peso totale, peso porzione)
- 🧮 Calcolo automatico delle porzioni disponibili e dei grammi da prelevare
- 🔁 Aggiorna il peso totale nel tempo (per essere super precisi)
- 📴 Funziona completamente offline
- 🧑‍🍳 Interfaccia semplice e pensata per uso quotidiano

---

## Come funziona
1. Crea un nuovo “piatto” indicando:
	- Nome (es. “Ceci cotti”)
	- Peso del contenitore (mettiamolo subito, così non lo dimentichiamo!)
	- Peso totale del contenitore + cibo
	- Peso di una porzione
2. L’app calcola:
	- Quante porzioni hai in totale
	- Quanti grammi prelevare ora/in futuro
3. Quando il peso totale cambia (condensa? piccole variazioni?), aggiorni il dato e il calcolo resta corretto.

---

## Guida rapida
Requisiti:
- Flutter SDK installato
- Dispositivo/emulatore iOS o Android

Esecuzione locale:

```bash
flutter pub get
flutter run
```

Suggerimento: su iOS, apri il progetto in Xcode se ti serve configurare i profili; su Android, usa un emulatore o un device fisico con debug attivato.

---

## Esempio pratico
Stasera e per i prossimi due pranzi vuoi mangiare Ceci 😋. Usi 100 g (da secchi) a porzione, quindi prepari in totale 300 g. Oggi ne mangi 100 g e il resto finisce in frigo.

Il dubbio del giorno dopo:
“Quanti grammi devo prelevare?”

Facile: (peso totale – peso del contenitore) / numero di porzioni restanti.

Il problema? Ieri sera non avevi voglia di pesare il contenitore (capita!). Con l’app basta averlo inserito una volta e sei a posto: il calcolo è sempre pronto 👍

---

## Roadmap
- ✅ v1.0.0: registrazione piatti, calcolo porzioni, aggiornamento peso
- ⏳ Prossimi passi (idee):
  - Storico prelievi
  - Promemoria/Notifiche
  - Tag/Filtri per piatti
  - Esportazione dati

Hai un’idea? Apri una issue e parliamone!

---

## FAQ
- Serve internet per utilizzare l’applicazione? No: funziona interamente offline.
- I dati sono salvati online? No: tutto rimane sul dispositivo.
- È solo in italiano? Per ora sì, ma le traduzioni sono benvenute!

---

## Contribuire
Le PR sono benvenute! 🧑‍💻
1. Fai un fork del repository
2. Crea un branch per la tua feature/fix
3. Implementa e testa localmente
4. Apri una Pull Request con una breve descrizione

Se vuoi discutere prima un’idea, apri una issue: meglio progettare bene che riparare dopo 😉

---

Grazie per aver provato App del Cibo. Buone porzioni e buon appetito! 🍲