if status is-interactive
  set fish_greeting

  alias clear "printf '\033[2J\033[3J\033[1;1H'"
  alias celar "printf '\033[2J\033[3J\033[1;1H'"
  alias claer "printf '\033[2J\033[3J\033[1;1H'"

  set -g fish_key_bindings fish_vi_key_bindings
end
