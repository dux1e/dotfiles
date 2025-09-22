install_oh_my_posh() {
  curl -s https://ohmyposh.dev/install.sh | bash -s
  mkdir -p ~/.config/oh-my-posh
  cp .config/oh-my-posh/* ~/.config/oh-my-posh/
}

setup_bashrc() {
  cp .config/.bashrc ~/.bashrc
}

DISTRO=$(grep -oP '(?<=^NAME=").*(?=")' /etc/os-release | tr '[:upper:]' '[:lower:]')

mkdir -p ~/.local/bin

case "$DISTRO" in
"arch linux")
  sudo pacman -Syu
  sudo pacman -S base-devel go jq yq fzf ripgrep github-cli unzip
  setup_bashrc
  install_oh_my_posh
  ;;

"ubuntu")
  echo "ubuntu only support updates for now"
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt-get install git go jq yq fzf ripgrep github-cli unzip
  setup_bashrc
  install_oh_my_posh
  ;;

*)
  echo "script only works for arch and ubuntu"
  exit 0
  ;;
esac
