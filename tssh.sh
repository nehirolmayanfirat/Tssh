#!/bin/bash
komut="$1"
shift

RENK_YESIL="\033[0;32m"
RENK_KIRMIZI="\033[0;31m"
RENK_SARI="\033[1;33m"
RENK_MAVI="\033[0;34m"
RENK_SIFIRLA="\033[0m"
SURUM="3.0"

renkli_yaz() {
  renk="$1"
  shift
  echo -e "${renk}$@${RENK_SIFIRLA}"
}

if [ -z "$komut" ]; then
  renkli_yaz "$RENK_SARI" "tssh yardım"
  exit 1
fi

case "$komut" in
  "bağlan"|"b")
    renkli_yaz "$RENK_YESIL" "ssh $@"
    ssh "$@"
    ;;
  "kopyala"|"k")
    renkli_yaz "$RENK_YESIL" "scp $@"
    scp "$@"
    ;;
  "aktar"|"a")
    renkli_yaz "$RENK_YESIL" "rsync $@"
    rsync "$@"
    ;;
  "sftp")
    renkli_yaz "$RENK_YESIL" "sftp $@"
    sftp "$@"
    ;;
  "anahtar-oluştur"|"anahtar_olustur"|"keygen")
    renkli_yaz "$RENK_MAVI" "ssh-keygen $@"
    ssh-keygen "$@"
    ;;
  "anahtar-gönder"|"anahtargönder"|"anahtar_gonder")
    renkli_yaz "$RENK_MAVI" "ssh-copy-id $@"
    ssh-copy-id "$@"
    ;;
  "anahtar-ekle"|"anahtar_ekle"|"ekle")
    renkli_yaz "$RENK_MAVI" "ssh-add $@"
    ssh-add "$@"
    ;;
  "anahtar-listele"|"anahtar_listele"|"listele")
    renkli_yaz "$RENK_MAVI" "ssh-add -l"
    ssh-add -l
    ;;
  "anahtar-temizle"|"anahtar_temizle"|"temizle")
    renkli_yaz "$RENK_MAVI" "ssh-add -D"
    ssh-add -D
    ;;
  "anahtar-okuma"|"anahtar_okuma"|"keyscan")
    renkli_yaz "$RENK_MAVI" "ssh-keyscan $@"
    ssh-keyscan "$@"
    ;;
  "agent-başlat"|"agent_baslat"|"agent-start")
    renkli_yaz "$RENK_MAVI" "ssh-agent başlatılıyor"
    eval "$(ssh-agent -s)"
    ;;
  "agent-durdur"|"agent_durdur"|"agent-stop")
    renkli_yaz "$RENK_MAVI" "ssh-agent durduruluyor"
    ssh-agent -k
    ;;
  "dosya-bağla"|"dosya_bağla"|"dosya-bagla"|"mount")
    renkli_yaz "$RENK_YESIL" "sshfs $@"
    sshfs "$@"
    ;;
  "dosya-ayır"|"dosya_ayir"|"dosya-ayir"|"umount")
    renkli_yaz "$RENK_YESIL" "fusermount -u $@"
    fusermount -u "$@"
    ;;
  "test")
    renkli_yaz "$RENK_YESIL" "tssh test başarılı"
    ;;
  "sürüm"|"surum"|"--version"|"--versiyon")
    renkli_yaz "$RENK_SARI" "tssh sürüm: v$SURUM"
    ;;
  "github"|"Github")
    echo "bu araç gerçekten işine yarıyorsa..."
    echo "yıldız koyarsan sevinirim!"
    echo "github; @nehirolmayanfirat"
    ;;
  "yardım"|"help"|"-h"|"--help")
    echo "Kullanım:"
    echo "  tssh bağlan kullanıcı@sunucu [ssh-opsiyonları...]"
    echo "  tssh kopyala kaynak hedef"
    echo "  tssh aktar kaynak hedef"
    echo "  tssh sftp kullanıcı@sunucu"
    echo "  tssh anahtar-oluştur [opsiyonlar]"
    echo "  tssh anahtar-gönder kullanıcı@sunucu"
    echo "  tssh anahtar-ekle dosya"
    echo "  tssh anahtar-listele"
    echo "  tssh anahtar-temizle"
    echo "  tssh anahtar-okuma sunucu"
    echo "  tssh agent-başlat"
    echo "  tssh agent-durdur"
    echo "  tssh dosya-bağla kullanıcı@sunucu:/uzak yerel"
    echo "  tssh dosya-ayır yerel"
    echo "  tssh sürüm"
    echo "  tssh hakkında"
    echo "Not: tssh arka planda ilgili komutu aynen çalıştırır, tüm ssh/scp/rsync parametreleri desteklenir."
    ;;
  *)
    renkli_yaz "$RENK_KIRMIZI" "Bilinmeyen komut: '$komut'"
    echo "Yardım için 'tssh yardım' yaz."
    exit 1
    ;;
esac
