# Emergency Logistics

## Introducción

El dominio `emergencylogistics` es un sistema de planificación jerárquica que modela logística de emergencia. Un dron equipado con brazos robóticos debe entregar suministros a personas en diferentes ubicaciones. El planificador descompone tareas abstractas hasta llegar a operadores primitivos que interactúan directamente con el mundo.

## Operadores

El dominio tiene tres operadores que representan acciones concretas:

**`!fly`** permite que un dron vuele desde una ubicación a otra. Necesita que el dron esté en la ubicación origen y como resultado el dron estará en la ubicación destino.

**`!pick`** permite a un brazo del dron recoger una caja de suministros. Requiere que el brazo sea libre, el dron esté en la misma ubicación que la caja, y la caja esté llena. Como resultado, el brazo queda sosteniendo la caja.

**`!deliver`** permite entregar suministros de una caja a una persona. Necesita que el dron y la persona estén en la misma ubicación, el brazo tenga la caja, y la caja contenga el suministro que la persona necesita. Después de la entrega, el brazo queda libre.

## Métodos

Los métodos descomponen tareas abstractas en subtareas más simples:

**`enviar-todo`** es el método principal que controla el ciclo completo de entregas. Tiene dos ramas: la primera busca si hay alguna persona que necesite un suministro específico y, si la encuentra, llama a `atender-persona` para satisfacer esa necesidad, luego se llama recursivamente a sí mismo para continuar con las siguientes necesidades. La segunda rama se activa cuando no hay más necesidades insatisfechas y simplemente termina el plan exitosamente. Este patrón recursivo garantiza que todas las necesidades sean atendidas una por una.

**`atender-persona`** es el encargado de planificar la entrega completa a una persona específica. Primero busca en el estado del mundo los recursos disponibles: qué persona está en qué ubicación, dónde hay un dron libre, dónde está una caja con el suministro requerido y qué brazo del dron está disponible. Una vez identifica estos recursos, descompone la tarea en cuatro acciones secuenciales: mover el dron a la ubicación de la caja, recoger la caja con el brazo, mover el dron hacia la persona, y finalmente entregar el suministro.

**`mover-drone`** es un método auxiliar que optimiza los movimientos del dron. Implementa una estrategia inteligente con dos alternativas: si el dron ya está en la ubicación destino no realiza ninguna acción innecesaria, pero si está en la ubicación de origen, ejecuta el operador de vuelo para desplazarse. Este método evita que se generen planes ineficientes con movimientos redundantes.

## Flujo de Ejecución

El planificador comienza llamando a `enviar-todo`, que busca personas con necesidades insatisfechas. Para cada necesidad, `atender-persona` organiza la secuencia de acciones: busca un dron, una caja con el suministro correcto y organiza el transporte. El método `mover-drone` se encarga de los desplazamientos de forma inteligente. Finalmente, los operadores primitivos ejecutan las acciones concretas: volar, recoger y entregar. El proceso continúa hasta que no hay más necesidades.

## Características Principales

El dominio implementa una jerarquía clara desde tareas abstractas hasta acciones concretas. Los métodos buscan automáticamente los recursos disponibles en el estado del mundo. Usa recursión para procesar múltiples necesidades y optimiza movimientos evitando acciones innecesarias. Puede manejar múltiples drones, brazos, cajas y personas, permitiendo problemas complejos de logística.
