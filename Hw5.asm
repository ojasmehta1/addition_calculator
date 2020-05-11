begin:  lodd on:
        stod 4095		
        call xbsywt: 	
        
	loco str1: 	; load str1
	call getNext:	
	call input:		; Take user input
    lodd binnum:	
	stod computedNum:	; Store user input in computedNum
	loco str1:	; Ask for second number
	
	call getNext:
	call input:		; Get second number
	lodd binnum:	; load it
	addd computedNum:		; compute
	stod computedNum:		
	
	stod ans:		; Store answer
	jneg end:		; negative = overflow
	call xbsywt:	 
	loco str2:		
	
	call getNext:	
	call xbsywt:	   
	call bitz:		; Convert results
	call xbsywt:		; Wait
	lodd zero:		; Load zero

	halt			; Stop

end:	loco str3:		; Load endflow string
	call getNext:		; Transmit to screen
	lodd cneg1:		; put -1 into AC
	halt 			; halt
		
getNext:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer crnl:
        stod 4094
        push
        subd c255:
        jneg crnl:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump getNext:

crnl:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
	retn

input:	lodd on:
	stod 4093
	call rbsywt:
	lodd 4092
	subd numoff:
	push

nxtdig:	call rbsywt:
	lodd 4092
	stod nxtchr:
	subd nl:
        jzer endnum:
	mult 10
	lodd nxtchr:
	subd numoff:
	addl 0
	stol 0
	jump nxtdig:
endnum: pop
	stod binnum:
        lodd 4092
        loco 0
	retn
xbsywt: lodd 4095
        subd mask:
        jneg xbsywt:
        retn
rbsywt: lodd 4093
        subd mask:
        jneg rbsywt:
        retn
sb:     loco 8
loop1:  jzer finish:
        subd c1:
        stod lpcnt:
        lodl 1
        jneg add1:
        addl 1
        stol 1
        lodd lpcnt:
        jump loop1:
add1:   addl 1
        addd c1:
        stol 1
        lodd lpcnt:
        jump loop1:

finish: lodl 1			
        retn

bitz:	lodd on:
		stod 4095
		lodd cneg1:
		push 		
		lodd mask:	
		push     

compute:	lodd ans:		; Load answer
			jzer print:		
			lodd mask:
			push			; push mask on stack
			lodd ans:		; push answer
			push
			div			; divide answer
			pop
			stod ans:		; push second value
			pop
			insp 2			; clear up stack
			addd numoff:		; convert to char
			push 		
			jump compute:		; keeping looping

print:	pop			; load result
		jneg done:		; end condition
		stod 4094
		call xbsywt:
		jump print:		; print result

done: retn 			; Return


numoff: 48
nxtchr: 0
binnum: 0
lpcnt:  0
mask:   10
on:     8
nl:     10
cr:     13
c1:     1
c255:   255
cneg1:	-1 			; constant -1
pstr1:  0
str1:   "PLEASE ENTER AN INTEGER BETWEEN 1 AND 32767208"
str2:   "THE SUM OF THESE INTEGERS IS: "
str3:   "THE SUM HAS CAUSED AN OVERFLOW"
computedNum:	0			; stores the first number
ans:	0			; stores the computedNum
zero:	0
