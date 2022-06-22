class TripItemModel {
  String title;
  String subTitle;
  String img;
  double star;

  ///
  TripItemModel({
    required this.title,
    required this.subTitle,
    required this.img,
    required this.star,
  });
}

List<TripItemModel> locations = [
  TripItemModel(
    title: "Gate Orchid Forest",
    subTitle:
        "Hai, Kawan Orchid! 👋Selamat beraktifitas kembali di weekdays ini, siapa yang kerasa kangen kalau ngelewatin gate ini??Dan coba yuk sebutin dikolom komentar kalian tinggal dimana? Siapa tau ada yang mau ikut nebeng liburan kan🥰",
    img: 'assets/img/asset2.jpg',
    star: 5,
  ),

  ///
  TripItemModel(
    title: "Stage",
    subTitle:
        "Duduk-duduk Manis sambil ditemani Doi menikmati keindahan Orchid Forest langsung saja kunjungi website dan appnya dijamin pengalaman alam yang luarbiasa.",
    img: 'assets/img/asset1.jpg',
    star: 3,
  ),

  ///
  TripItemModel(
    title: "Festival",
    subTitle:
        "Orchid Forest Cikole juga pernah menjadi salah satu tempat menggelar acara musik. Forest Orkestra pernah digelar di sini. Orchid Forest Cikole pernah digelar pada 2022.",
    img: 'assets/img/asset4.jpg',
    star: 4,
  ),

  ///
  TripItemModel(
    title: "Woodbridge",
    subTitle:
        "Kawan Orchid, Yuk kita tebak-tebakan, Wahana-wahana apa yang bisa dilewati dan ngasih kamu kesan romantis di Orchid? Yak betul, Woodbridge",
    img: 'assets/img/asset8.jpg',
    star: 5,
  ),

  ///
  TripItemModel(
    title: "Orchid Forest Cikole",
    subTitle:
        "Ga kerasa bulan Juni udah habis lagi, apa moment paling berkesan kawan orchid dibulan penuh kasih sayang ini? Kasih tau mimin di kolom komentar yuk! 🤗#orchidforestcikole #wisatalembangbandung #liburandiorchid— di Orchid Forest Cikole.",
    img: 'assets/img/asset12.jpg',
    star: 4,
  ),

  TripItemModel(
    title: "PINE Kitchen",
    subTitle:
        "Hallo Kawan Orchid Disini juga kami menyediakan Cafe Pine Kitchen, Kalo Temen-temn sekedar nongkrong dan ngopi sambil menikmati alam Bisa langsung Kesini yaa. ",
    img: 'assets/img/asset13.jpg',
    star: 5,
  ),
];
