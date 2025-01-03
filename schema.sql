create table etkinliklers
(
    id                     bigint unsigned auto_increment
        primary key,
    etkinlik_adi           varchar(255) not null,
    etkinlik_icerigi       varchar(255) not null,
    etkinlik_yeri          varchar(255) not null,
    etkinlige_katilacaklar varchar(255) not null,
    etkinligi_yonetenler   varchar(255) not null,
    etkinlik_resim         varchar(255) null,
    etkinlik_tarihi        date         not null,
    etkinlik_durum         varchar(255) not null,
    created_at             timestamp    null,
    updated_at             timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table kategorilers
(
    id           bigint unsigned auto_increment
        primary key,
    kategori_adi varchar(255) not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table kitap_durums
(
    id           bigint unsigned auto_increment
        primary key,
    kitap_adi    varchar(255) not null,
    kitap_durumu varchar(255) not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table kitaplar
(
    id             bigint unsigned auto_increment
        primary key,
    kitap_adi      varchar(255)                  not null,
    yazar          varchar(255)                  not null,
    yayin_yili     date                          not null,
    yayin_evi      varchar(255)                  not null,
    kitap_turu     bigint unsigned               not null,
    kitap_aciklama varchar(255)                  not null,
    kitap_durumu   varchar(255) default 'Mevcut' not null,
    created_at     timestamp                     null,
    updated_at     timestamp                     null,
    constraint kitaplar_kitap_turu_foreign
        foreign key (kitap_turu) references kategorilers (id)
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table yayinevleris
(
    id           bigint unsigned auto_increment
        primary key,
    yayinevi     varchar(255) not null,
    kitap_sayisi varchar(255) not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table yazarlars
(
    id         bigint unsigned auto_increment
        primary key,
    yazar_adi  varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table yetkilers
(
    id             bigint unsigned auto_increment
        primary key,
    yetki          varchar(255) not null,
    yetki_resmi    varchar(255) not null,
    yetki_izinleri varchar(255) not null,
    created_at     timestamp    null,
    updated_at     timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table uyelers
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255)    not null,
    soyad      varchar(255)    not null,
    sehir      varchar(255)    not null,
    dogum_yili date            not null,
    mail       varchar(255)    not null,
    telefon    varchar(200)    not null,
    yetki_id   bigint unsigned not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint uyelers_yetki_id_foreign
        foreign key (yetki_id) references yetkilers (id)
)
    collate = utf8mb4_unicode_ci;

create table odunc_kitaplars
(
    id                    bigint unsigned auto_increment
        primary key,
    uye_id                bigint unsigned      not null,
    odunc_alinma_tarihi   date                 not null,
    odunc_verilecek_tarih date                 not null,
    kitap_id              bigint unsigned      not null,
    geri_verme_tarihi     date                 null,
    durum                 tinyint(1) default 0 not null,
    created_at            timestamp            null,
    updated_at            timestamp            null,
    constraint odunc_kitaplars_kitap_id_foreign
        foreign key (kitap_id) references kitaplar (id),
    constraint odunc_kitaplars_uye_id_foreign
        foreign key (uye_id) references uyelers (id)
)
    collate = utf8mb4_unicode_ci;

create table zamani_gecen_kitaplars
(
    id         bigint unsigned auto_increment
        primary key,
    created_at timestamp null,
    updated_at timestamp null
)
    collate = utf8mb4_unicode_ci;

