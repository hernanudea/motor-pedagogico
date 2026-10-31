# Roles portables del motor pedagógico

Definiciones de los siete roles del motor en formato neutral, independientes de cualquier arnés. Son la fuente portable equivalente a los agentes de Codex en `~/.codex/agents/motor-pedagogico-*.toml`.

## Uso desde cualquier arnés

1. El orquestador (el agente principal que cargó `motor-pedagogico-orquestar`) decide qué rol necesita.
2. Inicia un subagente o contexto aislado usando el mecanismo nativo del host (subagente, tarea, worker, etc.).
3. Entrega al subagente, como instrucciones de sistema o primer mensaje, el contenido íntegro del archivo del rol, seguido del encargo concreto (unidad, borrador, paquete, etc.).
4. El subagente carga las skills indicadas en su ficha. Si el host no las expone por nombre, las lee desde la carpeta hermana `../../../<skill>/SKILL.md` relativa a este archivo (normalmente `~/.agents/skills/<skill>/SKILL.md`).
5. Respeta el campo `Permisos`: si el host lo permite, restringe las herramientas del subagente; si no, el subagente lo acata como instrucción.

Si el host no permite delegar, el orquestador puede ejecutar el rol en su propio contexto aplicando la ficha, pero **no** puede presentar la auditoría como independiente (ver Contingencia en `../contrato-motor.md`).

## Catálogo

| Rol | Ficha | Permisos | Skills | Agente Codex equivalente |
|---|---|---|---|---|
| Orquestador | [orquestador.md](orquestador.md) | escritura en workspace | `motor-pedagogico-orquestar` | `motor_pedagogico_orquestador` |
| Planificador | [planificador.md](planificador.md) | solo lectura (navegación permitida) | `motor-pedagogico-planificar-ruta`, `motor-pedagogico-estandar-plan-estudio` | `motor_pedagogico_planificador` |
| Generador | [generador.md](generador.md) | solo lectura, sin navegación | `motor-pedagogico-generar-unidad` | `motor_pedagogico_generador` |
| Investigador | [investigador.md](investigador.md) | solo lectura (navegación permitida) | `motor-pedagogico-investigar-unidad` | `motor_pedagogico_investigador` |
| Verificador | [verificador.md](verificador.md) | escritura solo en `.motor-pedagogico/tmp/` | `motor-pedagogico-validar-unidad` | `motor_pedagogico_verificador` |
| Redactor | [redactor.md](redactor.md) | escritura en workspace | `motor-pedagogico-redactar-markdown`, `motor-pedagogico-estandar-plan-estudio`, `obsidian-markdown` (opcional) | `motor_pedagogico_redactor` |
| Evaluador | [evaluador.md](evaluador.md) | solo lectura | `motor-pedagogico-evaluar-unidad` | `motor_pedagogico_evaluador` |

## Sincronización con Codex

Codex sigue usando sus agentes TOML. Si modificas las instrucciones de un rol, actualiza tanto la ficha de aquí como el `developer_instructions` del TOML correspondiente para que ambos arneses se comporten igual.
