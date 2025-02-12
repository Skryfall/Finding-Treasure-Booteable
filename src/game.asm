org 0x8000                          ; Posicion de memoria inicial del kernel
bits 16                             ; Cantidad de bits a utilizar

    jmp startProgram                ; Salta al inicio del programa
    nop                             ; Sin operacion

; Seccion de Variables

width dw  140h                      ; Ancho de la pantalla 320 p
height dw  0c8h                     ; Alto de la pantalla 200 p
gameWidht  dw  8ch                  ; Ancho de la pantall de juego 100 p
gameHeight dw  8ch                  ; Alto de la pantalla de juego 100 p

time db  00h                        ; Tiempo utilizado para el framerate del juego

level dw 01h                        ; Nivel del juego

random1 dw 00h                      ; Numero aleatorio 1
random2 dw 00h                      ; Numero aleatorio 2

gamePause dw 00h                    ; Indicador de juego en pausa (0 no, 1 si)

cyclesSinceLastBomb dw 00h

alienx dw  05h                      ; Posicion x del alien 
alieny dw  05h                      ; Posicion y del alien
talienx dw 05h                      ; Posicion temporal x del alien
talieny dw 05h                      ; Posicion temporal y del alien
alienv dw  0ah                      ; Velocidad del alien
alienc dw  02h                      ; Color del alien
aliens dw  05h                      ; Altura y ancho del alien
alienm dw  00h                      ; Ultima direccion del alien (0 der, 1 aba, 2 izq, 3 arr)

bulletx dw  05h                     ; Posicion x de la bala
bullety dw  05h                     ; Posicion y de la bala
bulletv dw  0ah                     ; Velocidad de la bala
bulletc dw  0ch                     ; Color de la bala
bullets dw  05h                     ; Altura y ancho de la bala
bulletb dw  00h                     ; Bala en pantalla (0 no, 1 si)
bulletd dw  00h                     ; Direccion de la bala (0 der, 1 aba, 2 izq, 3 arr)
bulletq dw  00h                     ; Cantidad de balas del alien

bossx dw 41h                        ; Posicion x del jefe
bossy dw 41h                        ; Posicion y del jefe
bossc dw 04h                        ; Color del jefe
bosss dw 05h                        ; Tamano del jefe

flowersc dw 0eh                     ; Color de las flores
flowerss dw 05h                     ; Altura y ancho de las flores
flowersi dw 00h                     ; Indice para contar flores
flowerx dw 00h                      ; Posicion x de la flor actual
flowery dw 00h                      ; Posicion y de la flor actual

flowersx1 dw 0fh, 19h, 41h, 41h, 73h, 7dh, 87h ; Posicion x de las flores nivel 1
flowersy1 dw 37h, 73h, 19h, 87h, 7dh, 19h, 41h ; Posicion y de las flores nivel 1
flowersb1 dw 01h, 01h, 01h, 01h, 01h, 01h, 01h ; Flores en pantalla (0 no, 1 si) nivel 1
flowersa1 dw 0eh                    ; Cantidad de flores nivel 1

flowersx2 dw 4bh, 69h, 73h, 87h, 87h, 2dh, 05h, 4bh, 69h, 19h, 7dh, 2dh, 4bh, 19h ; Posicion x de las flores nivel 2
flowersy2 dw 0fh, 0fh, 0fh, 0fh, 23h, 41h, 55h, 5fh, 5fh, 73h, 73h, 7dh, 7dh, 91h ; Posicion y de las flores nivel 2
flowersb2 dw 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h ; Flores en pantalla (0 no, 1 si) nivel 2
flowersa2 dw 1ch                    ; Cantidad de flores nivel 2

flowersx times 14 dw 00h            ; Posicion x de las flores
flowersy times 14 dw 00h            ; Posicion y de las flores
flowersb times 14 dw 00h            ; Flores en pantalla (0 no, 1 si)
flowersa dw 00h                     ; Cantidad de flores

wallsc1 dw 01h                      ; Color 1 de las paredes
wallsc2 dw 0bh                      ; Color 2 de las paredes
twallsc dw 00h                      ; Color actual a pintar
wallss dw 05h                       ; Altura y ancho de las paredes
wallsi dw 00h                       ; Indice para contar las paredes
wallx dw 00h                        ; Posicion x de la pared actual
wally dw 00h                        ; Posicion y de la pared actual

wallsx1 dw 37h, 41h, 4bh, 2dh, 37h, 41h, 4bh, 55h, 23h, 2dh, 55h, 5fh, 23h, 2dh, 55h, 5fh, 23h, 2dh, 55h, 5fh, 2dh, 37h, 41h, 4bh, 55h, 37h, 41h, 4bh ; Posicion x de las paredes nivel 1
wallsy1 dw 23h, 23h, 23h, 2dh, 2dh, 2dh, 2dh, 2dh, 37h, 37h, 37h, 37h, 41h, 41h, 41h, 41h, 4bh, 4bh, 4bh, 4bh, 55h, 55h, 55h, 55h, 55h, 5fh, 5fh, 5fh ; Posicion y de las paredes nivel 1
wallsb1 dw 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h ; Paredes en pantalla (0 no, 1 celeste claro, 2 celeste oscuro) nivel 1
wallsa1 dw 38h                      ; Cantidad de paredes nivel 1

wallsx2 dw 55h, 55h, 55h, 73h, 7dh, 87h, 91h, 19h, 23h, 2dh, 37h, 41h, 4bh, 55h, 5fh, 69h, 19h, 23h, 2dh, 37h, 41h, 4bh, 55h, 5fh, 69h, 23h, 5fh, 23h, 4bh, 55h, 5fh, 69h, 73h, 7dh, 23h, 5fh, 23h, 37h, 5fh, 05h, 0fh, 19h, 23h, 2dh, 37h, 5fh, 0fh, 37h, 5fh, 0fh, 37h, 5fh, 0fh, 37h, 5fh, 0fh, 37h, 41h, 4bh, 55h, 5fh, 69h, 73h, 7dh, 87h, 91h, 0fh, 37h, 41h, 4bh, 55h ; Posicion x de las paredes nivel 2
wallsy2 dw 05h, 0fh, 19h, 19h, 19h, 19h, 19h, 23h, 23h, 23h, 23h, 23h, 23h, 23h, 23h, 23h, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 37h, 37h, 41h, 41h, 41h, 41h, 41h, 41h, 41h, 4bh, 4bh, 55h, 55h, 55h, 5fh, 5fh, 5fh, 5fh, 5fh, 5fh, 5fh, 69h, 69h, 69h, 73h, 73h, 73h, 7dh, 7dh, 7dh, 87h, 87h, 87h, 87h, 87h, 87h, 87h, 87h, 87h, 87h, 87h, 91h, 91h, 91h, 91h, 91h ; Posicion y de las paredes nivel 2
wallsb2 dw 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h ; Paredes en pantalla (0 no, 1 celeste claro, 2 celeste oscuro) nivel 2
wallsa2 dw 8eh                      ; Cantidad de paredes nivel 2

wallsx times 71 dw 00h              ; Posicion x de las paredes
wallsy times 71 dw 00h              ; Posicion y de las paredes
wallsb times 71 dw 00h              ; Paredes en pantalla (0 no, 1 si)
wallsa dw 00h                       ; Cantidad de paredes

textColor     dw 09h
bombsc dw 07h                       ; Color de las bombas
bombss dw 05h                       ; Altura y ancho de las bombas
bombsi dw 00h                       ; Indice para contar las bombas
bombx dw 00h                        ; Posicion x de la bomba actual
bomby dw 00h                        ; Posicion y de la bomba actual

bombsx times 30 dw 00h              ; Posicion x de las bombas
bombsy times 30 dw 00h              ; Posicion y de las bombas
bombsb times 30 dw 00h              ; Bombas en pantalla (0 no, 1 si)
bombsa dw 00h                       ; Cantidad de bombas

