#!/usr/bin/env bash
# Copia la versión instalada del motor en este equipo de vuelta al repositorio,
# para revisar con `git diff` y publicar los cambios.
#   ~/.agents/skills/motor-pedagogico-* y obsidian-markdown -> compartido/skills/
#   ~/.codex/agents/motor-pedagogico-*.toml                 -> arneses/codex/agents/
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
SHARED="$HOME/.agents/skills"

for s in "$SHARED"/motor-pedagogico-* "$SHARED"/obsidian-markdown; do
  [ -d "$s" ] || continue
  name="$(basename "$s")"
  echo "  <- $name"
  rsync -a --delete --exclude .DS_Store "$s/" "$REPO/compartido/skills/$name/"
done

if ls "$HOME"/.codex/agents/motor-pedagogico-*.toml >/dev/null 2>&1; then
  mkdir -p "$REPO/arneses/codex/agents"
  for f in "$HOME"/.codex/agents/motor-pedagogico-*.toml; do
    echo "  <- codex/$(basename "$f")"
    cp "$f" "$REPO/arneses/codex/agents/"
  done
fi

echo "Exportado. Revisa con: git -C \"$REPO\" status && git -C \"$REPO\" diff"
