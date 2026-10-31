# Contrato de artefactos Markdown

## `PLAN-ESTUDIO-<TEMA>.md`

Usa el nombre definido por `$motor-pedagogico-estandar-plan-estudio`: tema en mayúsculas ASCII y palabras separadas por guiones. Incluye propiedades o cabecera, propósito, perfil, uso de la ruta, mapa de temas y subtemas, investigación curricular, tabla de unidades, detalle de unidades, matriz de cobertura y criterios de progreso. La tabla de unidades incluye `Contenido`, `Evaluación` y `Dominio` como casillas sincronizadas.

## `Módulo <N>: <Título>.md`

Metadatos, incluyendo `contenido`, `evaluacion` y `dominio`; navegación si es extenso, propósito, resultados, prerrequisitos, diagnóstico, mapa conceptual, explicación progresiva, ejemplos y contraejemplos, errores frecuentes, práctica, autoevaluación sin soluciones inmediatas, síntesis, próximos pasos y fuentes.

## `EVIDENCIAS.md`

Modelo de producción, fecha de corte, versiones, inventario de afirmaciones, matriz de investigación, fuentes, auditoría, validación de ejemplos, limitaciones, riesgo residual, formateador y SHA-256 hexadecimal del contenido exacto publicado.

## `Evaluación Módulo <N>.md`

Metadatos, unidad, fecha, perfil de evaluación aplicado, nota en la escala configurada y normalización 1–100 cuando corresponda, resumen, detalle de preguntas y respuestas, criterios, puntuaciones, retroalimentación, respuestas modelo, fortalezas, brechas y plan de refuerzo.

## Control de calidad

- Jerarquía de encabezados sin saltos.
- Tablas legibles y bloques de código etiquetados.
- Iconografía semántica consistente y no decorativa.
- Enlaces internos válidos y externos directos.
- Sin `TODO`, marcadores de plantilla ni afirmaciones agregadas por el redactor.

## Recuperación de publicación

El orden obligatorio es material, lectura y hash desde disco, y evidencias. La presencia aislada de `Módulo <N>: <Título>.md` puede recuperarse creando `EVIDENCIAS.md` solo si el material exacto corresponde al payload aprobado. `EVIDENCIAS.md` sin material, un hash discrepante o un material distinto constituyen un estado inconsistente: no sobrescribir y solicitar dirección.
