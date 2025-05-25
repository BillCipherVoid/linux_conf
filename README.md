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


