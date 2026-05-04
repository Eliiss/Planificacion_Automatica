# Explicación de los métodos del dominio `emergencylogistics`

Este documento explica el comportamiento de los métodos HTN definidos en el dominio. Los métodos son los encargados de descomponer tareas abstractas, como enviar toda la ayuda o atender una localización, en subtareas más concretas y finalmente en operadores ejecutables.

## `enviar-todo`

El método `enviar-todo` es la tarea principal del dominio. Su objetivo es repetir el proceso de atención mientras exista alguna localización con necesidad pendiente. Para decidir qué localización atender, no escoge cualquier necesidad individual, sino que usa el predicado derivado `localizacion-maxima-necesidad ?loc`. Esto hace que se seleccione una localización cuya necesidad total pendiente sea máxima entre todas las localizaciones.

Cuando encuentra una localización candidata, el método descompone la tarea en dos pasos: primero llama a `atender-necesidad ?loc`, y después vuelve a llamarse recursivamente con `enviar-todo`. Esta recursión permite que, tras cada entrega, se recalculen las necesidades pendientes y se elija de nuevo la localización más prioritaria. Si ya no existe ninguna localización con necesidad total positiva, se aplica la rama `terminado`, que no genera ninguna acción y finaliza la planificación.

## `atender-necesidad`

El método `atender-necesidad ?loc` decide cómo atender la localización seleccionada. Su decisión depende principalmente de la necesidad total pendiente del sistema, de si existe stock suficiente para el tipo de necesidad encontrado y de si hay transportadores disponibles.

La primera rama, `ultima-caja-global-suelta`, se activa cuando solo queda una necesidad total pendiente en todo el sistema, representada con `need-total-sistema 1`. En ese caso se fuerza una entrega suelta mediante `entregar-suelta ?loc ?type`. Esta regla evita usar un transportador para transportar la última caja necesaria, incluso aunque exista stock sobrante en el depósito y haya un transportador disponible.

La segunda rama, `con-transportador`, se usa cuando queda más de una necesidad pendiente en el sistema y hay transportadores. En este caso no se atiende simplemente un tipo aislado, sino que se llama a `entregar-con-transportador ?loc`, que puede preparar una ruta con varias localizaciones y varias cargas. Esta es la rama principal para aprovechar transportadores.

La tercera rama, `sin-transportador`, cubre el caso en el que no hay transportadores. Si existe una necesidad positiva y stock suficiente para cubrirla, el método usa `entregar-suelta ?loc ?type`. Esta rama actúa como alternativa cuando no es posible usar transporte con capacidad.

## `entregar-suelta`

El método `entregar-suelta ?loc ?type` modela una entrega individual sin transportador. Primero obtiene el depósito, el dron y la posición actual del dron. Después mueve el dron al depósito si no está ya allí, recoge una unidad del tipo necesario con `!pick-loose`, vuela a la localización destino, entrega esa unidad con `!deliver-loose` y finalmente vuelve al depósito.

Este método siempre entrega una sola caja. Por eso está pensado para casos concretos: cuando solo queda una necesidad pendiente en todo el sistema o cuando no hay transportadores disponibles. En el flujo normal con transportadores, las entregas de varias unidades y varios tipos se gestionan con los métodos de ruta.

## `entregar-con-transportador`

El método `entregar-con-transportador ?loc` organiza una salida con transportador. Primero identifica el depósito, el dron, la posición actual del dron y el transportador que mejor se ajusta a la necesidad total de la localización inicial. Esa selección se hace mediante `elegir-transportador ?loc ?tr`, que escoge el menor transportador suficiente o, si ninguno alcanza la necesidad total, el mayor disponible.

Una vez elegido el transportador, el método mueve el dron al depósito, prepara la ruta con `preparar-ruta`, engancha el transportador, ejecuta la ruta con `entregar-ruta` y finalmente suelta el transportador en el depósito. La idea importante es que la ruta se prepara antes de salir: el transportador puede cargarse con cajas destinadas a varias localizaciones y entregarlas sin volver al depósito entre medias.

## `preparar-ruta`

El método `preparar-ruta ?d ?tr ?dep ?loc` prepara la carga del transportador antes de iniciar el viaje. Primero carga las necesidades de la localización inicial, que normalmente es la localización con mayor necesidad total pendiente. Después llama a `cargar-mas-localizaciones` para intentar aprovechar la capacidad libre restante del transportador con necesidades de otras localizaciones.

Este método no ejecuta vuelos ni entregas. Su responsabilidad es dejar el transportador cargado de forma útil antes de engancharlo y salir del depósito. Gracias a esta separación, la planificación distingue claramente entre la fase de carga y la fase de reparto.

