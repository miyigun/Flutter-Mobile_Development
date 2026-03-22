import 'package:expansion_panel/model/item_model.dart';

const writer1 = """
    Nâzım Hikmet (d.14 Ocak 1902; Selanik, Osmanlı İmparatorluğu – ö. 3 Haziran 1963; Moskova, SSCB), Türk şair ve yazardır. Şiirleri elliden fazla dile çevrilmiş ve eserleri birçok ödül almıştır. Türkiye'de serbest nazımın ilk uygulayıcısı ve çağdaş Türk şiirinin en önemli isimlerindendir. Uluslararası bir üne ulaşmıştır ve dünyada 20. yüzyılın en gözde şairleri arasında gösterilmektedir.
  """;

const writer2 = """
    1942'de babasının askerlik görevini yaptığı Çatalca'da dünyaya geldi. Azerbaycan kökenli olan ailesinin soyadı Gürus idi. İlk şiirlerinde de takma adı olan "Ataol Gürus'u" kullanmıştır. Aile, soyadını daha sonra Behramoğlu olarak değiştirmiştir. Babası yüksek ziraat mühendisi Haydar Behramoğlu, annesi İsmet Hanım’dır. “Nihat Behram” olarak tanınan gazeteci ve şair Mustafa Nihat Behramoğlu, Diş hekimi Yusuf Turan Behramoğlu ve avukat Namık Kemal Behramoğlu’nun ağabeyidir.
  """;

const writer3 = """
    Attilâ İlhan, tam adıyla Attilâ Hamdi İlhan,[1][2] (15 Haziran 1925, İzmir - 10 Ekim 2005, İstanbul)[5], Türk şair, romancı, düşünür, deneme yazarı, gazeteci, senarist ve eleştirmen. Entelektüel çalışmalarıyla Türk edebiyat ve düşünce dünyasına önemli katkıları olmuştur.
  """;

const writer4 = """
    Mehmet Arif Nihat Asya[1] (7 Şubat 1904, Çatalca, İstanbul - 5 Ocak 1975, Ankara),[2] Türk şair, öğretmen ve siyasetçidir.
    Cumhuriyet dönemi Türk şiirinin önemli temsilcilerindendir. Sade bir üslupla millî değerleri ve dini heyecanları işleyen şiirler yazmıştır. "Bayrak, Bir Bayrak Rüzgâr Bekliyor, Fetih Davulları, Selimler, Kubbeler, Süleymaniye" en tanınmış şiirleridir.[3] Bayrak şiirinden dolayı Türk edebiyatında Bayrak şairi olarak da anılır.[4] 9. dönem TBMM'de milletvekili olarak görev yapmıştır.
  """;

const writer5 = """
    Orhan Veli Kanık (13 Nisan 1914, İstanbul – 14 Kasım 1950, İstanbul), daha çok Orhan Veli olarak tanınan Türk şairdir. Melih Cevdet ve Oktay Rifat ile birlikte yenilikçi Garip akımının kurucusu olan Kanık, Türk şiirindeki eski yapıyı temelinden değiştirmeyi amaçlayarak sokaktaki adamın söyleyişini şiir diline taşıdı.[3] Şair otuz altı yıllık yaşamına şiirlerinin yanı sıra hikâye, deneme, makale ve çeviri alanında birçok eser sığdırdı.
  """;

final List<Item> items=[
  Item(header:  'Nazım Hikmet', body: writer1),
  Item(header:  'Ataol Behramoğlu', body: writer2),
  Item(header:  'Attila İlhan', body: writer3),
  Item(header:  'Arif Nihat Asya', body: writer4),
  Item(header:  'Orhan Veli Kanık', body: writer5),
];

