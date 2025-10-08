#!/bin/bash

komut="$1"
shift

RENK_YESIL="\033[0;32m"
RENK_KIRMIZI="\033[0;31m"
RENK_SARI="\033[1;33m"
RENK_MAVI="\033[0;34m"
RENK_MOR="\033[0;35m"
RENK_CYAN="\033[0;36m"
RENK_BEYAZ="\033[1;37m"
RENK_SIFIRLA="\033[0m"

SURUM="2.1"

renkli_yaz() {
  renk="$1"
  shift
  echo -e "${renk}$@${RENK_SIFIRLA}"
}

banner_goster() {
  echo -e "${RENK_CYAN}"
  echo "╔═══════════════════════════════════════════╗"
  echo "║                    TSSH                   ║"
  echo "║              Sürüm: v${SURUM}             ║"
  echo "╚═══════════════════════════════════════════╝"
  echo -e "${RENK_SIFIRLA}"
}

baslik_yaz() {
  echo -e "\n${RENK_BEYAZ}━━━ $1 ━━━${RENK_SIFIRLA}"
}

if [ -z "$komut" ]; then
  banner_goster
  renkli_yaz "$RENK_SARI" "Komut belirtilmedi!"
  renkli_yaz "$RENK_MAVI" "Yardım için: ${RENK_BEYAZ}tssh yardım"
  exit 1
fi

case "$komut" in
  "bağlan"|"b")
    renkli_yaz "$RENK_YESIL" "Bağlanılıyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh $@"
    ssh "$@"
    ;;
    
  "kopyala"|"k")
    renkli_yaz "$RENK_YESIL" "Dosya kopyalanıyor..."
    renkli_yaz "$RENK_MAVI" "→ scp $@"
    scp "$@"
    ;;
    
  "aktar"|"a")
    renkli_yaz "$RENK_YESIL" "Senkronizasyon başlıyor..."
    renkli_yaz "$RENK_MAVI" "→ rsync $@"
    rsync "$@"
    ;;
    
  "sftp")
    renkli_yaz "$RENK_YESIL" "SFTP oturumu başlatılıyor..."
    renkli_yaz "$RENK_MAVI" "→ sftp $@"
    sftp "$@"
    ;;
    
  "anahtar-oluştur"|"anahtar_olustur"|"keygen")
    renkli_yaz "$RENK_MOR" "SSH anahtarı oluşturuluyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-keygen $@"
    ssh-keygen "$@"
    ;;
    
  "anahtar-gönder"|"anahtargönder"|"anahtar_gonder")
    renkli_yaz "$RENK_MOR" "Anahtar sunucuya gönderiliyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-copy-id $@"
    ssh-copy-id "$@"
    ;;
    
  "anahtar-ekle"|"anahtar_ekle"|"ekle")
    renkli_yaz "$RENK_MOR" "Anahtar agent'a ekleniyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-add $@"
    ssh-add "$@"
    ;;
    
  "anahtar-listele"|"anahtar_listele"|"listele")
    renkli_yaz "$RENK_MOR" "Agent'taki anahtarlar listeleniyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-add -l"
    ssh-add -l
    ;;
    
  "anahtar-temizle"|"anahtar_temizle"|"temizle")
    renkli_yaz "$RENK_MOR" "Tüm anahtarlar temizleniyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-add -D"
    ssh-add -D
    ;;
    
  "anahtar-okuma"|"anahtar_okuma"|"keyscan")
    renkli_yaz "$RENK_MOR" "Sunucu anahtarları taranıyor..."
    renkli_yaz "$RENK_MAVI" "→ ssh-keyscan $@"
    ssh-keyscan "$@"
    ;;
    
  "agent-başlat"|"agent_baslat"|"agent-start")
    renkli_yaz "$RENK_MOR" "SSH agent başlatılıyor..."
    eval "$(ssh-agent -s)"
    renkli_yaz "$RENK_YESIL" "Agent başarıyla başlatıldı"
    ;;
    
  "agent-durdur"|"agent_durdur"|"agent-stop")
    renkli_yaz "$RENK_MOR" "SSH agent durduruluyor..."
    ssh-agent -k
    renkli_yaz "$RENK_YESIL" "Agent durduruldu"
    ;;
    
  "dosya-bağla"|"dosya_bağla"|"dosya-bagla"|"mount")
    renkli_yaz "$RENK_CYAN" "Uzak dosya sistemi bağlanıyor..."
    renkli_yaz "$RENK_MAVI" "→ sshfs $@"
    sshfs "$@"
    ;;
    
  "dosya-ayır"|"dosya_ayir"|"dosya-ayir"|"umount")
    renkli_yaz "$RENK_CYAN" "Dosya sistemi ayrılıyor..."
    renkli_yaz "$RENK_MAVI" "→ fusermount -u $@"
    fusermount -u "$@"
    ;;
    
  "test")
    renkli_yaz "$RENK_YESIL" "tssh çalışıyor!"
    ;;
    
  "sürüm"|"surum"|"--version"|"--versiyon")
    banner_goster
    ;;
    
  "github"|"Github")
    echo -e "${RENK_MOR}"
    echo "╭────────────────────────────────────────╮"
    echo "│  GitHub;                               │"
    echo "│                                        │"
    echo "│  @nehirolmayanfirat                    │"
    echo "╰────────────────────────────────────────╯"
    echo -e "${RENK_SIFIRLA}"
    ;;
    
  "yardım"|"help"|"-h"|"--help")
    banner_goster
    
    baslik_yaz "Bağlantı Komutları"
    echo "  tssh bağlan|b        kullanıcı@sunucu [seçenekler]"
    echo "  tssh sftp            kullanıcı@sunucu"
    
    baslik_yaz "Dosya İşlemleri"
    echo "  tssh kopyala|k       kaynak hedef"
    echo "  tssh aktar|a         kaynak hedef"
    echo "  tssh dosya-bağla     kullanıcı@sunucu:/uzak yerel"
    echo "  tssh dosya-ayır      yerel"
    
    baslik_yaz "Anahtar Yönetimi"
    echo "  tssh anahtar-oluştur [seçenekler]"
    echo "  tssh anahtar-gönder  kullanıcı@sunucu"
    echo "  tssh anahtar-ekle    dosya"
    echo "  tssh anahtar-listele"
    echo "  tssh anahtar-temizle"
    echo "  tssh anahtar-okuma   sunucu"
    
    baslik_yaz "Agent İşlemleri"
    echo "  tssh agent-başlat"
    echo "  tssh agent-durdur"
    
    baslik_yaz "Diğer"
    echo "  tssh sürüm           Sürüm bilgisi"
    echo "  tssh github          GitHub bilgisi"
    echo "  tssh test            Araç testi"
    echo "  tssh yardım          Bu yardım mesajı"
    
    echo ""
    renkli_yaz "$RENK_SARI" "Not: Tüm SSH/SCP/RSYNC parametreleri desteklenir"
    echo ""
    ;;
    
  *)
    renkli_yaz "$RENK_KIRMIZI" "Bilinmeyen komut: '$komut'"
    renkli_yaz "$RENK_MAVI" "Yardım için: ${RENK_BEYAZ}tssh yardım"
    exit 1
    ;;
esac
