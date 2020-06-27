.model small                                      

.data
msg db "Enter a number$"
asc1 db ?
asc2 db ?
bin db ?

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9h
        
        lea dx, msg
        mov ah, 9h
        int 21h 
        
        mov ah, 1
        int 21h  
        
        mov asc1, al
        sub al, 30h
        mov bl, al
        mov ah, 1
        int 21h
        
        mov asc2, al
        sub al, 30h
        mov cl, 04h
        
        rol bl, cl
        or al, bl
        
        mov bin, al
        mov ah, 4ch
        int 21h
        
        main endp
    end