texti dw 00h
textx dw 00h
texty dw 94h
testText dw 'Esto es una prueba', 0h

textControls0 dw '============CONTROLES============', 0h
textControls1 dw 'Mover Alien...Flechas del teclado', 0h
textControls2 dw 'Disparar......Tecla "SPACE"', 0h
textControls3 dw 'Pausa.........Tecla "L"', 0h
textControls4 dw 'Reiniciar.....Tecla "R"', 0h
textControls5 dw '=================================', 0h

textLevel1 dw 'Nivel: PRINCIPIANTE', 0h
textLevel2 dw 'Nivel: AVANZADO', 0h

textMenu0 dw '====================================', 0h
textMenu1 dw '          FINDING TREASURE          ', 0h
textMenu2 dw '              PARTE I               ', 0h
textMenu3 dw '====================================', 0h
textMenu4 dw '     Presione SPACE para iniciar    ', 0h


textEnd0 dw '====================================', 0h
textEnd1 dw '          FELICITACIONES            ', 0h
textEnd2 dw '      HAS COMPLETADO EL JUEGO       ', 0h
textEnd3 dw '====================================', 0h
textEnd4 dw '   Presione SPACE para continuar    ', 0h





; Seccion de logica del juego

startProgram:                       ; Funcion de inicio del programa
    call    initializeDisplay       ; Llama a la funcion para inicializar el display
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     menuLoop                ; Llama a la funcion del ciclo del menu

menuLoop:                           ; Ciclo principal del menu
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      menuLoop                ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo
  
    call    checkPlayerMenuAction   ; Llama la funcion encargada de verificar teclas en el menu principal

    call    drawTextMenu            ; Llama a la funcion encargada de escribir texto del menu

    jmp     menuLoop                ; Salta al incio de la funcion

startGame:                          ; Funcion de inicio del juego
    call    setLevel1               ; Llama a la funcion para colocar los parametros del primer nivel
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     gameLoop                ; Salta a la funcion principal del programa

advanceGame:                        ; Funcion encargada de avanzar el juego
    call    clearBullet             ; Llama a la funcion encargada de quitar la bala de la pantalla
    call    clearBombs              ; Llama a la funcion para quitar las bombas en pantalla
    mov     ax, 01h                 ; Mueve 1 a ax
    cmp     [level], ax             ; Verifica si se gano el nivel 1 o 2
    je      advanceGameAux          ; Si fue el 1, avanza al 2
    jmp     endGame                 ; Si fue el 2, termina el juego

advanceGameAux:
    call    setLevel2               ; Llama a la funcion para colocar los parametros del segundo nivel
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     gameLoop                ; Salta a la funcion principal del programa

gameLoop:                           ; Ciclo principal del juego
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      gameLoop                ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo

    call    checkPlayerAction       ; Llama a la funcion para mover el alien

    call    drawAlien               ; Llama a la funcion para dibujar al alien
    call    drawBullet              ; Llama a la funcion para dibujar la bala
    call    drawFlowers             ; Llama a la funcion para dibujar las flores
    call    drawWalls               ; Llama a la funcion para dibujar las paredes
    call    drawBoss                ; Llama a la funcion para dibujar al jefe
    call    drawBombs               ; Llama a la funcion para dibujar bombas

    call    drawTextControls        ; Llama a la funcion encargada de escribir texto del juego

    jmp     gameLoop                ; Salta al incio de la funcion

endGame:                            ; Funcion de fin del juego
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     endLoop                 ; Llama a la funcion del ciclo de fin del juego

endLoop:                            ; Ciclo principal del fin del juego
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      endLoop                 ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo
  
    call    checkPlayerEndAction    ; Llama la funcion encargada de verificar teclas en el menu principal

    call    drawTextEnd             ; Llama a la funcion encargada de escribir texto del fin del juego

    jmp     endLoop                 ; Salta al incio de la funcion

initializeDisplay:                  ; Funcion requerida para inicializar el display
    mov     ah, 00h                 ; Activar el modo video
    mov     al, 13h                 ; 320x200 256 colores
    int     10h                     ; Ejecutar interrupcion
    ret                             ; Retornar

setLevel1:                          ; Funcion encargada de iniciar el primer nivel del juego
    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [level], ax             ; Mueve ax al nivel actual

    mov     ax, 05h                 ; Mueve 5 a ax
    mov     [alienx], ax            ; Mueve el 5 a la posicion inicial x del alien
    mov     [alieny], ax            ; Mueve el 5 a la posicion inicial y del alien
    mov     [talienx], ax           ; Mueve el 5 a la posicion inicial temporal x del alien
    mov     [talieny], ax           ; Mueve el 5 a la posicion inicial temporal y del alien

    mov     ax, 41h                 ; Mueve un 65 a ax
    mov     [bossx], ax             ; Mueve el 65 a la posicion inicial x del jefe
    mov     [bossy], ax             ; Mueve el 65 a la posicion inicial y del jefe

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Mueve el contenido de ax a la variable de pausa
    mov     [bulletq], ax           ; Mueve ax a la cantidad de balas del alien

    mov     ax, [wallsa1]           ; Mueve a ax cantidad de paredes de nivel 1
    mov     [wallsa], ax            ; Almacena la cantidad de paredes
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux            ; Salta a la funcion auxiliar

setLevel1Aux:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel1Aux2           ; Si son iguales salta a la funcion auxiliar 2
    mov     bx, wallsx1             ; Mueve el puntero de posiciones x de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsx              ; Mueve el puntero de posiciones x de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux            ; Salta al inicio de esta funcion

setLevel1Aux2:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux3           ; Salta a la funcion auxiliar 3

setLevel1Aux3:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel1Aux4           ; Si son iguales salta a la funcion auxiliar 4
    mov     bx, wallsy1             ; Mueve el puntero de posiciones y de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsy              ; Mueve el puntero de posiciones y de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux3           ; Salta al inicio de esta funcion

setLevel1Aux4:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux5           ; Salta a la funcion auxiliar 5

setLevel1Aux5:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel1Aux6           ; Si son iguales salta a la funcion auxiliar 6
    mov     bx, wallsb1             ; Mueve el puntero de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsb              ; Mueve el puntero de posiciones de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux5           ; Salta al inicio de esta funcion

setLevel1Aux6:
    mov     ax, [flowersa1]         ; Mueve a ax cantidad de flores de nivel 1
    mov     [flowersa], ax          ; Almacena la cantidad de flores
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux7           ; Salta a la funcion auxiliar 7

setLevel1Aux7:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      setLevel1Aux8           ; Si son iguales salta a la funcion auxiliar 8
    mov     bx, flowersx1           ; Mueve el puntero de posiciones x de flores del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersx            ; Mueve el puntero de posiciones x de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux7           ; Salta al inicio de esta funcion

setLevel1Aux8:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux9           ; Salta a la funcion auxiliar 9

setLevel1Aux9:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      setLevel1Aux10          ; Si son iguales salta a la funcion auxiliar 10
    mov     bx, flowersy1           ; Mueve el puntero de posiciones y de flores del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersy            ; Mueve el puntero de posiciones y de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux9           ; Salta al inicio de esta funcion

setLevel1Aux10:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux11          ; Salta a la funcion auxiliar 11

setLevel1Aux11:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      exitRoutine             ; Si son iguales salta a la funcion de salida
    mov     bx, flowersb1           ; Mueve el puntero de flores del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersb            ; Mueve el puntero de posiciones de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux11          ; Salta al inicio de esta funcion

