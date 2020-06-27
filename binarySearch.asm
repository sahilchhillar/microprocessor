.model small

.data
    arr db 1,2,3,4,5,6,7
    len = ($-arr)/2
    len2 = ($-arr)
    
    msg1 db "element found$"
    msg2 db "element not found$"
    
    ele db 5
    
.code
    main proc
        mov ax, @data
        mov ds, ax 
        
        mov al, ele
        mov si, len
        
        again:
             
            mov bl, arr[si]
            
            cmp al, bl
            je foundAtMid
            
            jl checkLowerArray
            
            jg checkGreaterArray         
            
            jne notFound
            
            
            
        checkGreaterArray:
            inc si
            mov di, len2  
            dec di
            add si, di
            shr si, 1
            
            jmp again
            
            
        
        checkLowerArray:
            dec si
            shr si, 1
            
            jmp again
            
            
            
        foundAtMid:
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