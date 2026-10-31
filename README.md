# Motor pedagógico

Motor pedagógico multiagente y temáticamente neutro. Planifica rutas de estudio, construye unidades verificadas (generar → investigar → auditar → redactar) y conduce evaluaciones formativas, una pregunta por turno.

Está construido sobre el estándar abierto **Agent Skills** (`SKILL.md`), así que funciona en cualquier arnés compatible: Codex, Antigravity, Claude Code, OpenCode, etc.

## Estructura del repositorio

```text
motor-pedagogico/
├── compartido/                 → se copia a ~/.agents/   (CARPETA COMPARTIDA por todos los arneses)
│   └── skills/
│       ├── motor-pedagogico-orquestar/          núcleo: contrato + roles portables
│       │   └── references/roles/*.md            definición neutral de los 7 agentes
│       ├── motor-pedagogico-estandar-plan-estudio/
│       ├── motor-pedagogico-planificar-ruta/
│       ├── motor-pedagogico-generar-unidad/
│       ├── motor-pedagogico-investigar-unidad/
│       ├── motor-pedagogico-validar-unidad/
│       ├── motor-pedagogico-redactar-markdown/
│       ├── motor-pedagogico-evaluar-unidad/
│       └── obsidian-markdown/                   dependencia opcional del redactor
│
├── arneses/                    → archivos ESPECÍFICOS de cada arnés
│   ├── codex/agents/*.toml     → se copian a ~/.codex/agents/
│   ├── antigravity/            → enlaces simbólicos en ~/.gemini/config/skills/
│   ├── claude-code/            → enlaces simbólicos en ~/.claude/skills/
│   └── opencode/               → no requiere nada (lee ~/.agents/skills de forma nativa)
│
├── plantillas/proyecto/        → opcional, se copia a la raíz de un proyecto concreto
│   └── .agents/motor-pedagogico-perfiles.md
│
└── scripts/
    ├── instalar.sh             repo → equipo
    └── exportar.sh             equipo → repo (para publicar cambios hechos localmente)
```

### Regla para saber dónde va cada cosa

| Carpeta del repo | Destino en el equipo | ¿Cuándo? |
|---|---|---|
| `compartido/skills/*` | `~/.agents/skills/` | **Siempre.** Es la única copia real del motor. |
| `arneses/codex/agents/*.toml` | `~/.codex/agents/` | Solo si usas Codex. |
| `arneses/antigravity/` | enlaces en `~/.gemini/config/skills/` → `~/.agents/skills/` | Solo si usas Antigravity. |
| `arneses/claude-code/` | enlaces en `~/.claude/skills/` → `~/.agents/skills/` | Solo si usas Claude Code. |
| `arneses/opencode/` | — | Nada que hacer. |
| `plantillas/proyecto/` | `<proyecto>/.agents/` | Solo si un proyecto declara perfiles de dominio. |

> Los arneses distintos de Codex **no reciben copias**, sino enlaces simbólicos a la carpeta compartida. Así hay una sola fuente de verdad en el equipo.

## Instalación en un equipo nuevo

```bash
git clone <url-del-repo> ~/Workspace/motor-pedagogico
cd ~/Workspace/motor-pedagogico
./scripts/instalar.sh --dry-run          # muestra qué haría, sin tocar nada
./scripts/instalar.sh                    # detecta los arneses instalados
./scripts/instalar.sh --arneses codex,claude-code   # o elige explícitamente
```

El instalador nunca borra: si un archivo de destino existe y es distinto, lo respalda como `<nombre>.bak-<fecha>` antes de reemplazarlo.

La instalación manual equivale a:

```bash
mkdir -p ~/.agents/skills
cp -R compartido/skills/* ~/.agents/skills/
# Codex
mkdir -p ~/.codex/agents && cp arneses/codex/agents/*.toml ~/.codex/agents/
# Antigravity / Claude Code (repetir por cada skill)
ln -s ~/.agents/skills/motor-pedagogico-orquestar ~/.gemini/config/skills/motor-pedagogico-orquestar
ln -s ~/.agents/skills/motor-pedagogico-orquestar ~/.claude/skills/motor-pedagogico-orquestar
```

## Publicar cambios hechos en el equipo

Si modificas el motor directamente en `~/.agents/skills` o `~/.codex/agents`:

```bash
./scripts/exportar.sh      # copia la versión instalada al repo
git diff                   # revisa
git commit -am "..." && git push
```

## Uso

Pide al agente, en cualquier arnés: «crea una ruta para aprender X», «construye la unidad 3» o «evalúame sobre la unidad 3». Para forzar el motor completo, invoca la skill `motor-pedagogico-orquestar`. Por defecto, el motor trabaja en modo `MODO_EVIDENCIA: HIBRIDO` y genera sus documentos con `FORMATO_MARKDOWN: OBSIDIAN`.

Consulta [USO.md](USO.md) para ver los comandos detallados por arnés, ejemplos y opciones disponibles.

## Mantenimiento de los roles

Cada rol existe en dos formatos que deben mantenerse sincronizados:

- `compartido/skills/motor-pedagogico-orquestar/references/roles/<rol>.md`: portable, lo usan todos los arneses.
- `arneses/codex/agents/motor-pedagogico-<rol>.toml`: nativo de Codex.
