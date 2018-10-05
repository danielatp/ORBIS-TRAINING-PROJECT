# capacitacion-problema1

# Ejercicio 1
Capacitación: Git, bash y docker
Integrantes:
- Rafael Montoya
- Daniela Tizón
- Claudia Valdivieso

---


1. ¿Qué importancia tiene los tags en un proyecto?
  - Para el versionamiento de mi código :D

2. ¿Cuál es la diferencia entre un tag normal y un tag anotado en git?
  - En que en el tag anotado puedes poner un mensaje 👍

3. ¿Cómo se sube todos los tags de git que hay en mi local?
  - Con el comando `git push --tags`

4. ¿Es necesario loguearse cada vez que subo una imagen a dockerhub?
  - No.

5. ¿Qué es y para qué sirve docker?
  - Docker es una plataforma Open Source para desarrollar, implementar y ejecutar aplicaciones dentro de contenedores.
  - Sirve para empaquetar ambientes de desarrollo.

---

6. ¿Cuál es la diferencia entre docker y VirtualBox?
- Docker me permite crear contenedores para tus app trabajando desde el kernel <3 y VirtualBOx crea una maquina virtual con hardware designado para cada app :/

7. ¿Es necesario depender de una imagen de docker base al crear una imagen nueva?
- Nope, porque se puede crear desde scratch 

8. ¿Porqué debo anteponer el nombre de usuario en una imagen docker nueva?
- Para identificar al propietario del dockerhub 

9. ¿Que pasa si creo una imagen sin especificar una versión o tag, con qué versión se crea? 
- Se le agrega el tag latest 

happy :whale:

---

¿Porqué es necesario crear un contenedor con esta bandera -it ? ¿Qué pasa si no le pongo -it?
- `-i` es para que los comandos que ingresemos en nuestra terminal se ejecuten en la terminal de docker.
- `-t` es para que podamos ver los logs de la terminal de docker.

¿Para qué sirve ejecutar el comando bash al ejecutar una imagen?
- Para poder ejecutar comandos en el contenedor.

 ¿Cuál es la diferencia entre docker ps y docker ps -a?
 - `docker ps` muestra todos los contenedores que están corriendo.
 - `docker ps -a` muestra todos los contenedores.

COMANDO PARA EJECUTAR EL CONTENEDOR
```
docker run -it --rm dtizonportilla/orbis-training-docker:0.2.0 bash
```

---


1. ¿Cuál es la diferencia entre una imagen y un contenedor?
- Una imagen es como una plantilla y el contenedor es la instancia de esa plantilla.

2. ¿Cómo listo las imágenes que hay en mi computadora?
- Con el comando `docker images`

3. ¿Cómo salgo de un contenedor de docker?
- Con `Ctrl-C`

4. ¿Se elimina el contenedor al salir de ella?
- Si le pones los flags `--rm` sí se eliminar, pero sino no.

5. ¿Cómo elimino un contenedor?
- Con el comando `docker rm <NAME O CONTAINER ID>`

6. ¿Para qué es necesario el flag `-i`, `-t`, `--rm`?
- `-i` es para que los comandos que ingresemos en nuestra terminal se ejecuten en la terminal de docker.
- `-t` es para que podamos ver los logs de la terminal de docker.
- `--rm` es para eliminar el contenedor apenas se sale de él.

---

7. ¿Cómo verifico que el archivo creado se encuentra en la imagen?
- Con los siguientes comandos:
```
docker run -it --rm dtizonportilla/orbis-training-docker:0.2.0 bash
# cd app
# ls
```

8. ¿Cómo se comenta una linea de código en Dockerfile?
- Se comenta agregando un hash `#` al inicio de la línea.

1. ¿Qué es NGINX?
- Un servidor web. 

2. ¿Cómo expongo puertos en docker?
- Se expone con `EXPOSE` en el Dockerfile.

3. ¿Cómo especifico los puertos al levantar un contenedor (docker run)?
- Con `-p <puerto local>:<puerto expuesto en el contenedor>` 

4. ¿Cómo hago 'forward' al levantar un contenedor (docker run)?
- Con `-p`

---


# PARTE 7
- ¿Qué pasa si no especifico el directorio de trabajo?
  El comando se ejecuta en el directorio raíz del container.

1. ¿Es necesario especificar el `workdir` en docker?, ¿Porqué?
Si es que no se quiere ejecutar los comandos el el directorio raíz, sí.

2. ¿Que hacen los siguientes comandos?
-`docker ps`
  Muestra todos los contenedores que estan levantados.

-`docker pull`
  Descarga la imagen o un repositorio de un registro. Especificar la imagen debe.

