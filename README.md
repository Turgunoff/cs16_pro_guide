# CS 1.6 Pro Guide 🎯

Counter-Strike 1.6 o'yinchilari uchun offline mobil qo'llanma - konsol kodlari, xarita strategiyalari, pro o'yinchilar ma'lumotlari va wallbang pozitsiyalari bilan.

## 📱 Loyiha haqida

Bu ilova Counter-Strike 1.6 o'yinchilari uchun maxsus yaratilgan offline mobil qo'llanma. Ilova internet talab qilmaydi va barcha ma'lumotlar mahalliy saqlanadi.

## ✨ Asosiy xususiyatlar

- 🎯 **Konsol kodlari** - 100+ foydali konsol kodi
- 🗺️ **Xaritalar** - 6 ta asosiy xarita bilan wallbang joylari
- ⚙️ **Sozlamalar** - Crosshair va config sozlamalari
- 👥 **Pro o'yinchilar** - Mashhur o'yinchilar ma'lumotlari
- 🏆 **Turnirlar** - Tarixiy turnirlar va chempionlar
- 📱 **Offline ishlash** - Internet talab qilmaydi
- 🔍 **Qidiruv** - Barcha bo'limlar bo'yicha qidiruv
- ⭐ **Sevimlilar** - Sevimli kodlar va xaritalar
- 📤 **Ulashish** - Ma'lumotlarni boshqalar bilan ulashish

## 🛠️ Texnologiyalar

- **Framework**: Flutter
- **Platformalar**: Android, iOS
- **Ma'lumotlar bazasi**: SQLite
- **Til**: O'zbek (Lotin)
- **Rejim**: Offline

## 📦 Dependencies

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

## 🚀 O'rnatish

1. **Repository ni klonlang**:

   ```bash
   git clone https://github.com/yourusername/cs16_pro_guide.git
   cd cs16_pro_guide
   ```

2. **Dependencies ni o'rnating**:

   ```bash
   flutter pub get
   ```

3. **Ilovani ishga tushiring**:
   ```bash
   flutter run
   ```

## 📁 Loyiha tuzilishi

```
lib/
├── main.dart                 # Asosiy fayl
├── models/                   # Ma'lumotlar modellari
├── screens/                  # Ekranlar
├── widgets/                  # Qayta ishlatiladigan widgetlar
├── services/                 # Xizmatlar
├── utils/                    # Yordamchi funksiyalar
└── data/                     # Ma'lumotlar fayllari

assets/
├── images/                   # Rasm fayllari
│   ├── maps/                # Xarita rasmlari
│   ├── players/             # O'yinchilar rasmlari
│   └── wallbangs/           # Wallbang rasmlari
└── data/                    # JSON ma'lumotlar
```

## 🎨 Dizayn

Ilova Counter-Strike 1.6 ruhida dark theme bilan yaratilgan:

- **Primary**: #FF6B35 (Counter-Strike orange)
- **Secondary**: #2C3E50 (Dark blue)
- **Background**: #1A1A1A (Dark)
- **Text**: #FFFFFF (White)

## 📊 Ma'lumotlar

- **Konsol kodlari**: ~100 ta
- **Xaritalar**: 6 ta asosiy
- **Pro o'yinchilar**: 20-25 ta
- **Turnirlar**: 15-20 ta major

## 🔧 Rivojlantirish

### Texnik talablar

- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio / VS Code
- Git

### Ishlab chiqish jarayoni

1. **1-bosqich**: Core Features (Navigation, Console codes, Database)
2. **2-bosqich**: Maps (Interactive wallbang markers)
3. **3-bosqich**: Content (Pro players, Tournaments, Settings)
4. **4-bosqich**: Polish (UI/UX, Performance, Testing)

## 📝 Texnik hujjat

Batafsil texnik hujjat uchun [TECHNICAL_SPECIFICATION.md](TECHNICAL_SPECIFICATION.md) faylini ko'ring.

## 🤝 Hissa qo'shish

1. Fork qiling
2. Feature branch yarating (`git checkout -b feature/AmazingFeature`)
3. O'zgarishlarni commit qiling (`git commit -m 'Add some AmazingFeature'`)
4. Branch ga push qiling (`git push origin feature/AmazingFeature`)
5. Pull Request yarating

## 📄 Litsenziya

Bu loyiha MIT litsenziyasi ostida tarqatiladi. Batafsil ma'lumot uchun [LICENSE](LICENSE) faylini ko'ring.

## 📞 Aloqa

- **Email**: your.email@example.com
- **Telegram**: @yourusername
- **GitHub**: [@yourusername](https://github.com/yourusername)

## 🙏 Minnatdorchilik

- Counter-Strike 1.6 jamoasi
- Flutter jamoasi
- Barcha beta testchilar

---

**Yaratilgan**: 2024  
**Versiya**: 1.0.0  
**Rivojlantiruvchi**: CS 1.6 Pro Guide Team
