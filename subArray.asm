.model small 

.data         
    arr1 db 1,2,3 
    len=($-arr1)
    arr2 db 1,2,3 
    len2=($-arr2)
    sum db ?  
    
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov al, len
    mov bl, len2  
    
    cmp al, bl
    jne endproc 
    
    mov si, 0
    label:    
        cmp si, len
        je resetsi
        
        mov al, arr1[si]
        mov bl, arr2[si] 
        
        not bl
        inc bl
        
        add al, bl
        
        mov sum[si], al
        inc si
        jmp label
        
    resetsi:
        mov si, 0
        jmp printarray
            
    printarray:
        mov dl, sum[si]
        add dx, 30h
        mov ah, 2h
        int 21h
            
        inc si  
        cmp si, len
        je endproc
        jne printarray
    endproc:
    main endp
end
    