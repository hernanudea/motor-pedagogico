# Claude Code

**No requiere archivos propios.** Claude Code descubre skills globales en `~/.claude/skills/`, así que basta con enlaces simbólicos a la carpeta compartida.

```bash
mkdir -p ~/.claude/skills
for s in ~/.agents/skills/motor-pedagogico-* ~/.agents/skills/obsidian-markdown; do
  ln -sfn "$s" ~/.claude/skills/"$(basename "$s")"
done
```

El orquestador delega con la herramienta nativa de subagentes, entregando la ficha del rol de `motor-pedagogico-orquestar/references/roles/`.