setLevel2:                          ; Funcion encargada de iniciar el segundo nivel del juego
    mov     ax, 02h                 ; Mueve 2 a ax
    mov     [level], ax             ; Mueve ax al nivel actual

    mov     ax, 05h                 ; Mueve 5 a ax
    mov     [alienx], ax            ; Mueve el 5 a la posicion inicial x del alien
    mov     [alieny], ax            ; Mueve el 5 a la posicion inicial y del alien
    mov     [talienx], ax           ; Mueve el 5 a la posicion inicial temporal x del alien
    mov     [talieny], ax           ; Mueve el 5 a la posicion inicial temporal y del alien

    mov     ax, 91h                 ; Mueve un 145 a ax
    mov     [bossx], ax             ; Mueve el 145 a la posicion inicial x del jefe
    mov     [bossy], ax             ; Mueve el 145 a la posicion inicial y del jefe

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Mueve el contenido de ax a la variable de pausa
    mov     [bulletq], ax           ; Mueve ax a la cantidad de balas del alien

    mov     ax, [wallsa2]           ; Mueve a ax cantidad de paredes de nivel 2
    mov     [wallsa], ax            ; Almacena la cantidad de paredes
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux            ; Salta a la funcion auxiliar

setLevel2Aux:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel2Aux2           ; Si son iguales salta a la funcion auxiliar 2
    mov     bx, wallsx2             ; Mueve el puntero de posiciones x de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsx              ; Mueve el puntero de posiciones x de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux            ; Salta al inicio de esta funcion

setLevel2Aux2:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux3           ; Salta a la funcion auxiliar 3

setLevel2Aux3:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel2Aux4           ; Si son iguales salta a la funcion auxiliar 4
    mov     bx, wallsy2             ; Mueve el puntero de posiciones y de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsy              ; Mueve el puntero de posiciones y de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux3           ; Salta al inicio de esta funcion

setLevel2Aux4:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux5           ; Salta a la funcion auxiliar 5

setLevel2Aux5:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel2Aux6           ; Si son iguales salta a la funcion auxiliar 6
    mov     bx, wallsb2             ; Mueve el puntero de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsb              ; Mueve el puntero de posiciones de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux5           ; Salta al inicio de esta funcion

setLevel2Aux6:
    mov     ax, [flowersa2]         ; Mueve a ax cantidad de flores de nivel 2
    mov     [flowersa], ax          ; Almacena la cantidad de flores
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux7           ; Salta a la funcion auxiliar 7

setLevel2Aux7:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      setLevel2Aux8           ; Si son iguales salta a la funcion auxiliar 8
    mov     bx, flowersx2           ; Mueve el puntero de posiciones x de flores del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersx            ; Mueve el puntero de posiciones x de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux7           ; Salta al inicio de esta funcion

setLevel2Aux8:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux9           ; Salta a la funcion auxiliar 9

setLevel2Aux9:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      setLevel2Aux10          ; Si son iguales salta a la funcion auxiliar 10
    mov     bx, flowersy2           ; Mueve el puntero de posiciones y de flores del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersy            ; Mueve el puntero de posiciones y de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux9           ; Salta al inicio de esta funcion

setLevel2Aux10:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux11          ; Salta a la funcion auxiliar 11

setLevel2Aux11:
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      exitRoutine             ; Si son iguales salta a la funcion de salida
    mov     bx, flowersb2           ; Mueve el puntero de flores del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la flor actual a ax
    mov     bx, flowersb            ; Mueve el puntero de posiciones de flores
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux11          ; Salta al inicio de esta funcion

generateRandomNumber:               ; Funcion encargada de generar un numero
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion
    mov     ax, 0fh                 ; Mueve un 15 a ax
    and     ax, dx                  ; Hace un and entre el 15 y dl

    ret                             ; Retornar

;  Seccion de dibujo en pantalla

clearScreen:                        ; Funcion encargada de limpiar la pantala
    mov     cx, 00h                 ; Posicion inicial x
    mov     dx, 00h                 ; Posicion inicial y
    jmp     clearScreenAux          ; Salta a la funcion auxliar

clearScreenAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, 00h                 ; Color negro
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    cmp     cx, [width]             ; Compara cx con el ancho la pantalla
    jng     clearScreenAux          ; Si cx no es mayor que el ancho de la pantalla, salta a dibujar en la siguiente columna
    jmp     clearScreenAux2         ; Sino, salta a la funcion auxiliar 2

clearScreenAux2:                  
    mov     cx, 00h                 ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    cmp     dx, [height]            ; Compara dx con la altura de la pantalla
    jng     clearScreenAux          ; Si dx no es mayor que el ancho de la pantalla, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

deleteAlien:                        ; Funcion encargadad de eliminar el alien en pantalla
    mov     al, 00h                 ; Mueve el color negro a al
    mov     [alienc], al            ; Guarda el color negro a alienc
    call    drawAlien               ; Llama a la funcion para dibujar el alien
    mov     al, 02h                 ; Mueve el color verde a al
    mov     [alienc], al            ; Guarda el color verde a alienc
    ret                             ; Retornar

drawAlien:                          ; Funcion encargada de dibujar el alien
    mov     cx, [alienx]            ; Posicion inicial x del alien
    mov     dx, [alieny]            ; Posicion inicial y del alien
    jmp     drawAlienAux            ; Salta a la funcion auxliar

drawAlienAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [alienc]            ; Color verde
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [alienx]            ; Resta el ancho del alien a la columna actual
    cmp     ax, [aliens]            ; Compara resultado de la resta con el ancho
    jng     drawAlienAux            ; Si ax no es mayor que el ancho del alien, salta a dibujar en la siguiente columna
    jmp     drawAlienAux2           ; Sino, salta a la funcion auxiliar 2

drawAlienAux2:                  
    mov     cx, [alienx]            ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [alieny]            ; Resta el alto del alien a la fila actual
    cmp     ax, [aliens]            ; Compara resultado de la resta con la altura
    jng     drawAlienAux            ; Si ax no es mayor que el ancho del alien, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

deleteBullet:                       ; Funcion encargadad de eliminar la bala en pantalla
    mov     al, 00h                 ; Mueve el color negro a al
    mov     [bulletc], al           ; Guarda el color negro a bulletc
    call    drawBullet              ; Llama a la funcion para dibujar la bala
    mov     al, 0ch                 ; Mueve el color rojo claro a al
    mov     [bulletc], al           ; Guarda el color rojo claro a bulletc
    ret                             ; Retornar

drawBullet:                         ; Funcion encargada de dibujar la bala
    mov     ax, 00h                 ; Mueve 0 a ax
    cmp     [bulletb], ax           ; Verifica si deberia haber una bala en pantalla
    je      exitRoutine             ; En caso de que no, sale de la funcion

    mov     cx, [bulletx]           ; Posicion inicial x de la bala
    mov     dx, [bullety]           ; Posicion inicial y de la bala
    jmp     drawBulletAux           ; Salta a la funcion auxliar

drawBulletAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [bulletc]           ; Color rojo claro
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [bulletx]           ; Resta el ancho de la bala a la columna actual
    cmp     ax, [bullets]           ; Compara resultado de la resta con el ancho
    jng     drawBulletAux           ; Si ax no es mayor que el ancho de la bala, salta a dibujar en la siguiente columna
    jmp     drawBulletAux2          ; Sino, salta a la funcion auxiliar 2

drawBulletAux2:                  
    mov     cx, [bulletx]           ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [bullety]           ; Resta el alto de la bala a la fila actual
    cmp     ax, [bullets]           ; Compara resultado de la resta con la altura
    jng     drawBulletAux           ; Si ax no es mayor que el ancho de la bala, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

drawBoss:                           ; Funcion encargada de dibujar al jefe
    mov     cx, [bossx]             ; Posicion inicial x del jefe
    mov     dx, [bossy]             ; Posicion inicial y del jefe
    jmp     drawBossAux             ; Salta a la funcion auxliar

drawBossAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [bossc]             ; Color rojo
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [bossx]             ; Resta el ancho del jefe a la columna actual
    cmp     ax, [bosss]             ; Compara resultado de la resta con el ancho
    jng     drawBossAux             ; Si ax no es mayor que el ancho del jefe, salta a dibujar en la siguiente columna
    jmp     drawBossAux2            ; Sino, salta a la funcion auxiliar 2

drawBossAux2:                  
    mov     cx, [bossx]             ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [bossy]             ; Resta el alto del jefe a la fila actual
    cmp     ax, [bosss]             ; Compara resultado de la resta con la altura
    jng     drawBossAux             ; Si ax no es mayor que el ancho del jefe, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

drawFlowers:                        ; Funcion encargada de dibujar las flores
    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    cmp     cx, [flowersa]          ; Compara el contador con la cantidad de flores
    je      exitFlowers             ; Si son iguales salta a la funcion de salida

    mov     bx, flowersb            ; Mueve el puntero del primer elemento de la lista que indica si una flor esta activa o no
    add     bx, cx                  ; Suma el contador al puntero

    mov     ax, [bx]                ; Obtiene la flor actual
    cmp     ax, 00h                 ; Compara la flor con 0 para ver si tiene que ser dibujada
    je      drawFlowersAux          ; En caso de que no salta a la funcion auxiliar 3
    jmp     drawFlowersAux2         ; Sino, salta a la funcion auxiliar 1

drawFlowersAux:
    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [flowersi], cx          ; Guarda el nuevo contador

    jmp     drawFlowers             ; Salta a la funcion de dibujo principal

drawFlowersAux2:
    mov     ax, [flowersi]          ; Mueve el contador de las flores a ax

    mov     bx, flowersx            ; Mueve el puntero del primer elemento de la lista de las posiciones x de las flores
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion x de la flor actual
    mov     [flowerx], ax           ; La almacena en la variable que contiene la posicion x de la flor actual
    mov     cx, [flowerx]           ; Mueve la posicion inicial x a cx

    mov     ax, [flowersi]          ; Mueve el contador de las flores a ax

    mov     bx, flowersy            ; Mueve el puntero del primer elemento de la lista de las posiciones y de las flores
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion y de la flor actual
    mov     [flowery], ax           ; La almacena en la variable que contiene la posicion y de la flor actual
    mov     dx, [flowery]           ; Mueve la posicion inicial y a dx

    jmp     drawFlowersAux3         ; Salta a la funcion auxliar

drawFlowersAux3:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [flowersc]          ; Color verde
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [flowerx]           ; Resta el ancho de la flor a la columna actual
    cmp     ax, [flowerss]          ; Compara resultado de la resta con el ancho
    jng     drawFlowersAux3         ; Si ax no es mayor que el ancho de la flor, salta a dibujar en la siguiente columna
    jmp     drawFlowersAux4         ; Sino, salta a la funcion auxiliar 2

drawFlowersAux4:                  
    mov     cx, [flowerx]           ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [flowery]           ; Resta el alto de la flor a la fila actual
    cmp     ax, [flowerss]          ; Compara resultado de la resta con la altura
    jng     drawFlowersAux3         ; Si ax no es mayor que el ancho de la flor, salta a dibujar la siguiente fila
    jmp     drawFlowersAux          ; Sino, salta a la funcion auxliar 3

exitFlowers:
    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [flowersi], ax          ; Lo almacena en el contador de las flores

    ret                             ; Retornar

drawWalls:                          ; Funcion encargada de dibujar las paredes
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes del primer nivel
    je      exitWalls               ; Si son iguales salta a la funcion de salida

    mov     bx, wallsb              ; Mueve el puntero del primer elemento de la lista que indica si una pared esta activa o no
    add     bx, cx                  ; Suma el contador al puntero

    mov     ax, [bx]                ; Obtiene la pared actual
    cmp     ax, 00h                 ; Compara la pared con 0 para ver si tiene que ser dibujada
    je      drawWallsAux            ; En caso de que no salta a la funcion auxiliar
    jmp     drawWallsAux2           ; Sino, salta a la funcion auxiliar 2

drawWallsAux:
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [wallsi], cx            ; Guarda el nuevo contador

    jmp     drawWalls               ; Salta a la funcion de dibujo principal

drawWallsAux2:
    cmp     ax, 02h                 ; Compara la pared con 2 para ver de que color es
    je      drawWallsAux3           ; Si tiene toda la vida salta a la funcion auxiliar 3
    jmp     drawWallsAux4           ; Si tiene la mitad de la vida salta a la funcion auxiliar 4

drawWallsAux3:
    mov     ax, [wallsc1]           ; Mueve el color de pared 1 a ax
    mov     [twallsc], ax           ; Almacena ax en el color temporal de pared
    jmp     drawWallsAux5           ; Salta a la funcion auxiliar 5

drawWallsAux4:
    mov     ax, [wallsc2]           ; Mueve el color de pared 2 a ax
    mov     [twallsc], ax           ; Almacena ax en el color temporal de pared
    jmp     drawWallsAux5           ; Salta a la funcion auxiliar 5

drawWallsAux5:
    mov     ax, [wallsi]            ; Mueve el contador de las paredes a ax

    mov     bx, wallsx              ; Mueve el puntero del primer elemento de la lista de las posiciones x de las paredes
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion x de la pared actual
    mov     [wallx], ax             ; La almacena en la variable que contiene la posicion x de la pared actual
    mov     cx, [wallx]             ; Mueve la posicion inicial x a cx

    mov     ax, [wallsi]            ; Mueve el contador de las paredes a ax

    mov     bx, wallsy              ; Mueve el puntero del primer elemento de la lista de las posiciones y de las paredes
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion y de la pared actual
    mov     [wally], ax             ; La almacena en la variable que contiene la posicion y de la pared actual
    mov     dx, [wally]             ; Mueve la posicion inicial y a dx

    jmp     drawWallsAux6           ; Salta a la funcion auxliar 6

drawWallsAux6:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [twallsc]           ; Color de la pared
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [wallx]             ; Resta el ancho de la pared a la columna actual
    cmp     ax, [wallss]            ; Compara resultado de la resta con el ancho
    jng     drawWallsAux6           ; Si ax no es mayor que el ancho de la pared, salta a dibujar en la siguiente columna
    jmp     drawWallsAux7           ; Sino, salta a la funcion auxiliar 2

drawWallsAux7:                  
    mov     cx, [wallx]             ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [wally]             ; Resta el alto de la pared a la fila actual
    cmp     ax, [wallss]            ; Compara resultado de la resta con la altura
    jng     drawWallsAux6           ; Si ax no es mayor que el ancho de la pared, salta a dibujar la siguiente fila
    jmp     drawWallsAux            ; Sino, salta a la funcion auxliar

exitWalls:
    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [wallsi], ax            ; Lo almacena en el contador de las paredes

    ret                             ; Retornar


drawTextEnd:                        ; Funcion encargada de escribir los textos del fin del juego
    mov     bx, [textColor]         ; Mueve a bx el color del texto
    inc     bx                      ; Incrementa bx
    mov     [textColor], bx         ; Almacena el nuevo bx al color del texto

    mov     bx, textEnd0            ; Mueve a bx el puntero del primer texto
    mov     dh, 07h                 ; Mueve a dh un 7
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd1            ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd2            ; Mueve a bx el puntero del tercer texto
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd3            ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dh un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd4            ; Mueve a bx el puntero del quinto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawTextMenu:                       ; Funcion encargada de escribir los textos del menu
    mov     bx, [textColor]         ; Mueve a bx el color del texto
    inc     bx                      ; Incrementa bx
    mov     [textColor], bx         ; Almacena el nuevo bx al color del texto

    mov     bx, textMenu0           ; Mueve a bx el puntero del primer texto
    mov     dh, 07h                 ; Mueve a dh un 7
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu1           ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu2           ; Mueve a bx el puntero del tercer texto
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu3           ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu4           ; Mueve a bx el puntero del quinta texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret

