# Contrato portable de plan de estudio

## Nombres y ubicación

- Plan global: `PLAN-ESTUDIO-<TEMA>.md`, donde `<TEMA>` se transforma a mayúsculas ASCII y palabras separadas por guiones. Ejemplo: `PLAN-ESTUDIO-PROGRAMACION-REACTIVA-JAVA.md`.
- Carpeta de módulo: `Modulo_<NN>_<NOMBRE-CORTO>/`.
- Material de una unidad: `Modulo_<NN>_<NOMBRE-CORTO>/Módulo <N>: <Título>.md`.
- Evidencias de una unidad: `Modulo_<NN>_<NOMBRE-CORTO>/EVIDENCIAS.md`.
- Informe de evaluación: `Modulo_<NN>_<NOMBRE-CORTO>/Evaluación Módulo <N>.md`.

Si el proyecto ya declara una convención incompatible en sus instrucciones, esa convención tiene precedencia y debe registrarse como perfil local. Nunca se renombran ni sobrescriben artefactos existentes sin autorización.

## Investigación curricular mínima

El plan debe separar:

- Objetivo de desempeño, público, prerrequisitos, restricciones y supuestos.
- Mapa jerárquico de temas y subtemas investigados.
- Fuentes directas que sustentan la clasificación o secuencia; fecha de consulta y alcance.
- Riesgos, vacíos y afirmaciones que cada unidad deberá investigar y auditar antes de publicarse.

## Contenido obligatorio del plan

1. Propósito, perfil inicial, objetivo global y criterio de finalización.
2. `PERFIL_DOMINIO` cuando corresponda, usando el `ID` del registro local `.agents/motor-pedagogico-perfiles.md`, y las restricciones que deben heredar las unidades.
3. Alcance, exclusiones, supuestos y forma de evaluación.
4. Mapa de temas y subtemas con dependencias relevantes.
5. Tabla de módulos con identificador, título, propósito, resultados, temas, práctica, evidencia, prerrequisitos, estimación y las casillas `Contenido`, `Evaluación` y `Dominio`.
6. Desarrollo breve de cada módulo, incluyendo recuperación, transferencia y criterio para avanzar.
7. Matriz de cobertura: cada objetivo global debe enlazar con uno o más módulos y una evidencia de dominio.
8. Fuentes de investigación curricular y temas que requieren verificación posterior.

## Perfil de evaluación

El plan declara un perfil de evaluación reutilizable con estos campos:

- `preguntas`: 20 por defecto; un módulo puede definir otra cantidad si su alcance lo justifica.
- `distribucion`: cobertura de comprensión, relación, aplicación, diagnóstico y síntesis; debe indicar pesos o permitir la distribución automática de la rúbrica.
- `retroalimentacion`: `final` por defecto o `por-respuesta` cuando el plan requiera práctica formativa inmediata.
- `escala`: `1-100` por defecto. Si se usa otra, el informe conserva además una normalización a 1–100 para el seguimiento comparable.
- `criterio_dominio`: condición explícita para marcar el dominio; puede quedar pendiente.

El evaluador resuelve primero el ajuste del módulo, luego el perfil del plan y finalmente los valores globales. La cantidad de preguntas debe quedar fijada antes de formular la primera pregunta y no cambia durante ese intento.

## Seguimiento sincronizado

Cada módulo comienza con `Contenido: [ ]`, `Evaluación: [ ]` y `Dominio: [ ]`.

- `Contenido` pasa a `[x]` únicamente cuando la unidad fue publicada con investigación completa y auditoría aprobada.
- `Evaluación` pasa a `[x]` únicamente cuando existe un informe final de evaluación para ese módulo.
- `Dominio` pasa a `[x]` únicamente si existe evaluación final y satisface el criterio de dominio declarado en el plan, usando la escala declarada o su normalización a 1–100. Si el criterio no existe, permanece `[ ]`; una nota por sí sola no autoriza inferirlo.

El material de la unidad replica estos tres estados en su frontmatter o metadatos equivalentes. Al actualizarlo después de una evaluación, se recalcula el hash de `EVIDENCIAS.md`. El redactor cambia solo el módulo objetivo y nunca desmarca un estado ni modifica otro módulo.

## Criterios de calidad

- La división modular responde a dependencias y desempeños, no a una cantidad fija de capítulos.
- Cada módulo puede construirse y evaluarse de forma independiente sin perder la secuencia.
- Las fuentes curriculares no sustituyen la investigación y auditoría de afirmaciones materiales al construir cada unidad.
- El plan propuesto se presenta para aceptación cuando existan supuestos que cambien materialmente alcance, duración o nivel.
