---
name: motor-pedagogico-investigar-unidad
description: Investigar de forma focalizada las afirmaciones riesgosas de un borrador pedagógico y devolver correcciones y fuentes trazables. Usar después de generar una unidad, especialmente para datos variables, críticos, atribuidos o dudosos.
---

# Motor pedagógico: investigar una unidad

Investiga los riesgos del borrador recibido; no lo reescribas desde cero. Lee [references/matriz-riesgo.md](references/matriz-riesgo.md).

Clasifica las afirmaciones como P0, P1 o P2. Investiga todas las P0 y P1, además de cualquier P2 atribuida o dudosa. Para información cambiante o de alto impacto, navega y abre las fuentes reales. Prioriza documentación oficial, estándares, legislación vigente, artículos académicos originales y datos primarios; usa fuentes secundarias solo para contexto o cuando no exista una primaria accesible.

Registra por fuente: organización o autor, título, fecha, versión si aplica, fecha de consulta, URL directa y afirmaciones respaldadas. Distingue claramente evidencia, inferencia y recomendación. No uses el conocimiento del LLM ni el número de enlaces como prueba.

Entrega el borrador enriquecido sin alterar su intención pedagógica, una lista de correcciones, la matriz completa, exclusiones justificadas y `PAQUETE_PARA_VERIFICADOR`. Emite `INVESTIGACION_FOCALIZADA: COMPLETA` solo si no queda ninguna P0/P1 sin resolver; de lo contrario usa `INCOMPLETA` y enumera la brecha. No escribas los artefactos finales ni apruebes la unidad.