drawTextControls:                   ; Funcion encargada de escribir los textos del juego
    mov     bx, 0fh                 ; Mueve a bx un 15
    mov     [textColor], bx         ; Almacena bx al color del texto

    mov     bx, textControls0       ; Mueve a bx el puntero del primer texto
    mov     dh, 93h                 ; Mueve a dh un 147
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls1       ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls2       ; Mueve a bx el puntero del tercer texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls3       ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls4       ; Mueve a bx el puntero del quinto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto


    mov     bx, textControls5       ; Mueve a bx el puntero del sexto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     ax, [level]             ; Mueve a ax el nivel actual
    cmp     ax, 01h                 ; Compara ax con 1
    je      drawTextLevel1          ; Salta a la funcion para dibujar el texto del primer nivel
    jmp     drawTextLevel2          ; Salta a la funcion para dibujar el texto del segundo nivel


drawTextLevel1:                     ; Funcion encargada de escribir el texto del primer nivel
    mov     bx, textLevel1          ; Mueve a bx el puntero del primer texto
    mov     dh, 03h                 ; Mueve a dh un 3
    mov     dl, 14h                 ; Mueve a dl un 20
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawTextLevel2:                     ; Funcion encargada de escribir el texto del segundo nivel
    mov     bx, textLevel2          ; Mueve a bx el puntero del segundo texto
    mov     dh, 03h                 ; Mueve a dh un 3
    mov     dl, 14h                 ; Mueve a dl un 20
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawBombs:                          ; Funcion encargada de dibujar las bombas
    mov     cx, [bombsi]            ; Mueve el contador de las bombas a cx
    cmp     cx, [bombsa]            ; Compara el contador con la cantidad de bombas
    je      exitBombs               ; Si son iguales salta a la funcion de salida

    mov     bx, bombsb              ; Mueve el puntero del primer elemento de la lista que indica si una bomba esta activa o no
    add     bx, cx                  ; Suma el contador al puntero

    mov     ax, [bx]                ; Obtiene la bomba actual
    cmp     ax, 00h                 ; Compara la bomba con 0 para ver si tiene que ser dibujada
    je      drawBombsAux            ; En caso de que no salta a la funcion auxiliar 3
    jmp     drawBombsAux2           ; Sino, salta a la funcion auxiliar 1

drawBombsAux:
    mov     cx, [bombsi]            ; Mueve el contador de las bombas a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [bombsi], cx            ; Guarda el nuevo contador

    jmp     drawBombs               ; Salta a la funcion de dibujo principal

drawBombsAux2:
    mov     ax, [bombsi]            ; Mueve el contador de las bombas a ax

    mov     bx, bombsx              ; Mueve el puntero del primer elemento de la lista de las posiciones x de las bombas
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion x de la bomba actual
    mov     [bombx], ax             ; La almacena en la variable que contiene la posicion x de la bomba actual
    mov     cx, [bombx]             ; Mueve la posicion inicial x a cx

    mov     ax, [bombsi]            ; Mueve el contador de las bombas a ax

    mov     bx, bombsy              ; Mueve el puntero del primer elemento de la lista de las posiciones y de las bombas
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion y de la bomba actual
    mov     [bomby], ax             ; La almacena en la variable que contiene la posicion y de la bomba actual
    mov     dx, [bomby]             ; Mueve la posicion inicial y a dx

    jmp     drawBombsAux3           ; Salta a la funcion auxliar

drawBombsAux3:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [bombsc]            ; Color gris
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [bombx]             ; Resta el ancho de la bomba a la columna actual
    cmp     ax, [bombss]            ; Compara resultado de la resta con el ancho
    jng     drawBombsAux3           ; Si ax no es mayor que el ancho de la bomba, salta a dibujar en la siguiente columna
    jmp     drawBombsAux4           ; Sino, salta a la funcion auxiliar 2

drawBombsAux4:                  
    mov     cx, [bombx]             ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [bomby]             ; Resta el alto de la bomba a la fila actual
    cmp     ax, [bombss]            ; Compara resultado de la resta con la altura
    jng     drawBombsAux3           ; Si ax no es mayor que el ancho de la bomba, salta a dibujar la siguiente fila
    jmp     drawBombsAux            ; Sino, salta a la funcion auxliar 3

exitBombs:
    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [bombsi], ax            ; Lo almacena en el contador de las bombas

    ret                             ; Retornar

drawText:                           ; Funcion encargada de dibujar texto
    cmp     byte [bx],0             ; Compara el byte que contiene bx con 0
    jz      finishDraw              ; Si es igual a cero, salta a la funcion de salida
    jmp     drawChar                ; Sino salta a dibujar un caracter

drawChar:                           ; Funcion encargada de dibujar un caracter
    push    bx                      ; Hace un push de bx
    mov     ah, 02h                 ; Mueve a ah un 2
    mov     bh, 00h                 ; Mueve a bh un 0
    int     10h                     ; Ejecutar interrupcion
    pop     bx                      ; Hace pop a bx

    push    bx                      ; Hace push a bx
    mov     al, [bx]                ; Mueve el cnotenido de bx a al
    mov     ah, 0ah                 ; Mueve a ah un 10
    mov     bh, 00h                 ; Mueve a bh un 0
    mov     bl, [textColor]         ; Mueve el color de texto a bl
    mov     cx, 01h                 ; Mueve a cx un 1
    int     10h                     ; Ejecutar interrupcion
    pop     bx                      ; Hace pop a bx

    inc     bx                      ; Incrementa bx
    inc     dl                      ; Incrementa dl
    jmp     drawText                ; Salta a la funcion de dibujar texto

finishDraw:                         ; Funcion de salida de texto
    ret                             ; Retornar

; Seccion de lectura del teclado

checkPlayerAction:                  ; Funcion encargada de verificar si el juego esta en pausa
    mov     ax, 00h                 ; Mueve un 0 a ax
    cmp     ax, [gamePause]         ; Verifica si la variable de pausa es 0
    je      makeMovements           ; En caso de que si, el juego no esta en pausa y salta a realizar movimientos
    jmp     checkPlayerPauseAction  ; Sino, el juego esta en pausa y salta a detectar la tecla para quitar la pausa

makeMovements:                      ; Funcion encargada de realizar movimientos en pantalla y deteccion de teclas
    call    moveBullet              ; Llama a la funcion para mover la bala
    call    spawnBomb

    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 48h                 ; Si la tecla presionada es la Flecha Arriba
    je      moveAlienUp             ; Salta a mover el alien hacia arriba
    
    cmp     ah, 50h                 ; Si la tecla presionada es la Flecha Abajo
    je      moveAlienDown           ; Salta a mover el alien hacia abajo

    cmp     ah, 4dh                 ; Si la tecla presionada es la Flecha Derecha
    je      moveAlienRight          ; Salta a mover el alien hacia la derecha

    cmp     ah, 4bh                 ; Si la tecla presionada es la Flecha Izquierda
    je      moveAlienLeft           ; Salta a mover el alien hacia la izquierda

    cmp     ah, 39h                 ; Si la tecla presionada es Espacio
    je      shootBullet             ; Dispara una bala

    cmp     ah, 26h                 ; Si la tecla presionada es l
    je      pauseGame               ; Pausa el juego

    cmp     ah, 6ch                 ; Si la tecla presionada es L
    je      pauseGame               ; Pausa el juego

    cmp     ah, 13h                 ; Si la tecla presionada es r
    je      resetGame               ; Reinicia el juego

    cmp     ah, 72h                 ; Si la tecla presionada es R
    je      resetGame               ; Reinicia el juego

    ret                             ; Sino, Retornar

checkPlayerMenuAction:              ; Funcion encargada de verificar la tecla presionada en el menu
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 39h                 ; Si la tecla presionada es Espacio
    je      startGame               ; Inicia el juego

    ret

