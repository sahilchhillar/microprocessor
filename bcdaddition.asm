.model small

.data
    n1 dw 2234h,2234h
    n2 dw 1234h,1179h
    target dw 3 dup(0)
        
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ax,n1+2
        mov bx,n2+2
        add al,bl
        daa
        mov cl,al
        
        adc ah,bh
        mov al,ah
        daa
        mov ch,al
        
        mov target+4,cx     
        
        mov ax,n1
        mov bx,n2
        add al,bl
        daa
        mov cl,al
        
        adc ah,bh
        mov al,ah
        daa
        mov ch,al
        
        mov target+2,cx
        
        main endp
    
    end