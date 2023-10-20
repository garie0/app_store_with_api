import 'package:flutter/material.dart';
import 'package:app_store/widgets/CustomNavBar.dart';
import 'package:app_store/widgets/NewGamesWidget.dart';
import 'package:app_store/widgets/UpcomingWidget.dart';
import 'package:app_store/models/game.dart';

class HomePage extends StatelessWidget {
  final List<Game> games = [
    Game(title: "Genshin Impact", category: "RPG", rating: 4.8, description: "Genshin Impact adalah sebuah game aksi petualangan yang memukau dengan dunia terbuka yang begitu indah dan penuh keajaiban, yang dikenal sebagai Teyvat. Pemain berperan sebagai Traveler yang mencari saudarinya yang hilang dan secara bertahap mengungkap misteri dunia magis ini. Game ini menonjolkan pertarungan yang dinamis dengan karakter-karakter unik yang memiliki elemen-elemen sihir yang berbeda, memungkinkan pemain untuk menciptakan kombinasi-kombinasi serangan yang menarik. Genshin Impact juga menawarkan berbagai tantangan, tugas, serta kegiatan eksplorasi yang mengasyikkan, menjadikannya pengalaman yang menghibur dan mendalam bagi para pemainnya."),
    Game(title: "eFootball 2024", category: "Sports", rating: 4.0, description: "Menawarkan peluang kepada penggemar sepak bola di seluruh dunia untuk menikmati game sepak bola baru, dengan realisme tiada duanya.Pernyataan misi ini, yang telah menjadi tujuan kami yang tegas sejak diperkenalkannya eFootball™, tidak akan pernah berubah. Saat kita memulai babak baru dalam kalender sepak bola di dunia nyata, eFootball™ juga akan beralih dari 2023 ke 2024. Inilah saat-saat di tahun ini di mana kita semua dapat bermimpi; para pemain bersiap untuk mengukir prestasi di musim baru, rekrutan musim panas bersemangat untuk pergi dan menyambut lingkungan baru. Di eFootball™ 2024, kamu juga bisa membuat perbedaan di lapangan dengan data pemain dan Seragam terbaru. Dengan mode Kerja Sama, kamu bisa menikmati laga seru bersama teman. Demikian pula di eFootball™, para pahlawan yang telah mencapai puncak di dunia sepak bola pada kampanye sebelumnya akan memulai lembaran baru. Pertarungan sengit akan kembali hadir. Ayo ikut dalam aksi seru bersama para penggemar sepak bola di seluruh dunia!"),
    Game(title: "Clash Of Clans", category: "Strategy", rating: 4.5, description: "Clash of Clans adalah sebuah permainan strategi mobile yang sangat populer yang mengajak pemainnya untuk membangun desa mereka sendiri, melatih pasukan, dan berperang melawan pemain lain dalam pertempuran epik. Dengan grafis yang cerah dan berwarna, game ini menawarkan pengalaman yang seru dengan elemen-elemen strategi yang mendalam. Pemain harus merencanakan pertahanan desa mereka, mengelola sumber daya, serta merancang serangan yang efektif untuk meraih kemenangan dalam pertempuran. Dengan komunitas yang aktif dan turnamen yang sering diadakan, Clash of Clans telah menjadi salah satu game paling ikonik di genre strategi mobile."),
    Game(title: "Minecraft", category: "Survival", rating: 4.1, description: "Minecraft adalah sebuah fenomena dalam dunia permainan, menawarkan pengalaman sandbox yang tak terbatas di mana pemain dapat menjelajahi dunia yang terbuka dan berlatar belakang blok-blok bergaya pixel. Dalam game ini, pemain memiliki kebebasan total untuk membangun, merusak, atau berpetualang seiring dengan imajinasi mereka. Dengan daya tariknya yang tak tertandingi, Minecraft memungkinkan pemain untuk membuat struktur megah, menjalani petualangan di dalam gua-gua misterius, dan berinteraksi dengan berbagai makhluk yang menghuni dunia yang sangat beragam. Kesederhanaan grafiknya dan fleksibilitas kreatifnya telah menjadikannya sebagai salah satu game paling ikonik dan tercinta sepanjang masa."),
    Game(title: "Honkai Star Rail", category: "RPG", rating: 4.3, description: "Honkai Star Rail adalah permainan mobile aksi-rol berbasis kartu yang memukau dengan grafis yang memanjakan mata dan cerita yang mendalam. Dalam game ini, pemain akan memimpin sekelompok karakter yang memiliki kekuatan misterius dalam petualangan epik melintasi alam semesta. Dengan menggabungkan strategi dalam memilih kartu-kartu keterampilan karakter dan pertarungan real-time yang intens, pemain akan menghadapi berbagai musuh yang menantang serta mengungkap rahasia di balik alur cerita yang kompleks. Honkai Star Rail memadukan elemen-elemen gameplay yang menarik dengan narasi yang kuat, menjadikannya game yang sangat menghibur dan memikat para penggemar permainan aksi mobile."),
    Game(title: "Honkai Impact 3d", category: "RPG", rating: 4.3, description: "Honkai Impact 3rd adalah game aksi RPG yang menggabungkan grafis berkualitas tinggi dengan pertarungan yang cepat dan seru. Dengan cerita yang mendalam dan kompleks, pemain memimpin tim prajurit terampil dalam menghadapi ancaman dari entitas misterius bernama Honkai. Setiap karakter memiliki keterampilan unik dan senjata canggih yang dapat disesuaikan, memungkinkan pemain untuk mengembangkan strategi pertarungan yang beragam. Kombinasi antara elemen-elemen cerita yang menarik dan gameplay yang dinamis telah membuat Honkai Impact 3rd menjadi salah satu game mobile yang paling digemari oleh penggemar RPG aksi."),
    Game(title: "Clash Royale", category: "Strategy", rating: 4.2, description: "Clash Royale adalah game strategi real-time yang mendebarkan, menggabungkan elemen permainan kartu koleksi dan pertempuran berbasis arena. Pemain mengumpulkan kartu karakter unik dan menggunakannya untuk merancang dek pertempuran mereka. Tujuan utamanya adalah meruntuhkan Menara Musuh sambil menjaga pertahanan Menara sendiri. Game ini menuntut pemikiran cepat, reaksi yang baik, dan strategi yang kuat, serta memungkinkan pemain untuk berpartisipasi dalam pertandingan multiplayer dan turnamen yang seru. Dengan kombinasi grafis yang menawan dan dinamika pertempuran yang adiktif, Clash Royale telah memikat jutaan pemain di seluruh dunia, menjadikannya salah satu game mobile paling terkenal dan kompetitif."),
    Game(title: "Plants VS Zombies", category: "Survival", rating: 3.5, description: "Plants vs. Zombies adalah permainan tower defense yang kreatif dan menghibur, di mana pemain harus mempertahankan rumah mereka dari serangan gelombang zombie yang lucu dan bervariasi dengan cara menanam berbagai jenis tanaman yang memiliki kemampuan unik. Game ini menyuguhkan gabungan yang sempurna antara strategi, taktik, dan humor, dengan grafis yang cerah dan gaya seni yang menggemaskan. Pemain akan merasa tertantang ketika mereka merancang pertahanan mereka sendiri dengan bijak, sambil menikmati sentuhan komedi yang membuatnya tetap menghibur. Plants vs. Zombies telah menjadi salah satu game klasik yang tak terlupakan dalam genre tower defense, menjadikannya pengalaman bermain yang mengasyikkan bagi semua usia."),
    Game(title: "Call Of Duty Mobile", category: "Battle Royale", rating: 3.8, description: "Call of Duty Mobile adalah sebuah permainan tembak-menembak seru yang menghadirkan pengalaman perang modern dengan grafis yang memukau dan kontrol yang responsif pada perangkat mobile. Dalam game ini, pemain dapat memilih dari berbagai mode permainan, termasuk Battle Royale, Multiplayer, dan Zombie, yang menawarkan beragam peta dan senjata ikonik dari waralaba Call of Duty. Dengan fitur-fitur kompetitif seperti kompetisi eSports dan pertempuran kilat dalam mode 5v5, Call of Duty Mobile menyediakan pengalaman bermain yang mendebarkan yang akan menguji keterampilan tembak dan taktik pemain dalam pertempuran online yang intens."),
    Game(title: "Angry Birds", category: "Strategy", rating: 4.4, description: "Angry Birds adalah sebuah game puzzle yang menghibur dan adiktif yang menghadirkan pemain ke dalam dunia yang lucu dan penuh warna, dihuni oleh burung-burung berwajah marah yang ingin membalas dendam kepada babi-babi yang mencuri telur mereka. Dengan menggunakan ketapel, pemain harus membidik dan meluncurkan beragam burung dengan kemampuan khusus unik mereka ke dalam bangunan-bangunan yang dijaga oleh babi-babi jahat. Game ini menantang pemain untuk merencanakan serangan mereka dengan cermat, menghancurkan struktur-struktur tersebut, dan mengumpulkan sebanyak mungkin poin. Angry Birds menawarkan campuran antara teka-teki yang cerdas, grafis yang menggemaskan, serta tingkat kesenangan yang tinggi, menjadikannya salah satu game mobile yang paling dikenal dan dicintai di seluruh dunia."),
    // Tambahkan game lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Gigih",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "What Game Do You Want?",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/profile.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF292B37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 30,
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              UpcomingWidget(),
              SizedBox(height: 40),
              NewGamesWidget(games: games), // Berikan daftar game ke widget NewGamesWidget
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
