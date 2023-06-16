class ProductGarbage {
  final String imagePath;
  final String name;
  final String id;
  final String desc;
  final String type;
  final String gambar;

  ProductGarbage(
      {required this.imagePath,
      required this.name,
      required this.desc,
      required this.id,
      required this.type,
      required this.gambar});
}

final List<ProductGarbage> productsam = [
  ProductGarbage(
      imagePath: "assets/paper-bin.png",
      name: "Kertas",
      desc:
          "Kertas adalah bahan yang terbuat dari serat tumbuhan yang diolah. Dalam daur ulang kertas, kertas bekas dikumpulkan, dihancurkan menjadi serat-serat kecil, dan dicampur dengan air untuk membentuk bubur kertas. Bubur kertas ini kemudian disaring, dipadatkan, dan dikeringkan menjadi lembaran kertas baru. Kertas memiliki sifat terurai secara alami, terutama jika terkena kelembaban dan mikroorganisme pengurai. Dalam kondisi yang sesuai, kertas dapat terurai dalam waktu sekitar 2 hingga 6 minggu",
      id: "paper",
      type: "Organik",
      gambar: "assets/paper.jpg"),
  ProductGarbage(
      imagePath: "assets/plastic.png",
      name: "Plastik",
      desc:
          "Plastik adalah bahan sintetis yang terbuat dari polimer. Daur ulang plastik melibatkan pengumpulan plastik bekas, pemilihan dan pemilahan berdasarkan jenis plastik, pencucian, peleburan, dan pembentukan ulang menjadi produk plastik baru. Plastik memiliki sifat yang tahan lama dan sulit terurai secara alami. Sebagian besar jenis plastik membutuhkan waktu yang sangat lama, mungkin mencapai ratusan tahun, untuk terurai dalam kondisi lingkungan normal. Namun, beberapa jenis plastik yang dapat terurai seperti poliester alifatik (PLA) dapat mengalami dekomposisi lebih cepat dalam kondisi kompos industri yang sesuai.",
      id: "plastic",
      type: "Organik",
      gambar: "assets/plastic.jpg"),
  ProductGarbage(
      imagePath: "assets/metal.png",
      name: "Metal",
      desc:
          "Metal adalah bahan padat yang terdiri dari elemen seperti besi, aluminium, atau tembaga. Dalam daur ulang logam, bahan logam bekas dikumpulkan, dibersihkan, dan dilebur menjadi lelehan logam yang dapat digunakan untuk membuat produk logam baru. Logam memiliki sifat tahan lama dan tidak mengalami penguraian alami. Oleh karena itu, logam dapat didaur ulang secara berulang tanpa kehilangan sifatnya. Namun, jika logam dibuang ke lingkungan, waktu terurai untuk logam dapat mencapai ratusan hingga ribuan tahun.",
      id: "metal",
      type: "Anorganik",
      gambar: "assets/metal.jpg"),
  ProductGarbage(
      imagePath: "assets/cardboard.png",
      name: "Kerdus",
      desc:
          "Kardus adalah bahan kemasan yang umumnya terbuat dari kertas tebal atau karton. Kardus memiliki struktur yang kokoh dan tahan terhadap tekanan, sehingga sering digunakan sebagai wadah atau kotak untuk mengemas, melindungi, dan mengangkut barang-barang.  Kardus terdiri dari beberapa lapisan kertas yang direkatkan bersama untuk memberikan kekuatan dan kekakuan. Biasanya, lapisan bagian dalam dan luar kardus terbuat dari serat kertas yang lebih padat dan kaku, sementara lapisan tengahnya terdiri dari lapisan kertas yang lebih bergelombang atau bertekstur, yang memberikan kekuatan struktural",
      id: "cardboard",
      type: "Organik",
      gambar: "assets/cb.jpg"),
  ProductGarbage(
      imagePath: "assets/wine-bottles.png",
      name: "Kaca ",
      desc:
          "Kaca adalah bahan padat transparan yang kuat, tahan terhadap korosi, dan terbuat dari peleburan pasir kuarsa dan bahan lainnya pada suhu tinggi. Dalam daur ulang, kaca bekas dikumpulkan, dibersihkan, dan dilelehkan menjadi cairan yang disebut 'lelehan kaca'. Lelehan kaca ini dapat digunakan untuk membuat produk kaca baru atau sebagai bahan baku untuk pembuatan kaca lainnya. Kaca tidak terurai secara alami dalam waktu yang singkat karena tidak mengalami dekomposisi biologis. Proses terurai kaca dalam kondisi lingkungan normal membutuhkan waktu yang sangat lama, bisa berlangsung ratusan hingga ribuan tahun., daur ulang kaca memiliki manfaat penting dalam mengurangi penggunaan sumber daya alam dan mengurangi limbah. Dengan mendaur ulang kaca, kita dapat mengurangi kebutuhan akan bahan baku baru, mengurangi jumlah kaca yang masuk ke tempat pembuangan sampah, dan membantu melindungi lingkungan.",
      id: "glass",
      type: "Anorganik",
      gambar: "assets/glass.jpg")
];
