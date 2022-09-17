Download these stuff and put in the `~/.config/nvim`

Install Packer

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
 Install g++ (for treesitter) \
 :PackerSync
 
Install jdtls \
https://github.com/eclipse/eclipse.jdt.ls \
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ ./mvnw clean verify

Install Treesiter
:TSUpdate

Download and install eclipse.jdt.ls into this folder. [This](https://download.eclipse.org/jdtls/milestones/?d) is the best option
~/.config/nvim/servers/eclipse.jdt.ls

to copy / paste install xclip
copy "+y
paste "+p
