# Sofra - Flutter Mini Katalog Uygulaması

Sofra, Flutter ile geliştirilmiş modern görünümlü bir mini yemek katalog uygulamasıdır. Uygulamada yemekler kategoriye göre listelenebilir, ürün detayları görüntülenebilir ve sepete ürün ekleme akışı simüle edilebilir.

## Proje Amacı

Bu projenin amacı Flutter temel yapılarını kullanarak küçük ölçekli fakat düzenli bir mobil uygulama geliştirmektir. Proje; widget yapısı, sayfa geçişleri, model kullanımı, statik veri yönetimi, GridView listeleme ve temel state yönetimi konularını uygulamalı olarak göstermektedir.

## Özellikler

- Modern restoran / yemek katalog arayüzü
- Ana sayfada yemek kartları
- GridView ile ürün listeleme
- Kategori filtreleme
  - Tümü
  - Ana Yemek
  - Başlangıç
  - Tatlı
  - İçecek
- Yemek adı veya kategoriye göre arama
- Ürün detay ekranı
- Sepete ürün ekleme simülasyonu
- Sepet ekranı
- Puan, kalori, hazırlık süresi ve fiyat bilgisi gösterimi
- Düzenli klasör yapısı

## Kullanılan Teknolojiler

- Flutter
- Dart
- Material Design
- StatelessWidget / StatefulWidget
- Navigator ile sayfa geçişleri
- GridView
- Model sınıfı kullanımı
- Statik veri listesi

## Flutter Sürümü

Projede Flutter SDK kullanılmıştır.

> Kendi bilgisayarındaki net Flutter sürümünü görmek için terminalde şu komutu çalıştırabilirsin:

```bash
flutter --version
```

README tesliminden önce bu bölüme kendi Flutter sürümünü yazman önerilir.

Örnek:

```text
Flutter 3.x.x
Dart 3.x.x
```

## Proje Klasör Yapısı

```text
lib/
├── data/
│   └── food_data.dart
├── models/
│   └── food_model.dart
├── screens/
│   ├── cart_screen.dart
│   ├── food_detail_screen.dart
│   └── home_screen.dart
├── theme/
│   └── app_theme.dart
├── widgets/
│   └── food_card.dart
└── main.dart
```

## Ekran Görüntüleri

Proje tesliminde ekran görüntüleri eklenmelidir. Önerilen klasör yapısı:

```text
screenshots/
├── home.png
├── detail.png
└── cart.png
```

README içine ekran görüntüsü eklemek için aşağıdaki alanları kullanabilirsin:

```md
![Ana Sayfa](screenshots/home.png)
![Detay Sayfası](screenshots/detail.png)
![Sepet Sayfası](screenshots/cart.png)
```

## Kurulum ve Çalıştırma

Projeyi bilgisayarına klonla:

```bash
git clone https://github.com/kullanici-adin/sofra.git
```

Proje klasörüne gir:

```bash
cd sofra
```

Flutter bağımlılıklarını yükle:

```bash
flutter pub get
```

Projeyi çalıştır:

```bash
flutter run
```

## Android Emülatörde Çalıştırma

Android Studio üzerinden bir emülatör başlatıldıktan sonra terminalde şu komut kullanılabilir:

```bash
flutter devices
flutter run
```

## Veri Yapısı

Uygulamadaki yemek verileri `lib/data/food_data.dart` dosyasında statik olarak tutulmaktadır. Her ürün için aşağıdaki bilgiler yer alır:

- ID
- Yemek adı
- Açıklama
- Fiyat
- Görsel bağlantısı
- Kategori
- Puan
- Kalori
- Hazırlık süresi
- Popülerlik durumu

## Notlar

- Proje eğitim ve demo amacıyla hazırlanmıştır.
- Gerçek ödeme veya gerçek sipariş sistemi içermez.
- Sepet sistemi temel state yönetimi mantığını göstermek için simüle edilmiştir.
- Görseller demo amaçlı URL üzerinden kullanılmaktadır. Daha stabil bir yapı için görsellerin `assets/images/` klasörüne alınması önerilir.

## GitHub Teslim Kontrol Listesi

- [ ] Repository public olmalı
- [ ] Proje çalışır durumda olmalı
- [ ] README.md dosyası eklenmeli
- [ ] Flutter sürümü README içinde belirtilmeli
- [ ] Uygulama ekran görüntüleri eklenmeli
- [ ] Gereksiz build dosyaları GitHub'a yüklenmemeli

## GitHub'a Yükleme Komutları

İlk kez repository oluşturduktan sonra proje klasöründe şu komutlar kullanılabilir:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/kullanici-adin/sofra.git
git push -u origin main
```

Daha sonra güncelleme yapmak için:

```bash
git add .
git commit -m "Update project"
git push
```

## Geliştirici

Ahmet Yaşar
