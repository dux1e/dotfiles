DISTRO=$(grep -oP '(?<=^NAME=").*(?=")' /etc/os-release | tr '[:upper:]' '[:lower:]')

case "$DISTRO" in
"arch linux")
  sudo pacman -Syu
  sudo pacman -S base-devel go jq yq fzf ripgrep
  setup_bashrc
  install_oh_my_posh
  ;;

"ubuntu")
  echo "ubuntu only support updates for now"
  sudo apt-get update && sudo apt-get upgrade -y
  ;;

*)
  echo "script only works for arch and ubuntu"
  exit 0
  ;;
esac

function install_oh_my_posh() {
  curl -s https://ohmyposh.dev/install.sh | bash -s
  mkdir -p ~/.config/oh-my-posh
  mv .config/oh-my-posh/* ~/.config/oh-my-posh/
}

function setup_bashrc() {
  mv .config/.bashrc ~/.bashrc
}
