# Codex

**Específico del arnés.** Codex lee las skills de forma nativa desde `~/.agents/skills` (carpeta compartida), pero los agentes especializados son propios de Codex.

| Origen en el repo | Destino |
|---|---|
| `agents/motor-pedagogico-*.toml` | `~/.codex/agents/` |

Codex requiere tener habilitados los subagentes. Configuración actual de referencia en `~/.codex/config.toml`:

```toml
[agents]
max_threads = 8
max_depth = 1
```

Los TOML son el equivalente nativo de las fichas portables en `compartido/skills/motor-pedagogico-orquestar/references/roles/`. Si cambias uno, actualiza el otro.
