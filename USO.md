# Guía de uso del motor pedagógico

Basta con pedirlo en lenguaje natural. Si el agente no activa el motor solo, llama a la skill **`motor-pedagogico-orquestar`** y él decide qué rutas y roles usar.

## Cómo llamarlo en cada arnés

| Arnés | Cómo forzar el motor |
|---|---|
| Codex | `$motor-pedagogico-orquestar …` |
| Claude Code | `/motor-pedagogico-orquestar …` |
| Antigravity / OpenCode | «Usa la skill motor-pedagogico-orquestar para…» |

> [!IMPORTANT]
> Abre el arnés en la carpeta del proyecto de estudio, donde está o va a estar `PLAN-ESTUDIO-<TEMA>.md`. Ahí el motor crea las carpetas `Modulo_NN_…` y busca el plan.

## 1. Nuevo tema (crear una ruta)

> «Crea una ruta para aprender **Programación reactiva en Java**. Mi nivel es intermedio y tengo 5 horas por semana.»

- El motor investiga el tema, lo divide en módulos y te **propone** el plan.
- Si dices «crea y **guarda** el plan» y no tuvo que suponer nada importante, escribe directamente el archivo `PLAN-ESTUDIO-…md`. Si tuvo que suponer algo, primero te pide que aceptes el alcance.
- Si quieres cambiar el criterio de dominio o la forma de evaluar, conviene decirlo aquí, porque ambos quedan fijados en el plan.

## 2. Trabajar una unidad (construir el material)

> «Construye la **unidad 3** del plan.»

- Pasa por cuatro fases: generador → investigador → verificador → redactor.
- Crea `Modulo_03_…/Módulo 3: <Título>.md` y `EVIDENCIAS.md`, y marca **Contenido [x]** en el plan.
- Opciones que puedes añadir a la petición:
  - «en **SOLO_LLM**»: más rápido, pero sin investigar ni auditar. El material queda marcado como borrador no verificado.
  - «en **MARKDOWN_PORTABLE**»: en lugar del formato Obsidian, que es el predeterminado.

## 3. Evaluarte

> «**Evalúame** sobre la unidad 3.»

- Por defecto: 20 preguntas, una por turno, sin ver correcciones hasta el final y con nota de 1 a 100.
- Puedes cambiar la configuración antes de la primera pregunta: «evalúame con **10 preguntas**» o «con **retroalimentación por respuesta**».
- Al terminar, guarda `Evaluación Módulo 3.md` y marca **Evaluación [x]**. **Dominio [x]** solo se marca si alcanzas el criterio definido en el plan.

## Ejecutar una sola fase

Para depurar o repetir una fase concreta, llama directamente a su skill: `motor-pedagogico-planificar-ruta`, `-generar-unidad`, `-investigar-unidad`, `-validar-unidad`, `-redactar-markdown` o `-evaluar-unidad`.
