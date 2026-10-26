; -------------------------------------------------------------
; Programa: Hola Mundo en x86-64 (Linux)
;
; Comandos de compilación y ejecución:
;   1. Ensamblar:  nasm -f elf64 hola.asm -o hola.o
;   2. Enlazar:    ld hola.o -o hola
;   3. Ejecutar:   ./hola
; -------------------------------------------------------------

section .data
    msg db "Hola, Mundo!", 0xA      ; Cadena con salto de línea (0xA = \n)
    len equ $ - msg                 ; Calcula la longitud exacta de la cadena

section .text
    global _start

_start:
    ; syscall: sys_write (rax = 1)
    mov rax, 1          ; Número de syscall para write
    mov rdi, 1          ; File descriptor: 1 = stdout
    mov rsi, msg        ; Puntero al mensaje
    mov rdx, len        ; Longitud del mensaje
    syscall             ; Llamada al kernel

    ; syscall: sys_exit (rax = 60)
    mov rax, 60         ; Número de syscall para exit
    xor rdi, rdi        ; Código de salida 0
    syscall             ; Llamada al kernel