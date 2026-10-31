# Contrato del motor pedagógico

## Catálogo global

| Fase | Rol portable | Skill |
|---|---|---|
| Coordinar | orquestador | `motor-pedagogico-orquestar` |
| Estándar de plan | planificador | `motor-pedagogico-estandar-plan-estudio` |
| Planificar | planificador | `motor-pedagogico-planificar-ruta` |
| Generar | generador | `motor-pedagogico-generar-unidad` |
| Investigar | investigador | `motor-pedagogico-investigar-unidad` |
| Validar | verificador | `motor-pedagogico-validar-unidad` |
| Redactar | redactor | `motor-pedagogico-redactar-markdown` |
| Evaluar | evaluador | `motor-pedagogico-evaluar-unidad` |

El prefijo común permite localizar todas las skills buscando `motor-pedagogico-`. Cada host puede mapear estos roles a sus propios tipos de agente sin modificar el núcleo.

## Roles portables

Cada rol tiene una ficha neutral en `roles/<rol>.md` (ver [roles/README.md](roles/README.md)) con descripción, permisos, skills e instrucciones. Es la definición portable equivalente a los agentes de Codex `~/.codex/agents/motor-pedagogico-*.toml`. Los hosts sin agentes registrados crean un subagente aislado con el contenido de la ficha; los hosts con agentes nativos equivalentes pueden usarlos directamente.

## Invocación

La selección puede ser automática con peticiones como «crea una ruta para aprender X», «construye la unidad 3» o «evalúame sobre la unidad 3». Para forzar el motor completo, invocar la skill `motor-pedagogico-orquestar` mediante la sintaxis que admita el host. Para ejecutar o depurar una sola fase, usar la skill de esa fila del catálogo.

## Artefactos predeterminados

- `PLAN-ESTUDIO-<TEMA>.md`: ruta, investigación curricular, unidades, prerrequisitos y criterios de dominio.
- `<carpeta-unidad>/Módulo <N>: <Título>.md`: material de estudio publicado.
- `<carpeta-unidad>/EVIDENCIAS.md`: trazabilidad, auditoría y hash.
- `<carpeta-unidad>/Evaluación Módulo <N>.md`: informe final de evaluación.

## Descubrimiento de perfiles locales

Un proyecto puede declarar perfiles especializados en `.agents/motor-pedagogico-perfiles.md`. Cada perfil registra: `ID`, ruta relativa a `SKILL.md`, condiciones de activación y fases donde aplica. El nombre de la skill y su carpeta son libres; la selección se hace por el `ID` registrado, no por una convención de nombre.

Antes de planificar, construir o evaluar, el orquestador debe leer el registro si existe. Selecciona un perfil cuando el plan declare su `PERFIL_DOMINIO` o cuando una condición de activación lo identifique sin ambigüedad. Comprueba que la ruta registrada existe, carga solo el perfil seleccionado y transmite sus restricciones a las fases indicadas. Si el perfil solicitado no está registrado, su ruta no existe o hay más de una coincidencia válida, detiene esa selección y solicita la decisión mínima necesaria.

## Construcción de una unidad

1. Resolver unidad, resultados, alcance, carpeta y `PERFIL_DOMINIO`; crear la carpeta antes de delegar. Si el plan no existe o el identificador es ambiguo, planificar primero o solicitar la decisión mínima necesaria; no inventar qué significa «unidad N».
2. Si el proyecto declara un perfil local, leerlo y obtener sus restricciones y riesgos.
3. Generar base: `BORRADOR_BASE: LISTO`.
4. Investigar riesgos: `INVESTIGACION_FOCALIZADA: COMPLETA`.
5. Auditar independientemente: `AUDITORIA: APROBADO`; aplicar las comprobaciones exigidas por el perfil local.
6. Publicar `Módulo <N>: <Título>.md` y `EVIDENCIAS.md` mediante el redactor.
7. Comprobar existencia, ausencia de marcadores y SHA-256 coincidente; marcar `Contenido: [x]` solo para el módulo publicado en el plan y material.

Si la auditoría inicial rechaza, enrutar cada hallazgo al generador o investigador según su causa y repetir solo las fases afectadas. Permitir como máximo dos reauditorías; si la segunda también rechaza, detener y reportar lo pendiente.

Después de redactar, un defecto puramente editorial vuelve al redactor y exige recalcular el hash. Todo cambio sustantivo vuelve al verificador antes de publicarse de nuevo.

La publicación sigue este orden: escribir `Módulo <N>: <Título>.md`, releerlo y calcular su hash desde disco, y después escribir `EVIDENCIAS.md`. Si una interrupción deja solo el material, el redactor puede crear la evidencia faltante sin sobrescribirlo únicamente tras confirmar que coincide con el contenido aprobado. Cualquier diferencia o estado inverso se reporta como publicación inconsistente y requiere decisión del usuario.

Para este gate, un hallazgo crítico puede causar daño o invalidar el núcleo; uno mayor altera una conclusión, práctica o decisión importante. Cualquiera de los dos bloquea la publicación.

## Evaluación

Antes de evaluar, comprobar el material del módulo, evidencias, aprobación y hash; resolver y comunicar el perfil de evaluación antes de la primera pregunta. Mantener un solo evaluador, transmitir exactamente una pregunta por turno y guardar el informe únicamente después de `ESTADO: FINALIZADA`. Después, el redactor marca `Evaluación: [x]`; marca `Dominio: [x]` solo si la nota satisface el criterio explícito del plan, y actualiza el hash de evidencias. La cantidad, rúbrica, retroalimentación, escala, aclaraciones y abandono pertenecen a `motor-pedagogico-evaluar-unidad`. Si el informe del módulo ya existe, usar sufijo incremental `-02`, `-03`, etc.

## Aceptación de una ruta

Una petición explícita de crear o guardar el plan autoriza materializarlo cuando el planificador completó la investigación curricular y no necesitó supuestos que cambien materialmente el alcance. Si los necesitó, mostrar primero el resumen de unidades y pedir aceptación. Una petición de solo proponer, revisar o comparar rutas nunca autoriza escribir `PLAN-ESTUDIO-<TEMA>.md`.

## Precedencia del contexto

Las instrucciones aplicables del sistema, usuario y proyecto conservan su precedencia. Si un proyecto define otra cadena o restringe el tema, no mezclar ambos motores: señalar el conflicto y usar el flujo autorizado para ese contexto.

## Contingencia

Si un tipo especializado no está disponible, usar la delegación nativa del host para iniciar un trabajador aislado con la skill exacta y las mismas restricciones, e informar la contingencia. Si el host no puede aislar la verificación del trabajo de generación, no presentar la auditoría como independiente ni publicar el material como plenamente verificado.
