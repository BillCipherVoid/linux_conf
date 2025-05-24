echo "source ~/.config/zsh/env.zsh" >> ~/.zshrc | echo "env success"
echo "source ~/.config/zsh/aliases.zsh" >> ~/.zshrc | echo "aliases success"
chsh -s $(which zsh) | echo "zsh be default success"
