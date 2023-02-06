includelib libcmt.lib
includelib  libucrt.lib
includelib  legacy_stdio_definitions.lib
extrn  printf:proc
extrn  scanf:proc
.data
    cod_sal  DQ 0
    msg1 DB "INDIQUE  EL  VALOR DE VAR1 , VAR2 Y VAR3  SEPARADOS  POR   UNA COMA:",0
    msg2 DB "LA  SUMATORA  ES  %d",0
    var1 DQ 0
    var2 DQ 0
    var3 DQ 0
    suma DQ 0
    fmt DB " %d,  %d,  %d",0
.code
main proc
    ;; Prompt  paar  entrada  del  usuario
    lea rcx ,msg1;; lea destino, fuente        (carga la direccion resultante en el operando de destino.)
    sub rsp ,32 ;;sub resta el operando fuente del destino
    call  printf
    add rsp ,32;; add suma los dos operandos y guarda el resultado en el operando de destino
    ;; Capturamos  el valor  de las  tres  variables
    lea r9 ,var3
    lea r8 ,var2
    lea rdx ,var1
    lea rcx ,fmt
    sub rsp ,32
    call  scanf
    add rsp ,32
    ;; Mandamos  llamar a sumalos
    mov r8 ,var3
    mov rdx ,var2
    mov rcx ,var1
    sub rsp ,32
    call  sumalos
    add rsp ,32
    mov suma ,rax
    ;; Imprimimos  el  resultado  en  pantalla
    mov rdx ,suma
    lea rcx ,msg2
    sub rsp ,32
    call  printf
    add rsp ,32
    ;; Terminamos  la  funcion m ain con  exito
    mov rax ,cod_sal
    ret
main endp
sumalos proc
    mov rax ,rcx
    add rax ,rdx
    add rax ,r8
    ret
sumalos endp
end
;;ml64 /Zi /Zd /Zf  ejem3_12.asm /link /subsystem:console