checkPlayerEndAction:               ; Funcion encargada de verificar la tecla presionada en el fin del juego
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 39h                 ; Si la tecla presionada es Espacio
    je      startProgram            ; Vuelve a la pantalla de inicio del juego

    ret

checkPlayerPauseAction:             ; Funcion encargada de verificar el fin de la pausa
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 26h                 ; Si la tecla presionada es l
    je      unPauseGame             ; Quita la pausa del juego

    cmp     ah, 6ch                 ; Si la tecla presionada es L
    je      unPauseGame             ; Quita la pausa del juego

    ret                             ; Sino, Retornar

pauseGame:                          ; Funcion encargada de pausar el juego
    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [gamePause], ax         ; Asigna ax a la variable de pausa del juego
    ret                             ; Retornar

unPauseGame:                        ; Funcion encargada de quitar la pausa del juego
    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Asigna ax a la variable de pausa del juego
    ret                             ; Retornar

resetGame:                          ; Funcion encargada de reiniciar el juego
    call    clearScreen             ; Llama a la funcion encargada de eliminar el alien
    call    clearBombs              ; Llama a la funcion para quitar las bombas en pantalla
    call    clearBullet             ; Llama a la funcion para quitar las balas
    call    setLevel1               ; Llama a la funcion encargada de setear los parametros del primer nivel
    jmp     gameLoop                ; Salta a la funcion de juego principal

exitRoutine:                        ; Funcion encargada de retornar
    ret                             ; Retornar

; Seccion de movimiento, logica y colisiones

clearBombs:                         ; Funcion encargada de quitar las bombas en pantalla
    mov     ax, [bombsi]            ; Mueve a ax el contador de bombas
    cmp     ax, [bombsa]            ; Compara el contador de bombas con la cantidad de bombas
    je      clearBombsAux           ; Si son iguales salta a la funcion auxiliar

    mov     bx, bombsb              ; Mueve el puntero del indicador de bombas a bx
    add     bx, ax                  ; Suma el puntero el contador
    mov     cx, 00h                 ; Mueve a ax la bomba actual
    mov     [bx], cx                ; Mueve cx al contenido de bx
    mov     cx, 02h                 ; Mueve un 2 a cx
    add     [bombsi], cx            ; Suma cx al contador de bombas
    jmp     clearBombs              ; Salta al inicio de la funcion

clearBombsAux:
    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [bombsa], ax            ; Limpia la cantidad de bombas
    mov     [bombsi], ax            ; Limpia el contador de bombas
    ret                             ; Retornar

spawnBomb:                          ; Funcion encargada de generar bombas
    mov     ax, [bombsa]            ; Mueve la cantidad de bombas a ax
    cmp     ax, 1eh                 ; Compara la cantidad de bombas con 1e (30, el doble de las bombas actual)
    je      exitRoutine             ; Salta a la funcion de salida
    jmp     spawnBombAux            ; Salta a la funcion auxiliar

spawnBombAux:
    mov     ax, [cyclesSinceLastBomb] ; Mueve a ax la cantidad de ciclos desde que aparecio la ultima bomba
    cmp     ax, 3ch                 ; Compara ax con 60
    je      spawnBombAux2           ; Si ya pasaron 60 ciclos, salta a la funcion auxilar 2
    inc     ax                      ; Incrementa ax
    mov     [cyclesSinceLastBomb], ax ; Almacena la nueva cantidad de ciclos
    ret                             ; Retornar

spawnBombAux2:
    call    generateRandomNumber    ; Llama a la funcion para generar un numero aleatorio
    cmp     ax, 0fh                 ; Compara el numero con 15
    jge     exitRoutine             ; Si es mayor o igual, salta a la funcion de salida
    mov     [random1], ax           ; Si es menor, almacena el numero en el aleatorio 1
    jmp     spawnBombAux3           ; Salta a la funcion auxiliar 3

spawnBombAux3:
    mov     ax, [alieny]            ; Mueve a ax la posicion y del alien
    add     ax, 0ah                 ; Suma 10 a ax
    cmp     ax, 9bh                 ; Compara ax con 155
    jl      spawnBombAux4           ; Si es menor, salta a la funcion auxiliar 4
    sub     ax, 14h                 ; Sino, resta 20
    jmp     spawnBombAux4           ; salta a la funcion auxiliar 4

spawnBombAux4:
    mov     [random2], ax           ; Mueve ax al numero aleatorio 2

    mov     ax, [random1]           ; Mueve el numero aleatorio 1 a ax
    mov     dx, 00h                 ; Mueve 0 a dx
    mov     cx, 0ah                 ; Mueve 10 a cx
    mul     cx                      ; Multiplica ax * cx
    add     ax, 05h                 ; Suma 5 a ax
    mov     [random1], ax           ; Mueve ax al numero aleatorio 1

    jmp     spawnBombAux5           ; Salta a la funcion auxiliar 5

spawnBombAux5:
    mov     cx, [random1]           ; Mueve a cx el numero aleatorio 1
    mov     dx, [random2]           ; Mueve a cx el numero aleatorio 2
    mov     ah, 0dh                 ; Lee pixel
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion

    cmp     al, 00h                 ; Compara el pixel leido con el color negro
    je      spawnBombAux6           ; En caso de que se cumpla, salta a la funcion auxiliar 6

    ret                             ; Sino, retornar

spawnBombAux6:
    mov     ax, 02h                 ; Mueve un 2 a ax
    add     [bombsa], ax            ; Suma ax a la cantidad de bombas

    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [cyclesSinceLastBomb], ax ; Almacena ax en la cantidad de ciclos

    jmp     spawnBombAux7           ; Salta a la funcion auxiliar 7

spawnBombAux7:
    mov     bx, bombsb              ; Mueve el puntero del indicador de bombas a bx
    mov     ax, [bombsi]            ; Mueve a ax el contador de bombas
    add     bx, ax                  ; Suma el puntero el contador
    mov     ax, [bx]                ; Mueve a ax la bomba actual
    cmp     ax, 00h                 ; Compara ax con 0
    je      spawnBombAux8           ; En caso de serlo, salta a la funcion auxiliar 8
    mov     ax, 02h                 ; Mueve un 2 a ax
    add     [bombsi], ax            ; Suma ax al contador
    jmp     spawnBombAux7           ; Salta a la funcion auxiliar 7

spawnBombAux8:
    mov     bx, bombsx              ; Mueve el puntero de las posiciones x de las bombas
    mov     ax, [bombsi]            ; Mueve el contador de bombas a ax

    add     bx, ax                  ; Suma a bx ax
    mov     cx, [random1]           ; Mueve el numero aleatorio 1 a cx
    mov     [bx], cx                ; Mueve al contenido de bx el numero aleatorio 1

    mov     bx, bombsy              ; Mueve el puntero de las posiciones y de las bombas
    
    add     bx, ax                  ; Suma a bx ax
    mov     cx, [random2]           ; Mueve el numero aleatorio 2 a cx
    mov     [bx], cx                ; Mueve al contenido de bx el numero aleatorio 2

    mov     bx, bombsb              ; Mueve el puntero del indicador de bombas a bx
    add     bx, ax                  ; Suma a bx ax
    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [bx], ax                ; Mueve al contenido de bx ax

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [bombsi], ax            ; Reinicia el contador de bombas

    ret                             ; Retornar

