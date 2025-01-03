# Veri Tabanı Tabloları ve Basitçe Açıklamaları

- ### etkinliklers : Burada etkinliklere ait tüm bilgiler tutuluyor
- ### Kategoriler : Bu tabloya kitap türlerini ekliyoruz , kitaplar tablosundaki "kitap_turu" kolonu buraya bağlı
- ### kitaplar : Eklenen tüm kitapların bilgisi burada bulunuyor , "kitap_durumu" sütunu default olarak mevcut, kitap ödünç alındıysa "ödünç alınmış" olarak değişiyor. "odunc_kitaplars" tablosunda "geri_verme_tarihi" oluşturulduysa mevcut olarak geri görünüyor.
- ### odunc_kitaplars : bu tabloda iki tane foreing key tanımlı . Bu foreing keyler "uyeler" tablosundaki id'ye ve "kitaplars" tablosunun id'sine bağlı.
- ### uyelers : genel üyelerin bilgisi bulunuyor, "yetki" kolonunu foreign key olarak tanımladım ve bu kolon "yetkiler"  tablosunun id'sine bağlı.
- ### yetkilers: burada üyeler için yetkiler tanımlanıyor , "yetki_resmi" kolonuna girilen resim üyelerin profil resmi oluyor.
