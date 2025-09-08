# COUNTER-STRIKE 1.6 PRO GUIDE - TEXNIK TOPSHIRIQ

## 🎯 LOYIHA MAQSADI

Counter-Strike 1.6 o'yinchilari uchun offline mobil qo'llanma yaratish - konsol kodlari, xarita strategiyalari, pro o'yinchilar ma'lumotlari va wallbang pozitsiyalari bilan.

## 📱 TEXNIK PARAMETRLAR

- **Framework**: Flutter
- **Platformalar**: Android, iOS
- **Rejim**: Offline (barcha ma'lumotlar mahalliy)
- **Til**: O'zbek (Lotin)
- **Package nomi**: cs16_pro_guide
- **Ilova nomi**: CS 1.6 Pro Guide

## 🗂️ ILOVA STRUKTURASI

### 1. ASOSIY EKRAN (Home Screen)

```
┌─────────────────────────┐
│   CS 1.6 PRO GUIDE     │
├─────────────────────────┤
│  [🎯] KONSOL KODLARI    │
│  [🗺️] XARITALAR        │
│  [⚙️] SOZLAMALAR        │
│  [👥] PRO O'YINCHILAR   │
│  [🏆] TURNIRLAR         │
│  [ℹ️] ILOVA HAQIDA      │
└─────────────────────────┘
```

### 2. KONSOL KODLARI BO'LIMI

#### 2.1 Kategoriyalar:

- Cheat kodlar (sv_cheats 1 kerak)
- Qurol olish kodlari
- Bot boshqaruvi
- Server sozlamalari
- FPS optimizatsiya
- Bind kodlari

#### 2.2 Har bir kod uchun ma'lumotlar:

```json
{
  "title": "Kod nomi",
  "code": "sv_cheats 1",
  "description": "Cheatlarni yoqish",
  "category": "cheat",
  "usage": "Konsol orqali kiriting",
  "requirements": "sv_cheats 1 yoqilgan bo'lishi kerak"
}
```

#### 2.3 Xususiyatlar:

- Copy to clipboard tugmasi
- Qidiruv funksiyasi
- Kategoriya bo'yicha filter
- Sevimli kodlar

### 3. XARITALAR BO'LIMI

#### 3.1 Mavjud xaritalar:

- de_dust2
- de_inferno
- de_mirage
- de_train
- de_cache
- cs_office

#### 3.2 Har xarita uchun:

- Wallbang joylari (interactive rasm)
- Smoke pozitsiyalari
- Flash koordinatalari
- Camping spots
- Rush yo'llari
- Callout nomlari

#### 3.3 Wallbang ma'lumotlari:

```json
{
  "id": 1,
  "map": "de_dust2",
  "name": "Long doors to pit",
  "coordinates": { "x": 150, "y": 200 },
  "weapons": ["AK-47", "M4A1", "AWP"],
  "damage": "Medium",
  "difficulty": "Easy",
  "description": "Long doors orqali pit tomonga o'q",
  "image": "wallbang_dust2_1.png"
}
```

### 4. SOZLAMALAR BO'LIMI

#### 4.1 Crosshair sozlamalari:

- Pro o'yinchilar crosshair kodlari
- Rang tanlash
- O'lcham sozlash
- Preview funksiyasi

#### 4.2 Config fayllar:

- FPS maksimal
- Pro o'yinchilar config
- Low-end PC config
- Autoexec.cfg namunalari

#### 4.3 Bind kodlari:

- Buy binds
- Quick switch
- Jump throw
- Walk/Run toggle

### 5. PRO O'YINCHILAR BO'LIMI

```json
{
  "name": "f0rest",
  "realName": "Patrik Lindberg",
  "nickname": "f0rest",
  "country": "Sweden",
  "team": "SK Gaming",
  "position": "Rifler",
  "achievements": ["WCG 2006 Champion", "CPL 2005 World Tour"],
  "settings": {
    "sensitivity": "3.0",
    "crosshair": "cl_crosshair_size small",
    "resolution": "1024x768"
  },
  "biography": "Patrik Lindberg...",
  "photo": "forest.jpg"
}
```

### 6. TURNIRLAR BO'LIMI

#### 6.1 Kategoriyalar:

- Major turnirlar
- Tarixiy momentlar
- Chempionlar
- Eng yaxshi o'yinlar

#### 6.2 Turnir ma'lumotlari:

```json
{
  "name": "CPL World Tour 2005",
  "date": "2005",
  "location": "USA",
  "prizePool": "$150,000",
  "winner": "SK Gaming",
  "participants": 16,
  "highlights": "...",
  "finalScore": "16-14"
}
```

## 🎨 DIZAYN TALABLARI

### UI/UX Prinsiplari:

**Rang sxemasi**: Dark theme (CS 1.6 ruhida)

- Primary: #FF6B35 (Counter-Strike orange)
- Secondary: #2C3E50 (Dark blue)
- Background: #1A1A1A (Dark)
- Text: #FFFFFF (White)

**Fontlar**: Roboto/SF Pro
**Icons**: Material Design yoki Cupertino

### Responsive Design:

- Telefon: Portrait mode asosiy
- Tablet: Landscape qo'llab-quvvat
- Turli ekran o'lchamlari

## 🗄️ MA'LUMOTLAR BAZASI STRUKTURASI

### Local Storage (SQLite):

```sql
-- Konsol kodlari
CREATE TABLE console_codes (
  id INTEGER PRIMARY KEY,
  title TEXT,
  code TEXT,
  description TEXT,
  category TEXT,
  requirements TEXT,
  is_favorite BOOLEAN DEFAULT 0
);

-- Xaritalar
CREATE TABLE maps (
  id INTEGER PRIMARY KEY,
  name TEXT,
  display_name TEXT,
  image_path TEXT
);

-- Wallbang joylari
CREATE TABLE wallbangs (
  id INTEGER PRIMARY KEY,
  map_id INTEGER,
  name TEXT,
  x_coordinate REAL,
  y_coordinate REAL,
  weapons TEXT, -- JSON array
  damage_level TEXT,
  difficulty TEXT,
  description TEXT,
  FOREIGN KEY (map_id) REFERENCES maps (id)
);

-- Pro o'yinchilar
CREATE TABLE pro_players (
  id INTEGER PRIMARY KEY,
  name TEXT,
  real_name TEXT,
  country TEXT,
  team TEXT,
  position TEXT,
  achievements TEXT, -- JSON
  settings TEXT, -- JSON
  biography TEXT,
  photo_path TEXT
);
```

## 📦 FAYLLAR TUZILISHI

```
lib/
├── main.dart
├── models/
│   ├── console_code.dart
│   ├── map_model.dart
│   ├── wallbang.dart
│   ├── pro_player.dart
│   └── tournament.dart
├── screens/
│   ├── home_screen.dart
│   ├── console_codes_screen.dart
│   ├── maps_screen.dart
│   ├── map_detail_screen.dart
│   ├── settings_screen.dart
│   ├── pro_players_screen.dart
│   └── tournaments_screen.dart
├── widgets/
│   ├── code_card.dart
│   ├── wallbang_marker.dart
│   ├── player_card.dart
│   └── custom_app_bar.dart
├── services/
│   ├── database_service.dart
│   └── data_loader.dart
├── utils/
│   ├── constants.dart
│   └── helpers.dart
└── data/
    ├── console_codes.json
    ├── pro_players.json
    └── tournaments.json

assets/
├── images/
│   ├── maps/
│   │   ├── dust2.png
│   │   ├── inferno.png
│   │   └── mirage.png
│   ├── players/
│   │   ├── forest.jpg
│   │   └── neo.jpg
│   └── wallbangs/
│       ├── dust2_wallbang_1.png
│       └── inferno_wallbang_1.png
└── data/
    ├── console_codes.json
    ├── pro_players.json
    └── tournaments.json
```

## 🔧 TEXNIK TALABLAR

### Dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
  shared_preferences: ^2.2.2
  http: ^1.1.0
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.9
  url_launcher: ^6.2.1
  share_plus: ^7.2.1
  image_picker: ^1.0.4
```

### Performance:

- Lazy loading xarita rasmlari
- Image caching
- Smooth animations
- 60 FPS target

## ✨ XUSUSIYATLAR

### Asosiy funksiyalar:

- Offline ishlash - internet talab qilmaydi
- Qidiruv - barcha bo'limlar bo'yicha
- Copy to clipboard - kodlar uchun
- Favorites - sevimli kodlar/xaritalar
- Share - ma'lumotlarni ulashish
- Dark/Light theme toggle

### Advanced funksiyalar:

- Interactive xaritalar - wallbang nuqtalar ustiga bosish
- Crosshair preview - real-time ko'rish
- Config generator - shaxsiy config yaratish
- Backup/Restore - ma'lumotlarni saqlash

## 📊 MA'LUMOTLAR MIQDORI

### Konsol kodlari: ~100 ta

- Cheat: 20 ta
- Qurollar: 25 ta
- Bot: 15 ta
- Server: 20 ta
- FPS: 10 ta
- Bind: 10 ta

### Xaritalar: 6 ta asosiy

- Har birida 10-15 ta wallbang joyi
- 5-8 ta smoke pozitsiya
- Callout nomlari

### Pro o'yinchilar: 20-25 ta

### Turnirlar: 15-20 ta major

## 🎯 BOSQICHLAR

### 1-bosqich: Core Features

- Basic navigation
- Console codes bo'limi
- Local database setup

### 2-bosqich: Maps

- Xaritalar bo'limi
- Interactive wallbang markers
- Map detail screens

### 3-bosqich: Content

- Pro players bo'limi
- Tournaments section
- Settings screen

### 4-bosqich: Polish

- UI/UX improvements
- Performance optimization
- Testing va bug fixes

## 📏 SUCCESS METRICS

- Foydalanish qulayligi
- Offline ishlash tezligi
- Ma'lumotlarning to'liqligi
- Interface intuitivligi
- Ilova hajmi optimalligi (40MB gacha)

## 🚀 QO'SHIMCHA TAVSIYALAR

### Ilova rivojlantirish uchun:

1. **MVP (Minimum Viable Product)** yondashuvini qo'llang
2. **Agile methodology** dan foydalaning
3. **Version control** (Git) ni to'g'ri ishlatish
4. **Code review** jarayonini joriy etish
5. **Testing** strategiyasini ishlab chiqish

### Marketing va tarqatish:

1. **App Store** va **Google Play** optimizatsiyasi
2. **Screenshots** va **video preview** tayyorlash
3. **User feedback** tizimini joriy etish
4. **Analytics** qo'shish (Firebase Analytics)

### Texnik optimizatsiya:

1. **Code splitting** va **lazy loading**
2. **Image optimization** va **compression**
3. **Database indexing** va **query optimization**
4. **Memory management** va **performance monitoring**

---

**Yaratilgan sana**: 2024
**Versiya**: 1.0
**Muallif**: CS 1.6 Pro Guide Development Team
