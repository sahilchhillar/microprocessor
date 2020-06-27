.model small

.data
    arr db 9,8,7,7,7,6,5,4,3,2,1,1,1
    len = ($-arr)
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov si, -1
        
        loop1: 
            inc si   
            mov di, si
            cmp si, len
            je resetsi
            jne loop2 
            
        loop2: 
            mov bl, arr[si]
            inc di
            
            cmp di, len             
            je loop1
            jne compare
            
        compare:
            mov al, arr[di]
            cmp bl, al
            jle loop2
            jg swap
            
        swap: 
            mov dl, al
            mov al, bl
            mov bl, dl
            
            mov arr[si], bl
            mov arr[di], al   
            jmp loop2 
            
        resetsi:
            mov si, 0
            jmp printarray
            
        printarray:
            mov dl, arr[si]
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