Download these stuff and put in the `~/.config/nvim`

Install Packer

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
 Install g++ (for treesitter) \
 :PackerSync
 
Install jdtls \

set JAVA_HOME to: JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
(put it into bashrc)

alias nvim too:
alias vim="nvim"

Install Treesiter
:TSUpdate

https://github.com/eclipse/eclipse.jdt.ls \

Download and install eclipse.jdt.ls into this folder. [This](https://download.eclipse.org/jdtls/milestones/?d) is the best option
~/.config/nvim/servers/eclipse.jdt.ls

to copy / paste install xclip
copy "+y
paste "+p

para o debug
sudo apt install openjdk-17-jdk openjdk-17-jre \
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ ./mvnw clean install -DskipTest=true
