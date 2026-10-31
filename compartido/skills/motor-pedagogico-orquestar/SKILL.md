---
name: motor-pedagogico-orquestar
description: Coordinar un motor pedagógico global para planificar rutas de estudio, construir unidades verificadas y realizar evaluaciones interactivas. Usar cuando el usuario pida aprender un tema, avanzar en una ruta, crear material de una unidad o evaluar lo estudiado.
---

# Motor pedagógico: orquestar

## Compatibilidad

Requiere un cliente compatible con Agent Skills. La auditoría independiente necesita delegación multiagente o ejecución aislada equivalente proporcionada por el host.

Coordina el proceso mediante roles especializados. Cuando el host permita delegar, asigna cada rol a un agente o contexto separado y entrégale la skill correspondiente. No sustituyas silenciosamente una fase especializada por producción propia.

## Roles portables

Las instrucciones de cada rol están en [references/roles/](references/roles/README.md), una ficha por rol (orquestador, planificador, generador, investigador, verificador, redactor y evaluador). Si el host ya tiene registrado un agente equivalente (por ejemplo, `motor_pedagogico_*` en Codex), úsalo. Si no, crea un subagente con el mecanismo nativo del host y entrégale el contenido íntegro de la ficha del rol junto con el encargo; respeta sus permisos y gates.

Antes de actuar, lee [references/contrato-motor.md](references/contrato-motor.md). Resuelve el objetivo, el plan de estudio, la unidad y la carpeta desde los artefactos disponibles. Descubre perfiles locales mediante `.agents/motor-pedagogico-perfiles.md`: selecciona por identificador, condiciones de activación y fases, no por el nombre de la carpeta o de la skill. Si faltan datos no críticos, declara supuestos razonables; pregunta solo cuando una decisión cambiaría materialmente la ruta. Detecta las instrucciones del proyecto aplicables: si contradicen este motor, informa el conflicto y respeta la instrucción de mayor precedencia sin mezclar cadenas silenciosamente.

## Enrutamiento

- Para diseñar o adaptar una ruta, usa el rol planificador con `motor-pedagogico-planificar-ruta` y el estándar `motor-pedagogico-estandar-plan-estudio`. Si el proyecto declara un perfil de dominio local, carga sus restricciones y entrégalas a las fases implicadas. Si la petición ya autoriza crear o guardar el plan, la investigación curricular está completa y no surgieron supuestos materiales, esa petición acepta la materialización; en caso contrario, presenta el alcance y espera aceptación antes de usar el rol redactor con `motor-pedagogico-redactar-markdown`.
- Para construir una unidad, usa en secuencia generador, investigador, verificador y redactor con sus skills homónimas del catálogo. Aplica el perfil de dominio local a cada fase; una revisión especializada adicional solo se usa si el proyecto la proporciona.
- Para evaluar, conserva un único agente o contexto del rol evaluador durante toda la evaluación y usa el rol redactor solo al finalizar.

Usa `MODO_EVIDENCIA: HIBRIDO` por defecto. Solo permite `SOLO_LLM` por elección explícita y etiqueta el material como borrador no auditado; no lo presentes como contenido verificado. Usa `FORMATO_MARKDOWN: OBSIDIAN` por defecto cuando la skill `obsidian-markdown` esté disponible y `MARKDOWN_PORTABLE` como alternativa.

No publiques contenido con investigación incompleta, auditoría rechazada o hallazgos críticos/mayores abiertos. Devuelve los hallazgos a la fase responsable y permite como máximo dos reauditorías después del rechazo inicial antes de informar el bloqueo. No sobrescribas artefactos sin autorización explícita.
