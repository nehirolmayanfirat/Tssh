# Tssh

Tssh, SSH komutlarını Türkçe olarak kullanmanı sağlayan basit bir bash aracıdır.  
SSH, SCP, RSYNC, SFTP, SSHFS gibi komutları Türkçe şekilde çağırabilir ve tüm SSH parametrelerini destekler.

---

## Özellikler

- SSH ile bağlantı kurma (`bağlan`)
- Dosya kopyalama (`kopyala`)
- Dosya aktarımı (`aktar`)
- SFTP işlemleri (`sftp`)
- SSH anahtarı oluşturma, gönderme ve yönetme (`anahtar-oluştur`, `anahtar-gönder`, `anahtar-ekle`, `anahtar-listele`)
- ssh-agent işlemleri (`agent-başlat`, `agent-durdur`)
- Uzak dosya sistemini bağlama (`dosya-bağla`, `dosya-ayır`)
- Renkli çıktı desteği
- Sürüm bilgisi gösterimi (`sürüm` komutu)

---

## Kurulum

```bash
git clone https://github.com/nehirolmayanfirat/Tssh.git
cd Tssh
chmod +x tssh.sh
sudo mv tssh.sh /usr/local/bin/tssh
````

Kurulum tamamlandıktan sonra artık terminalde doğrudan `tssh` komutunu kullanabilirsin.

---

## Kullanım

```bash
tssh bağlan kullanıcı@sunucu
tssh bağlan kullanıcı@sunucu -p 2222 -i ~/.ssh/id_rsa
tssh kopyala dosya kullanıcı@sunucu:/hedef
tssh aktar kaynak hedef
tssh sftp kullanıcı@sunucu
tssh anahtar-oluştur
tssh anahtar-gönder kullanıcı@sunucu
tssh anahtar-ekle ~/.ssh/id_rsa
tssh anahtar-listele
tssh anahtar-temizle
tssh agent-başlat
tssh agent-durdur
tssh dosya-bağla kullanıcı@sunucu:/uzak_klasör yerel_klasör
tssh dosya-ayır yerel_klasör
tssh yardım
tssh sürüm
tssh hakkında
```

Tüm SSH parametreleri (`-p`, `-i`, `-L`, `-R`, `-D`, `-v`, `-N`, `-T`, `-X`, `-C`, vb.) desteklenir.
Yani `tssh bağlan` komutu arka planda doğrudan `ssh` çalıştırır.

---

## Kaldırma

```bash
sudo rm /usr/local/bin/tssh
```

---

## Lisans

Bu proje GPLv3 lisansı ile sunulmuştur.
