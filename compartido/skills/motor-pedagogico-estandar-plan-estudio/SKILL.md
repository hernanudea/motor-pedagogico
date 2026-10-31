---
name: motor-pedagogico-estandar-plan-estudio
description: Investigar un tema, dividirlo en módulos y definir un plan de estudio portable antes de construir sus unidades. Usar al iniciar una ruta de aprendizaje desde un tema.
---

# Motor pedagógico: estándar de plan de estudio

Convierte un tema proporcionado por el usuario en una ruta modular, investigada y lista para que las demás fases construyan cada unidad. Lee [references/contrato-plan-estudio.md](references/contrato-plan-estudio.md). Declara `PERFIL_DOMINIO` cuando el tema requiera criterios especializados y transmite ese perfil a las fases posteriores.

## Investigación curricular

Investiga primero el mapa del tema: sus conceptos nucleares, subtemas, dependencias, prácticas reales y límites. Para información actual, crítica o controvertida, abre fuentes directas y registra su organización o autor, título, fecha o versión, URL y alcance. Distingue fuentes que justifican la estructura curricular de la evidencia que posteriormente validará cada unidad.

No inventes bibliografía ni presentes una preferencia didáctica como un hecho. Declara los supuestos de nivel, objetivo, tiempo y contexto cuando el usuario no los haya definido. Si un dato relevante no puede verificarse, limita su uso y márcalo para investigación durante la construcción de la unidad.

## Diseño de la ruta

Agrupa temas y subtemas en módulos progresivos. Cada módulo debe tener un propósito distinto, prerrequisitos explícitos, resultados observables, práctica, evidencia de dominio y estimación. Evita módulos que sean listas inconexas, dependencias circulares o saltos de dificultad. Incluye recuperación y práctica acumulativa cuando el tema lo necesite.

Define también un perfil de evaluación para la ruta y, si corresponde, ajustes por módulo. El perfil global predeterminado es de 20 preguntas, retroalimentación final y nota normalizada de 1 a 100. Puede cambiarse por una preferencia explícita del usuario o una necesidad pedagógica justificada. Declara un criterio de dominio verificable solo si el usuario lo proporciona o se puede inferir sin ambigüedad; de lo contrario déjalo pendiente.

Define además el seguimiento por módulo: `Contenido`, `Evaluación` y `Dominio`, inicialmente en `[ ]`. El contenido publicado, la evaluación realizada y el dominio demostrado son estados distintos.

Entrega `INVESTIGACION_CURRICULAR: COMPLETA` o `INCOMPLETA`, `MAPA_TEMATICO: LISTO` y `PLAN_RUTA: PROPUESTO`. Incluye la matriz de cobertura entre objetivos globales, módulos y evaluaciones. No escribas archivos ni desarrolles el contenido completo de los módulos.

## Materialización

El planificador usa este estándar para diseñar la ruta y el redactor lo usa para publicarla. No crees otro agente: la investigación curricular y el diseño pertenecen al rol `motor_pedagogico_planificador`; la publicación pertenece a `motor_pedagogico_redactor`.
