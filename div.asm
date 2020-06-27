.model small

.data
    num1 dw 4445h
    num2 dw 2222h  
    result dw ?
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ax, num1
        mov bx, num2
        
        div bx
        
        mov result, ax
        int 3
        
        main endp
    end
        