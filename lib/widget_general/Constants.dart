import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiUrl = dotenv.get("API", fallback: "");

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

const String homeTitle = 'Dapatkan hadiah langsung dengan submit kode unik!';

const String successTitle = 'Berhasil';
const String successSubtitle = 'Berhasil';

const String errorTitle = 'Terjadi Kesalahan';
const String failedTitle = 'Gagal';
const String errorSubtitle = 'Harap Coba Beberapa Saat Lagi';

const String modalBtnYakin = 'Yakin';
const String modalBtnTidak = 'Tidak';
const String modalBtnOk = 'Ok';
const String modalBtnClose = 'OK';

const String livechatEnd = 'Live Chat Selesai';
const String livechatEndMessage =
    'Terimakasih atas ulasan yang telah Anda berikan!\nSemoga informasi yang Anda dapatkan sudah cukup.';
