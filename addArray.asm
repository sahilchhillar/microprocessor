.model small 

.data         
    arr1 db 1,2,3 
    len=($-arr1)
    arr2 db 0,0,0 
    len2=($-arr2)
    sum db ?  
    
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    cmp len, len2
    jne endproc 
    
    mov si, 0
    label:    
        cmp si, len
        je endproc
        
        mov al, arr1[si]
        mov bl, arr2[si]
        
        add al, bl
        
        mov sum[si], al
        inc si
        jmp label
        
    endproc:
    main endp
end
    