shootBullet:                        ; Funcion encargada de activar la bala
    mov     ax, 00h                 ; Mueve 0 a ax
    cmp     [bulletq], ax           ; Verifica si el jugador tiene suficientes balas
    je      exitRoutine             ; En caso de no tener balas sale de la rutina

    mov     ax, 01h                 ; Mueve 1 a ax
    cmp     [bulletb], ax           ; Verifica si ya hay una bala en pantalla
    je      exitRoutine             ; En caso de que si, salta a salir

    mov     [bulletb], ax           ; Guarda el 1 al indicador de bala en pantalla

    sub     [bulletq], ax           ; Resta una bala de la cantidad total de balas del alien

    mov     ax, [alienm]            ; Mueve la ultima direccion del alien a ax
    mov     [bulletd], ax           ; Guarda la ultima direccion del alien a la bala (para que sean iguales)

    mov     ax, [alienx]            ; Mueve la posicion x del alien a ax
    mov     [bulletx], ax           ; Guarda la posicion x del alien a la bala

    mov     ax, [alieny]            ; Mueve la posicion y del alien a ax
    mov     [bullety], ax           ; Guarda la posicion y del alien a la bala

    ret                             ; Retornar

clearBullet:                        ; Funcion encargada de desactivar la bala
    call    deleteBullet            ; Llama a la funcion para eliminar la bala

    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [bulletb], ax           ; Guarda el 0 al indicador de bala en pantalla

    ret                             ; Retornar

moveBullet:                         ; Funcion encargada de mover la bala
    mov     ax, 00h                 ; Mueve 0 a ax
    cmp     [bulletb], ax           ; Verifica si deberia haber una bala en pantalla
    je      exitRoutine             ; En caso de que no, sale de la funcion

    cmp     [bulletd], ax           ; Verifica si la bala se mueve a la derecha
    je      moveBulletRight         ; En caso de que si, mueve la bala a la derecha

    mov     ax, 01h                 ; Mueve 1 a ax
    cmp     [bulletd], ax           ; Verifica si la bala se mueve hacia abajo
    je      moveBulletDown          ; En caso de que si, mueve la bala hacia abajo

    mov     ax, 02h                 ; Mueve 2 a ax
    cmp     [bulletd], ax           ; Verifica si la bala se mueve a la izquierda
    je      moveBulletLeft          ; En caso de que si, mueve la bala a la izquierda

    mov     ax, 03h                 ; Mueve 3 a ax
    cmp     [bulletd], ax           ; Verifica si la bala se mueve hacia arriba
    je      moveBulletUp            ; En caso de que si, mueve la bala hacia arriba

    ret                             ; Retornar

moveBulletUp:                       ; Funcion encargada de mover la bala hacia arriba
    mov     ax, 05h                 ; Mueve 6 a ax
    cmp     [bullety], ax           ; Compara la posicion y de la bala con ax
    je      clearBullet             ; Si son iguales, salta a la funcion de salida

    call    deleteBullet            ; Llama a la funcion encargada de eliminar la bala

    mov     ax, [bulletv]           ; Mueve la velocidad de la bala a ax
    sub     [bullety], ax           ; Resta la velocidad de la bala a la posicion y de esta

    call    checkBulletColision     ; Llama a la funcion para revisar colisiones de la balas

    ret                             ; Retornar

moveBulletDown:                     ; Funcion encargada de mover la bala hacia abajo
    mov     ax, [gameHeight]        ; Mueve el alto del juego a ax
    add     ax, 05h                 ; Suma 6 a ax
    cmp     [bullety], ax           ; Compara la posicion y de la bala con el alto del juego
    je      clearBullet             ; Si son iguales, salta a la funcion de salida

    call    deleteBullet            ; Llama a la funcion encargada de eliminar la bala
    
    mov     ax, [bulletv]           ; Mueve la velocidad de la bala a ax
    add     [bullety], ax           ; Suma la velocidad de la bala a la posicion y de esta

    call    checkBulletColision     ; Llama a la funcion para revisar colisiones de la balas

    ret                             ; Retornar

moveBulletRight:                    ; Funcion encargada de mover la bala hacia la derecha
    mov     ax, [gameWidht]         ; Mueve el ancho del juego a ax
    add     ax, 05h                 ; Suma 6 a ax
    cmp     [bulletx], ax           ; Compara la posicion x de la bala con el ancho del juego
    je      clearBullet             ; Si son iguales, salta a la funcion de salida

    call    deleteBullet            ; Llama a la funcion encargada de eliminar la bala
    
    mov     ax, [bulletv]           ; Mueve la velocidad de la bala a ax
    add     [bulletx], ax           ; Suma la velocidad de la bala a la posicion x de esta

    call    checkBulletColision     ; Llama a la funcion para revisar colisiones de la balas

    ret                             ; Retornar

moveBulletLeft:                     ; Funcion encargada de mover la bala hacia la izquierda
    mov     ax, 05h                 ; Mueve 6 a ax
    cmp     [bulletx], ax           ; Compara la posicion x de la bala con 0
    je      clearBullet             ; Si son iguales, salta a la funcion de salida

    call    deleteBullet            ; Llama a la funcion encargada de eliminar la bala
    
    mov     ax, [bulletv]           ; Mueve la velocidad de la bala a ax
    sub     [bulletx], ax           ; Resta la velocidad de la bala a la posicion x de esta

    call    checkBulletColision     ; Llama a la funcion para revisar colisiones de la balas

    ret                             ; Retornar

checkBulletColision:                ; Funcion encargada de verificar las colisiones del alien
    push    ax                      ; Almacena ax en el stack
    mov     cx, [bulletx]           ; Mueve la posicion x de la bala
    mov     dx, [bullety]           ; Mueve la posicion y de la bala
    mov     ah, 0dh                 ; Lee pixel
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion

    cmp     al, [bossc]             ; Compara el pixel leido con el color del jefe
    je      advanceGame             ; En caso de que se cumpla, salta a la funcion para avanzar de juego
    cmp     al, [wallsc1]           ; Compara el pixel leido con el color 1 de la pared
    je      checkBulletWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes
    cmp     al, [wallsc2]           ; Compara el pixel leido con el color 1 de la pared
    je      checkBulletWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes

    pop     ax                      ; Restaura ax del stack
    ret                             ; Retornar

checkBulletWallColision:            ; Funcion encargada de verificar colisiones de la bala con las paredes
    pop     ax                      ; Restaura ax del stack
    jmp     checkBulletWallColisionAux ; Salta a la funcion auxiliar

checkBulletWallColisionAux:
    mov     bx, wallsx              ; Mueve a bx el puntero de las posiciones x de las paredes
   
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones x
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [bulletx]           ; Compara la posicion x de la pared con la de la bala
    je      checkBulletWallColisionAux2 ; Salta a la funcion auxiliar 3
    jmp     checkBulletWallColisionAux4 ; Salta a la funcion auxiliar 4

checkBulletWallColisionAux2:
    mov     bx, wallsy              ; Mueve a bx el puntero de las posiciones y de las paredes

    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones y
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [bullety]           ; Compara la posicion y de la pared con la bala
    je      checkBulletWallColisionAux3 ; Salta a la funcion auxiliar 3
    jmp     checkBulletWallColisionAux4 ; Salta a la funcion auxiliar 4

checkBulletWallColisionAux3:
    mov     bx, wallsb              ; Mueve a bx el puntero de las indicadores de activacion de las paredes

    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de indicadores
    mov     dx, 01h                 ; Mueve a dx un 0
    sub     [bx], dx                ; Almacena dx en la posicion actual del puntero de indicadores
    
    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [wallsi], ax            ; Almacena dx en la posicion actual del contador de paredes

    call    clearBullet             ; Llama la funcion para limpiar la bala

    ret                             ; Retornar

checkBulletWallColisionAux4:
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [wallsi], cx            ; Mueve cx al contador de paredes

    jmp     checkBulletWallColisionAux ; Salta a la primer funcion

moveAlienUp:                        ; Funcion encargada de mover el alien hacia arriba
    mov     ax, 05h                 ; Mueve 5 a ax
    cmp     [alieny], ax            ; Compara la posicion y del alien con ax
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deleteAlien             ; Llama a la funcion encargada de eliminar el alien

    mov     ax, [alieny]            ; Mueve la posicion y del alien a ax
    sub     ax, [alienv]            ; Resta la velocidad del alien a ax
    mov     [talieny], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkAlienColision      ; Llama a la funcion para detectar colisiones del alien

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitAlienMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [alieny], ax            ; Sino, almacena ax en la posicion y del alien
    
    mov     ax, 03h                 ; Mueve 3 a ax
    mov     [alienm], ax            ; Almacena ax a la ultima direccion del alien

    ret                             ; Retornar