## `cargar-mas-localizaciones`

El método `cargar-mas-localizaciones ?d ?tr ?dep` intenta añadir más localizaciones a la ruta mientras el transportador tenga capacidad libre. Para ello comprueba la capacidad total del transportador, la carga actual mediante `load-total`, y busca una localización con `need-total` positivo para la que exista alguna necesidad cargable.

La condición `hay-necesidad-cargable ?tr ?dep ?next-loc` evita entrar en una llamada recursiva que no vaya a cargar nada. Si encuentra una localización útil, llama a `cargar-necesidades-lugar` para cargar todo lo posible para esa localización y luego vuelve a llamarse para seguir buscando más destinos. Si no encuentra ninguna localización cargable, o si ya no queda capacidad libre, aplica la rama `terminado` y finaliza la preparación de la ruta.

Este método puede volver a considerar una localización si todavía tiene alguna necesidad pendiente que no se haya cargado. Sin embargo, no vuelve a cargar una necesidad ya cubierta, porque el cálculo de carga pendiente compara la necesidad con lo que ya está cargado para esa localización concreta.

## `cargar-necesidades-lugar`

El método `cargar-necesidades-lugar ?d ?tr ?dep ?loc` carga cajas destinadas a una localización concreta. Para cada tipo con necesidad positiva, calcula cuánta carga falta usando el predicado `load ?tr ?loc ?type ?old-load`. Ese predicado representa la carga del transportador para una localización y tipo concretos, por lo que evita mezclar cajas destinadas a distintos lugares.

La cantidad pendiente se calcula como `need - old-load`. Después se calcula la capacidad libre del transportador como `capacity - load-total`, y se elige la cantidad a cargar como el mínimo entre el stock disponible, la necesidad pendiente y la capacidad libre. Si esa cantidad es positiva, se ejecuta `!load-transporter`, que actualiza el stock del depósito, la carga del transportador para ese destino y tipo, y la carga total del transportador.

Después de cargar un tipo, el método se llama recursivamente para seguir cargando otros tipos o completar el mismo tipo si aún queda capacidad y necesidad pendiente. Cuando no hay más carga útil posible para esa localización, se aplica la rama `terminado`.

## `entregar-carga-lugar`

El método `entregar-carga-lugar ?d ?tr ?loc` entrega todas las cajas que el transportador lleva para una localización concreta. Busca cargas positivas mediante `load ?tr ?loc ?type ?load`, comprueba que la localización todavía necesita ese tipo y calcula la cantidad a entregar como el mínimo entre la carga disponible y la necesidad pendiente.

Cuando encuentra una entrega posible, ejecuta `!deliver-from-transporter`. Ese operador reduce la necesidad del lugar, actualiza `need-total` y `need-total-sistema`, reduce la carga del transportador para esa localización y tipo, y reduce `load-total`. Tras cada entrega, el método se llama recursivamente para seguir descargando otros tipos destinados al mismo lugar. Cuando ya no queda carga útil para esa localización, finaliza con la rama `terminado`.

## `entregar-ruta`

El método `entregar-ruta ?d ?tr ?dep ?current` ejecuta el reparto con varias paradas. Recibe la posición actual del dron y del transportador en `?current`. Si existe alguna localización para la que el transportador tenga carga pendiente, detectada mediante `tiene-carga-para ?tr ?next-loc`, vuela desde la posición actual hasta esa localización, entrega toda su carga con `entregar-carga-lugar` y continúa la ruta desde ese nuevo punto.

La ruta termina cuando la carga total del transportador llega a cero. En ese caso se aplica la rama `volver-deposito`, que vuela desde la localización actual hasta el depósito. Esta condición usa `load-total ?tr 0`, por lo que no necesita una precondición negativa para comprobar que ya no queda carga asignada.

Este método es el que permite evitar volver al depósito entre entregas. Mientras quede carga en el transportador, intenta visitar la siguiente localización con carga pendiente; solo cuando el transportador está vacío vuelve al depósito.

## `mover-drone`

El método `mover-drone ?d ?from ?to` abstrae el movimiento simple del dron sin transportador. Tiene una primera rama, `ya-esta`, que no hace nada si el dron ya está en el destino. Esto evita generar vuelos innecesarios cuando origen y destino coinciden.

Si el dron no está ya en el destino, se usa la rama `volar`, que comprueba que el dron está en `?from` y ejecuta el operador `!fly ?d ?from ?to`. Este método se usa sobre todo en entregas sueltas y para colocar el dron en el depósito antes de preparar una entrega con transportador.
