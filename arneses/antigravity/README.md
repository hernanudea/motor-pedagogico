# Antigravity

**No requiere archivos propios.** Antigravity descubre skills globales en `~/.gemini/config/skills/`, así que basta con enlaces simbólicos a la carpeta compartida.

```bash
mkdir -p ~/.gemini/config/skills
for s in ~/.agents/skills/motor-pedagogico-* ~/.agents/skills/obsidian-markdown; do
  ln -sfn "$s" ~/.gemini/config/skills/"$(basename "$s")"
done
```

Antigravity no tiene agentes registrados del motor: el orquestador crea subagentes en tiempo de ejecución usando las fichas de `motor-pedagogico-orquestar/references/roles/`.