moveAlienDown:                      ; Funcion encargada de mover el alien hacia abajo
    mov     ax, [gameHeight]        ; Mueve el alto del juego a ax
    add     ax, 05h                 ; Suma 5 a ax
    cmp     [alieny], ax            ; Compara la posicion y del alien con el alto del juego
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deleteAlien             ; Llama a la funcion encargada de eliminar el alien

    mov     ax, [alieny]            ; Mueve la posicion y del alien a ax
    add     ax, [alienv]            ; Suma la velocidad del alien a ax
    mov     [talieny], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkAlienColision      ; Llama a la funcion para detectar colisiones del alien

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitAlienMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [alieny], ax            ; Sino, almacena ax en la posicion y del alien

    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [alienm], ax            ; Almacena ax a la ultima direccion del alien

    ret                             ; Retornar

moveAlienRight:                     ; Funcion encargada de mover el alien hacia la derecha
    mov     ax, [gameWidht]         ; Mueve el ancho del juego a ax
    add     ax, 05h                 ; Suma 5 a ax
    cmp     [alienx], ax            ; Compara la posicion x del alien con el ancho del juego
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deleteAlien             ; Llama a la funcion encargada de eliminar el alien

    mov     ax, [alienx]            ; Mueve la posicion x del alien a ax
    add     ax, [alienv]            ; Suma la velocidad del alien a ax
    mov     [talienx], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkAlienColision      ; Llama a la funcion para detectar colisiones del alien

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitAlienMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [alienx], ax            ; Sino, almacena ax en la posicion x del alien

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [alienm], ax            ; Almacena ax a la ultima direccion del alien

    ret                             ; Retornar

moveAlienLeft:                      ; Funcion encargada de mover el alien hacia la izquierda
    mov     ax, 05h                 ; Mueve 5 a ax
    cmp     [alienx], ax            ; Compara la posicion x del alien con ax
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deleteAlien             ; Llama a la funcion encargada de eliminar el alien

    mov     ax, [alienx]            ; Mueve la posicion x del alien a ax
    sub     ax, [alienv]            ; Resta la velocidad del alien a ax
    mov     [talienx], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkAlienColision      ; Llama a la funcion para detectar colisiones del alien

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitAlienMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [alienx], ax            ; Sino, almacena ax en la posicion x del alien

    mov     ax, 02h                 ; Mueve 2 a ax
    mov     [alienm], ax            ; Almacena ax a la ultima direccion del alien

    ret                             ; Retornar

exitAlienMovement:
    mov     ax, [alienx]            ; Mueve la posicion x del alien a ax
    mov     [talienx], ax           ; Almacena ax a la posicion temporal x del alien
    mov     ax, [alieny]            ; Mueve la posicion y del alien a ax
    mov     [talieny], ax           ; Almacena ax a la posicion temporal y del alien

    ret                             ; Retornar

checkAlienColision:                 ; Funcion encargada de verificar las colisiones del alien
    push    ax                      ; Almacena ax en el stack
    mov     cx, [talienx]           ; Mueve la posicion temporal del alien x
    mov     dx, [talieny]           ; Mueve la posicion temporal del alien y
    mov     ah, 0dh                 ; Lee pixel
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion

    cmp     al, [flowersc]          ; Compara el pixel leido con el color de la flor
    je      checkAlienFlowerColision ; En caso de que se cumpla, salta a la funcion de colision de flores
    cmp     al, [wallsc1]           ; Compara el pixel leido con el color 1 de la pared
    je      checkAlienWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes
    cmp     al, [wallsc2]           ; Compara el pixel leido con el color 2 de la pared
    je      checkAlienWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes
    cmp     al, [bossc]             ; Compara el pixel leido con el color del jefe
    je      resetGame               ; En caso de que se cumpla, reinica el juego
    cmp     al, [bombsc]            ; Compara el pixel leido con el color de las bombas
    je      resetGame               ; En caso de que se cumpla, reinica el juego

    pop     ax                      ; Restaura ax del stack
    ret                             ; Retornar

checkAlienFlowerColision:           ; Funcion encargada de verificar colisiones del alien con la flor
    pop     ax                      ; Restaura ax del stack
    jmp     checkAlienFlowerColisionAux ; Salta a la funcion auxiliar

checkAlienFlowerColisionAux:
    mov     bx, flowersx            ; Mueve a bx el puntero de las posiciones x de las flores
   
    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones x
    mov     dx, [bx]                ; Mueve a dx la posicion x de la flor

    cmp     dx, [talienx]           ; Compara la posicion x de la flor con la del alien
    je      checkAlienFlowerColisionAux2 ; Salta a la funcion auxiliar 1
    jmp     checkAlienFlowerColisionAux4 ; Salta a la funcion auxiliar 3

checkAlienFlowerColisionAux2:
    mov     bx, flowersy            ; Mueve a bx el puntero de las posiciones y de las flores

    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones y
    mov     dx, [bx]                ; Mueve a dx la posicion x de la flor

    cmp     dx, [talieny]           ; Compara la posicion y de la flor con la del alien
    je      checkAlienFlowerColisionAux3 ; Salta a la funcion auxiliar 2
    jmp     checkAlienFlowerColisionAux4 ; Salta a la funcion auxiliar 3

checkAlienFlowerColisionAux3:
    mov     bx, flowersb            ; Mueve a bx el puntero de las indicadores de activacion de las flores

    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    add     bx, cx                  ; Suma el contador al puntero de indicadores
    mov     dx, 00h                 ; Mueve a dx un 0
    mov     [bx], dx                ; Almacena dx en la posicion actual del puntero de indicadores
    mov     [flowersi], dx          ; Almacena dx en la posicion actual del contador de flores

    mov     bx, 01h                 ; Mueve a dx un 2
    add     [bulletq], bx           ; Suma dx a la cantidad de balas

    ret                             ; Retornar

checkAlienFlowerColisionAux4:
    mov     cx, [flowersi]          ; Mueve el contador de las flores a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [flowersi], cx          ; Mueve cx al contador de flores

    jmp     checkAlienFlowerColisionAux ; Salta a la primer funcion

checkAlienWallColision:             ; Funcion encargada de verificar colisiones del alien con las paredes
    pop     ax                      ; Restaura ax del stack
    jmp     checkAlienWallColisionAux ; Salta a la funcion auxiliar

checkAlienWallColisionAux:
    mov     bx, wallsx              ; Mueve a bx el puntero de las posiciones x de las paredes
   
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones x
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [talienx]           ; Compara la posicion x de la pared con la del alien
    je      checkAlienWallColisionAux2 ; Salta a la funcion auxiliar 2
    jmp     checkAlienWallColisionAux4 ; Salta a la funcion auxiliar 4

checkAlienWallColisionAux2:
    mov     bx, wallsy              ; Mueve a bx el puntero de las posiciones y de las paredes

    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones y
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [talieny]           ; Compara la posicion y de la pared con la del alien
    je      checkAlienWallColisionAux3 ; Salta a la funcion auxiliar 3
    jmp     checkAlienWallColisionAux4 ; Salta a la funcion auxiliar 4

checkAlienWallColisionAux3:
    mov     ax, 00h                 ; Mueve un 0 a ax

    ret                             ; Retornar

checkAlienWallColisionAux4:
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [wallsi], cx            ; Mueve cx al contador de paredes

    jmp     checkAlienWallColisionAux ; Salta a la primer funcion

times   (512*10)-($-$$) db 0         ; Tamaño del codigo