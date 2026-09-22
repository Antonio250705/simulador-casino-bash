**Simulador de Ruleta en Bash**

Mi proyecto lo realice de manera autodidacta para aprender sobre las MV, en este caso Parrot, para trastear con la terminal y mejorar mi programación. Un script que hice en Bash para simular y poner a prueba estrategias matemáticas clásicas en la ruleta del casino (como la Martingala y la Inverse Labouchere). Con el objetivo de mostrar que la casa nunca pierde y siempre va a perder el usuario.

Proyecto desarrollado con fines educativos basándome en los cursos de **S4vitar**, adaptado y personalizado para mi propio entorno de prácticas en Parrot OS.

**¿Qué hace?**

-Estrategias de apuestas: Implementa la lógica matemática de dos técnicas famosas Martingala y la Inverse para ver cómo evolucionan las tiradas.

-Diseño de terminal limpio: Usa códigos de colores ANSI y comandos de tput para que la consola se vea ordenada y no un caos de texto.

-Control de errores real: Maneja parámetros obligatorios con getopts y frena en seco el script si te quedas en bancarrota (evitar bucles infinitos).

**Requisitos y Ejecución**

Para ejecutar este script necesitas un entorno compatible con Bash (Linux / Unix / macOS o subsistemas como WSL en Windows).

1. Clonar el repositorio Bash git clone https://github.com/Antonio250705/simulador-casino-bash.git cd simulador-ruleta-bash
2. Dar permisos de ejecución Bash chmod +x ruleta.sh
3. Ejecutar el simulador El script requiere dos parámetros obligatorios: el dinero inicial (-m) y la técnica a utilizar (-t).

Bash ./ruleta.sh -m 1000 -t martingala -m: Dinero inicial con el que se desea comenzar la simulación.

-t: Técnica a emplear (martingala o inverseLabrouchere).

**Tecnologías Utilizadas:** Lógica de control de flujo, bucles, funciones y manejo de argumentos con getopts.

**Herramientas de Sistema:** tput para la gestión de la interfaz visual en terminal.
