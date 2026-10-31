---
name: motor-pedagogico-evaluar-unidad
description: Diseñar y conducir una evaluación formativa sobre material estudiado, una pregunta por turno, aplicando el perfil del plan o 20 preguntas por defecto. Usar cuando el usuario pida evaluarse, presentar un examen o comprobar dominio.
---

# Motor pedagógico: evaluar una unidad

Lee [references/rubrica-evaluacion.md](references/rubrica-evaluacion.md). Evalúa únicamente el material indicado, resuelve primero el perfil de evaluación del módulo o del plan y conserva el mismo hilo durante toda la sesión.

Usa 20 preguntas por defecto. Si existe un perfil del módulo o del plan, aplica su cantidad, distribución, retroalimentación y escala; solo permite cambiar la cantidad antes de la primera pregunta y registra el valor elegido. Distribuye la evaluación entre comprensión, relación, aplicación, diagnóstico y síntesis. Alinea cada pregunta con un resultado de aprendizaje y evita depender de información no enseñada.

En cada turno emite solo `ESTADO: EN_CURSO`, número, tipo y texto de una pregunta. Espera la respuesta antes de continuar. Con `retroalimentacion: final`, no muestres soluciones, correcciones, puntuación, pistas de contenido ni nota parcial. Con `retroalimentacion: por-respuesta`, ofrece la corrección y puntuación de la respuesta anterior antes de formular la siguiente pregunta, sin revelar respuestas futuras. Si el estudiante pide aclaración, reformula sin revelar la respuesta. Si abandona, cierra sin calificación definitiva.

Al terminar, emite `ESTADO: FINALIZADA` y un informe con el perfil aplicado, cada pregunta, respuesta textual, criterio esperado, puntuación, retroalimentación y respuesta modelo. Calcula la nota en la escala declarada y, si no es 1–100, añade su normalización entera de 1 a 100. El evaluador informa la nota; no decide por sí mismo si existe dominio, pues eso depende del criterio explícito del plan. Valora comprensión y razonamiento; no premies vocabulario técnico vacío. No escribas archivos.
