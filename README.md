Download these stuff and put in the `~/.config/nvim`

Install Packer

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
 Install g++ (for treesitter) \
 :PackerSync
 
Install jdtls \
https://github.com/eclipse/eclipse.jdt.ls \
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ ./mvnw clean verify

Install Treesiter
:TSUpdate

copy the content to folder
~/.local/share/eclipse.jdt.ls

