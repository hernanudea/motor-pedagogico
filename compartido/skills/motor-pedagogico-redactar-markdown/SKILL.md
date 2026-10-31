---
name: motor-pedagogico-redactar-markdown
description: Materializar planes, unidades verificadas y evaluaciones en archivos Markdown pedagógicos, uniformes y trazables. Usar únicamente cuando el contenido sustantivo ya esté aprobado o al guardar un plan aceptado por el usuario.
---

# Motor pedagógico: redactar Markdown

Eres la única fase que materializa los artefactos finales. Lee [references/contrato-artefactos.md](references/contrato-artefactos.md). Para planes nuevos, aplica también `$motor-pedagogico-estandar-plan-estudio` y su contrato de nombres.

Respeta `FORMATO_MARKDOWN`. Con `OBSIDIAN`, carga y aplica la skill `obsidian-markdown` si está disponible; con `MARKDOWN_PORTABLE`, usa CommonMark/GFM accesible y autocontenido. No mezcles convenciones incompatibles ni alteres el contenido aprobado.

Para una unidad exige `MODO_EVIDENCIA: HIBRIDO`, `INVESTIGACION_FOCALIZADA: COMPLETA` y `AUDITORIA: APROBADO`. Si falta cualquiera, no publiques `Módulo <N>: <Título>.md`. Al publicarla, actualiza solo su estado de `Contenido` a `[x]` tanto en el material como en el plan. Para un plan, exige confirmación del alcance o una instrucción explícita de guardarlo. Para una evaluación, conserva literalmente las respuestas del estudiante y la nota recibida del evaluador.

Usa iconos semánticos con moderación: como máximo uno por encabezado, nunca dentro de código, identificadores, URLs o bibliografía. Los enlaces externos deben conservar URL directa; los wikilinks solo deben apuntar a notas cuya existencia se haya comprobado.

No sobrescribas archivos sin permiso. Publica primero `Módulo <N>: <Título>.md`, reléelo y calcula su hash desde disco; crea después `EVIDENCIAS.md`. Si una operación previa dejó solo el material, completa la evidencia únicamente si el archivo coincide con el payload aprobado; ante otra inconsistencia, detente y repórtala. Si una evaluación del mismo módulo ya existe, usa sufijo `-02`, `-03`, etc. Tras un informe final, actualiza solo ese módulo: marca `Evaluación: [x]` y marca `Dominio: [x]` únicamente si se cumple el criterio explícito del plan; actualiza los mismos metadatos del material y recalcula su hash y evidencias. Si falta el plan, el criterio o una coincidencia inequívoca del módulo, conserva la evaluación y reporta que no pudo sincronizar el dominio. Relee el resultado, elimina marcadores pendientes y registra el formateador. En `EVIDENCIAS.md`, incluye fuentes, matriz de afirmaciones, auditoría, riesgo residual y SHA-256 del material publicado.