-`docker push`
  Sube una imagen a un respositorio.

-`docker rm`
  Borra un contenedor especificado.

-`docker rmi`
  Borra la imagen especificada.

-`docker run`
  Levanta un contenedor, basado en una imagen.

-`docker tag`
  Crea un tag a la imagen.

---

-`docker search`
  Busca imágenes en docker hub.

-`docker login`
  Permite loguearse a docker hub.

-`docker exec`
  Permite ejecutar comandos en un contenedor que ya está levantado.

-`docker build`
  Construye la imagen.

-`docker inspect`
  Muestra información sobre el contenedor especificado.

-`docker network`
  Permite administrar la red. Conectar, desconectar, crear, inspeccionar, listar...

---


# PARTE 8

1. ¿Qué es bash? ¿Qué significa?
-  Es un programa informático, cuya función consiste en interpretar órdenes, y un lenguaje de consola.

2. ¿Cómo ejecuto un archivo bash?
- . < archivo > / bash < archivo > 

3. ¿Qué pasa si no especifico en un `.sh`, la linea `#!/bin/bash`?
- Es una convención de Unix. Si no está, el archivo SOLO se ejecuta con bash / zsh o cualquiera sea tu shell.

4. ¿Se puede cambiar el modo bash (`/bin/bash`) a otro tipo de ejecución?
- Sí! Lee arriba.

---

5. ¿Cómo se envía variables de entorno por Docker CLI y docker-compose?

Docker CLI:
```
-e NAME='Harry Potter'
```
docker-compose:
  ```
  service:
    environment:
      - DEBUG=1
```

---


# PARTE 9

  1. Qué sucede si le quito el @ al target resources del Makefile?
  - Se ejecuta y se imprime el comando

  2. ¿Para qué sirve el archivo `Makefile`?
  Para ejecutar archivos, o comandos.

  3. ¿Qué es un `target` en `Makefile`?
  - Generalmente es un archivo generado por un programa. También puede ser un comando para ejecutar ua tarea.

# PARTE 10

1. ¿Qué significa el comando -d?
- Especifica un directorio

2. ¿Porqué la sentencia comienza con @?
- Oculta la instrucción ejecutada

3. ¿Para qué sirve el comando mkdir?
- Para crear una carpeta

4. Explicar lo que hace la función `mkdir_deploy_dir`
- Si no existe el directorio, entonces crear la carpeta

# PARTE 10

1. ¿Para qué sirve el uso de \?
- Para el salto de línea

2. ¿Para qué sirve el uso de &&?
- Es un comando lógico que se ejecuta cuando el comando anterior se ejecutó con éxito
 
3. ¿Qué función cumple usar los argumentos -rf?
- Para realizar una eliminación recursiva forzada

4. Explicar lo que hace la función `git_init` (linea por linea)
- Primero se ubica en el directorio gh-pages, luego elimina el `.git` y después inicializa git

# PARTE 10 

1. ¿Para qué sirve el uso de eval?
- Para ejecutar un comando almacenado en un a variable

2. ¿Para qué sirve el uso de shell?
- Para interpretar comando en el Makefile

3. ¿Para qué sirve el uso de git log --pretty=format:"%an"?
- git log: enlista la historia de commits
- pretty=format te permite especificar lo que quieres que te muestre , %an se refiere a AuthorName

4. ¿Cuál es la diferencia en usar git config y git config --global?
- Con global puedo configurar de manera global, no tengo que volver a configurarlo en cada repositorio. 
- El global modifica el archivo .gitconfig de l usuario de mi máquina, el otro crea el archivo config dentro de la carpeta .git del repositorio. 

5. Explicar lo que hace la función `git_config` (línea por línea)
- Crea las variables de `GIT_USER_NAME` y `GIT_USER_EMAIL`. Luego entra al directorio especificado y configura el nombre y usuario de git con las variables guardadas.

# PARTE 10

1. ¿Para qué sirve el uso de awk?
- AWK es un lenguaje de programación diseñado para procesar datos basados en texto.

2. ¿Para qué sirve el uso de sed?
- sed  permite modificar el contenido de un fichero en base a un fichero de comandos. 

3. Explicar lo que hace la función `git_add_remote_repository`
- 1era linea: Guarda en una variable el nombre del repositorio remoto del push
- 2da linea: Busca una cadena y reemplaza el valor que está buscando por otro valor. Es como un replace.- Luego entra a la carpeta especificada y agrega como origen del repositorio la variable guardada.

# PARTE 11

1. Explicar lo que hace la función `create_branch_gh_pages`
- Entra al directorio especificado, y luego está creando y cambiando a la rama especificada.


