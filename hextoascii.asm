.model small

.data
    x db ?

.code

    main proc
        mov ax, @data
        mov ds, ax
        mov ax, 5ah
        cmp al, 0ah
        jb fwd
        add al, 07h
        
        fwd: 
        add al, 30h
        mov x, al
        
        main endp
    end