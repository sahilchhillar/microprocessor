.model small

.data
    arr db 1,2,3,4
    len = ($-arr)
    
    msg1 db "element found$"
    msg2 db "element not found$"
    
    ele db 5
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov al, ele
         
        mov si, 0
        
        again:
        cmp si, len
        je notFound
             
        mov bl, arr[si]
        cmp al, bl
        je found
        
        inc si
        jmp again
        
        ;print value of ele
        found:
        mov ah, 9
        lea dx, msg1
        int 21h
        jmp endproc
        
        notFound:
        mov ah, 9
        lea dx, msg2
        int 21h
        jmp endproc
        
        
        endproc:
        main endp
    end