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

# nvim
## Установка
- Для начала ищем послений релиз который подходит под ваше железо
https://github.com/neovim/neovim/releases
- скачиваем
```
wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
```
- Распаковка
```
tar -xzvf nvim-linux-x86_64.tar.gz
```

- удаляем (заметаем следы хе-хе)
```
rm -r nvim-linux-x86_64.tar.gz
```

- создаём папку где будем хранить совт
```
mkdir .soft
```

```
mv nvim-linux-x86_64 .soft/nvim
```

создаём ссылку на nvim
```bash
sudo ln -s ~/.soft/nvim/bin/nvim /usr/local/bin/nvim
```

Кофиг автоматически подтянется


## Error telescope-fzf-native

Иногда команда make не запускается автоматом. По этому надо это сделать ручками
```
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
```
```
make
```


## Преписанные комбинации

- `jk` - esc в inset mode
- `,<Spase>` - Выключение текущего выделения поиска
- `gw` - Закрыть буфер

- `gt` или `L` - что бы переместиться на следующею вкладку
- `gT` или `H` -  что бы переместиться на предыдущею вкладку
- `,e` Октрывает Explore в новом окне

### Комментарии
#### Обычный режим
- `,cc`  - Закомментировать строку (вместо 'gcc')
- `,cb` - Закомментировать блок (вместо 'gbc')

#### visual mod
- `,c`  - Закомментировать строки в визуальном режиме (вместо 'gc')
- `,b`  - Закомментировать блоки в визуальном режиме (вместо 'gb')


### Python
- `ctrl + h` - запустить текущий файл 
ps - нужно настроить alias python=...
Если вы пользуйтесь моим конфигом, то этого делать не надо) в conf/zsh


### Поиск файлов
Для этого используется Telescope
- `,f` - поиск по названию файлов
- `,g` - поиск по содержимому (g - grep, а точнее используется ripgrep)

### TODO
- `,td` - Показать все TODO

# Для винды
## wsl
Запусить cmd от админа
```cmd
wsl.exe --install -d Debian
```

Запускаем, создаём пользователя

После
```cmd
wsl.exe -l -v
```
Желательно что бы была версия 2

## alacritty + wsl 
Создаём папку куда перенесём настройки
Подставьте нужное имя пользователя
```bash
mkdir -p /mnt/c/Users/CipherOfTheVoid/AppData/Roaming/alacritty/themes
```
Переносим файл в созданную папку
```bash
cp ~/.config/alacritty/alacritty.toml /mnt/c/Users/CipherOfTheVoid/AppData/Roaming/alacritty/
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

# TODO
TODO: null-ls посмотреть что можно еще подключить
