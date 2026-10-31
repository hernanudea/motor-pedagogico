#!/usr/bin/env bash
# Instala el motor pedagógico desde este repositorio en el equipo actual.
#   compartido/skills/*        -> ~/.agents/skills/           (siempre)
#   arneses/codex/agents/*     -> ~/.codex/agents/            (si se elige codex)
#   enlaces simbólicos         -> ~/.gemini/config/skills/    (antigravity)
#                              -> ~/.claude/skills/           (claude-code)
#   opencode                   -> nada (lee ~/.agents/skills de forma nativa)
#
# Uso: ./scripts/instalar.sh [--arneses codex,antigravity,claude-code,opencode] [--dry-run]
# Sin --arneses, detecta los arneses presentes en el equipo.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
SHARED="$HOME/.agents/skills"
STAMP="$(date +%Y%m%d-%H%M%S)"
DRY=0
ARNESES=""

while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY=1 ;;
    --arneses) shift; ARNESES="${1:-}" ;;
    -h|--help) sed -n '2,11p' "$0"; exit 0 ;;
    *) echo "Opción desconocida: $1" >&2; exit 1 ;;
  esac
  shift
done

run() { if [ "$DRY" -eq 1 ]; then echo "  [dry-run] $*"; else "$@"; fi; }

if [ -z "$ARNESES" ]; then
  [ -d "$HOME/.codex" ] && ARNESES="$ARNESES,codex"
  [ -d "$HOME/.gemini" ] && ARNESES="$ARNESES,antigravity"
  [ -d "$HOME/.claude" ] && ARNESES="$ARNESES,claude-code"
  [ -d "$HOME/.config/opencode" ] && ARNESES="$ARNESES,opencode"
  ARNESES="${ARNESES#,}"
  echo "Arneses detectados: ${ARNESES:-ninguno (solo carpeta compartida)}"
fi
has() { case ",$ARNESES," in *",$1,"*) return 0 ;; *) return 1 ;; esac; }

# Copia un directorio o archivo; si el destino existe y difiere, lo respalda.
install_item() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    echo "  ! $dst es un enlace simbólico; se respalda y reemplaza"
    run mv "$dst" "$dst.bak-$STAMP"
  elif [ -e "$dst" ]; then
    if diff -rq -x .DS_Store "$src" "$dst" >/dev/null 2>&1; then
      echo "  = $dst (sin cambios)"; return
    fi
    echo "  ~ $dst (respaldo: $(basename "$dst").bak-$STAMP)"
    run mv "$dst" "$dst.bak-$STAMP"
  else
    echo "  + $dst"
  fi
  run cp -R "$src" "$dst"
}

link_skills() {
  local dir="$1"
  run mkdir -p "$dir"
  for s in "$REPO"/compartido/skills/*/; do
    local name; name="$(basename "$s")"
    local dst="$dir/$name"
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$SHARED/$name" ]; then
      echo "  = $dst (enlace correcto)"; continue
    fi
    if [ -L "$dst" ]; then
      # enlace existente con otra forma (p. ej. relativa): válido si resuelve a la carpeta compartida
      if [ "$(cd "$dst" 2>/dev/null && pwd -P)" = "$(cd "$SHARED/$name" && pwd -P)" ]; then
        echo "  = $dst (enlace correcto)"; continue
      fi
      run mv "$dst" "$dst.bak-$STAMP"
    elif [ -e "$dst" ]; then
      echo "  ~ $dst existe como carpeta real; respaldo: $name.bak-$STAMP"
      run mv "$dst" "$dst.bak-$STAMP"
    fi
    echo "  + $dst -> $SHARED/$name"
    run ln -s "$SHARED/$name" "$dst"
  done
}

echo "==> Carpeta compartida: $SHARED"
run mkdir -p "$SHARED"
for s in "$REPO"/compartido/skills/*/; do
  install_item "${s%/}" "$SHARED/$(basename "$s")"
done

if has codex; then
  echo "==> Codex: ~/.codex/agents"
  run mkdir -p "$HOME/.codex/agents"
  for f in "$REPO"/arneses/codex/agents/*.toml; do
    install_item "$f" "$HOME/.codex/agents/$(basename "$f")"
  done
fi

if has antigravity; then
  echo "==> Antigravity: ~/.gemini/config/skills"
  link_skills "$HOME/.gemini/config/skills"
fi

if has claude-code; then
  echo "==> Claude Code: ~/.claude/skills"
  link_skills "$HOME/.claude/skills"
fi

if has opencode; then
  echo "==> OpenCode: nada que hacer (lee ~/.agents/skills de forma nativa)"
fi

echo "Listo. Reinicia los arneses abiertos para que detecten las skills."
