# Начало
Всё это должно лежать в папке `.config`
# ssh config
```bash
sudo vim /etc/ssh/sshd_congig
```
И там вписать то что находиться в ssh/conf.txt

```bash
sudo service ssh restart
```

```bash
exit
```

# zsh config

```bash
sudo apt install -y zsh
```

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
source zsh/install.bash
```
И перезапускам 

```bash
zsh
```

# alacritty + wsl 
## Для винды
Создаём папку куда перенесём настройки
Подставьте нужное имя пользователя
```bash
mkdir -p /mnt/c/Users/CipherOfTheVoid/AppData/Roaming/alacritty/themes
```
Переносим файл в созданную папку
```bash
cp ~/.congig/alacritty/alacritty.toml /mnt/c/Users/CipherOfTheVoid/AppData/Roaming/alacritty/
```

```bash
git clone https://github.com/alacritty/alacritty-theme
```

```bash
cp -r alacritty-theme/* /mnt/c/Users/CipherOfTheVoid/AppData/Roaming/alacritty/themes
```
с сайта скачиваем hack `nerd font` с сайта
https://www.nerdfonts.com/font-downloads
и устанавливаем все шрифты

