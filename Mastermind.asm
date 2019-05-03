;Ausgabe über Port 2 (Spalte) und Port 3 (Zeile)
CSEG AT 0H
LJMP Init
ORG 100H

Init:
MOV P2,#0f7h
MOV P3,#0c7h
JMP Start

Start:
MOV R7,#00h
CALL IterZellen
JMP Start

IterZellen:
CALL LebendeNachbarn
INC R7
CJNE R7,#040h, IterZellen
ret

LebendeNachbarn:
MOV a,R7
MOV b,#08h
DIV ab
MOV R6,a ; Ergebnis der Division in R6 (y koord)
MOV R5,b ; Rest der Division in R5 (x koord)
DEC R6
DEC R5
CALL LebtNoch
ret

LebtNoch:
MOV a,R6
MOV b,#0ffh
DIV ab
CJNE a, #00h, Abbruch
MOV a,R5
MOV b,#0ffh
DIV ab
CJNE a, #00h , Abbruch

CJNE R6,#00h, Keine0
MOV c, P3.0
CPL c
JNC Abbruch
JMP BerechneX

Keine0:
CJNE R6,#01h, Keine1
MOV c, P3.1
CPL c
JNC Abbruch
JMP BerechneX
Keine1:
CJNE R6,#02h, Keine2
MOV c,P3.2
CPL c
JNC Abbruch
JMP BerechneX
Keine2:
CJNE R6,#03h, Keine3
MOV c,P3.3
CPL c
JNC Abbruch
JMP BerechneX
Keine3:
CJNE R6,#04h, Keine4
MOV c,P3.4
CPL c
JNC Abbruch
JMP BerechneX
Keine4:
CJNE R6,#05h, Keine5
MOV c,P3.5
CPL c
JNC Abbruch
JMP BerechneX
Keine5:
CJNE R6,#06h, Keine6
MOV c,P3.6
CPL c
JNC Abbruch
JMP BerechneX
Keine6:
CJNE R6,#07h, Keine7
MOV c,P3.7
CPL c
JNC Abbruch
JMP BerechneX
Keine7:
JMP Abbruch

Abbruch:
ret

BerechneX:
CJNE R5,#00h, Keine0X
MOV c,P2.0
CPL c
JNC Abbruch
INC R2
ret

Keine0X:
CJNE R5,#01h, Keine1X
MOV c,P2.1
CPL c
JNC Abbruch
INC R2
ret
Keine1X:
CJNE R5,#02h, Keine2X
MOV c,P2.2
CPL c
JNC Abbruch
INC R2
ret
Keine2X:
CJNE R5,#03h, Keine3X
MOV c,P2.3
CPL c
JNC Abbruch
INC R2
ret
Keine3X:
CJNE R5,#04h, Keine4X
MOV c,P2.4
CPL c
JNC Abbruch
INC R2
ret
Keine4X:
CJNE R5,#05h, Keine5X
MOV c,P2.5
CPL c
JNC Abbruch
INC R2
ret
Keine5X:
CJNE R5,#06h, Keine6X
MOV c,P2.6
CPL c
JNC Abbruch
INC R2
ret
Keine6X:
CJNE R5,#07h, Keine7X
MOV c,P2.7
CPL c
JNC Abbruch
INC R2
ret
Keine7X:
JMP Abbruch

Vergleich:
CJNE R4,#00h, Abbruch
CJNE R3,#00h, Abbruch
INC R2
ret
