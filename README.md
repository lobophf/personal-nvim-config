Download these stuff and put in the `~/.config/nvim` \
git clone --depth 1 git@github.com:lobophf/personal-nvim-config.git ~/.config/nvim/

---

Install Packer

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
Install g++ (for treesitter) \
:PackerSync
---

Install jdtls \

set JAVA_HOME to: JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
(put it into bashrc)

---

alias nvim too:
alias vim="nvim"

---
Install Treesiter
:TSUpdate

---
For Telescope, install BurntSushi/ripgrep and sharkdp/fd

https://github.com/BurntSushi/ripgrep#installation
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```
https://github.com/sharkdp/fd#installation

Download `fd_8.5.3_arm64.deb` and install

```bash
sudo dpkg -i fd_8.5.3_arm64.deb
```

Try `:checkhealth telescope`

---
https://github.com/eclipse/eclipse.jdt.ls \

Download and install eclipse.jdt.ls into this folder. [This](https://download.eclipse.org/jdtls/milestones/?d) is the best option
~/.config/nvim/servers/eclipse.jdt.ls

to copy / paste install xclip
copy "+y
paste "+p

para o debug
sudo apt install openjdk-17-jdk openjdk-17-jre \
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/ ./mvnw clean install -DskipTest=true

---
Nerd Fonts
Download from [here](https://www.nerdfonts.com/#home) and install the `Unbuntu mono nerd font` from `The best developer fonts` \
Put the unziped download folder on `/usr/share/fonts/`, run `$ fc-cache -f -v` and check if it was instaled `fc-list | grep "Ubuntu Mono Nerd Font"` \
I need to set the terminal emulator font too \
REF https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack


:lua filewrite = io.open("tempfile", "w") filewrite:write(vim.inspect(vim.lsp.get_active_clients())) filewrite:close()
