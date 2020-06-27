.model small

.data
    num1 dw 0005h
    num2 dw 0002h  
    result dw ?
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ax, num1
        mov bx, num2
        
        mul bx
        
        mov result, ax
        
        main endp
    end
        