;Ausgabe über Port 2 (Spalte) und Port 3 (Zeile)
CSEG AT 0H
LJMP Init
ORG 100H

Init:
MOV 020H, #0ffh
MOV 021H, #0f8h
MOV 022H, #0ffh
MOV 023H, #0ffh
MOV 024H, #0ffh
MOV 025H, #0ffh
MOV 026H, #0ffh
MOV 027H, #0ffh

JMP Start

Start:
MOV R7,#00h
CALL IterZellen
JMP Start

IterZellen:
CALL Anzeigen
CALL LebendeNachbarn
INC R7 ; zeilenweiser Zähler
CJNE R7,#040h, IterZellen
ret

Anzeigen:
MOV P3, #0feh
MOV P2, 020H
MOV P2, #0ffh
MOV P3, #0fdh
MOV P2, 021H
MOV P2, #0ffh
MOV P3, #0fbh
MOV P2, 022H
MOV P2, #0ffh
MOV P3, #0f7h
MOV P2, 023H
MOV P2, #0ffh
MOV P3, #0efh
MOV P2, 024H
MOV P2, #0ffh
MOV P3, #0dfh
MOV P2, 025H
MOV P2, #0ffh
MOV P3, #0bfh
MOV P2, 026H
MOV P2, #0ffh
MOV P3, #07fh
MOV P2, 027H
MOV P2, #0ffh

WirSindLebendig:
ret

LebendeNachbarn:
MOV a,R7
MOV b,#08h
DIV ab
MOV R6,a ; Ergebnis der Division in R6 (y koord)
MOV R5,b ; Rest der Division in R5 (x koord)
DEC R6
CALL LadeAktuelleZeile
DEC R5
CALL LebtNoch
INC R5
CALL LebtNoch
INC R5
CALL LebtNoch
INC R6
CALL LadeAktuelleZeile
CALL LebtNoch
INC R6
CALL LadeAktuelleZeile
CALL LebtNoch
DEC R5
CALL LebtNoch
DEC R5
CALL LebtNoch
DEC R6
CALL LadeAktuelleZeile
CALL LebtNoch
CALL RegelnBehandeln
ret

RegelnBehandeln:
MOV a,R2
MOV R1,a ; R1 == Anzahl lebender Nachbarn
MOV R2,#00h
INC R5
CALL LebtNoch ; wenn R2 == 1 dann lebt aktuelle Zelle, sonst tot
CJNE R2,#00h, WirSindLebendig
MOV a,R1 ; wenn wir hier ankommen ist die aktuelle Zelle tot
MOV b,#03h
DIV ab
CJNE a,#01h,keine7WiederBeleben ; macht das gleiche wie Abbruch
MOV a,b
CJNE a,#00h,keine7WiederBeleben ; wenn wir hier springen hat die Zelle mehr oder weniger 				als drei lebende Nachbarn
CALL LadeAktuelleZeile
CJNE R6,#00h,keine0Wiederbeleben
CPL P3.0
CALL SpeicherAktuelleZeile

keine0Wiederbeleben:
CJNE R6,#01h, keine1Wiederbeleben
CPL P3.1
keine1Wiederbeleben:
CJNE R6,#02h, keine2Wiederbeleben
CPL P3.2
keine2Wiederbeleben:
CJNE R6,#03h, keine3Wiederbeleben
CPL P3.3
keine3Wiederbeleben:
CJNE R6,#04h, keine4Wiederbeleben
CPL P3.4
keine4Wiederbeleben:
CJNE R6,#05h, keine5Wiederbeleben
CPL P3.5
keine5Wiederbeleben:
CJNE R6,#06h, keine6Wiederbeleben
CPL P3.6
keine6Wiederbeleben:
CJNE R6,#02h, keine7Wiederbeleben
CPL P3.7
keine7Wiederbeleben:
ret

LadeAktuelleZeile:
CJNE R5, #0h, Keine0AktuelleZeile
MOV P3, 020H

Keine0AktuelleZeile:
CJNE R5, #1h, Keine1AktuelleZeile
MOV P3, 021H
Keine1AktuelleZeile:
CJNE R5, #2h, Keine2AktuelleZeile
MOV P3, 022H
Keine2AktuelleZeile:
CJNE R5, #3h, Keine3AktuelleZeile
MOV P3, 023H
Keine3AktuelleZeile:
CJNE R5, #4h, Keine4AktuelleZeile
MOV P3, 024H
Keine4AktuelleZeile:
CJNE R5, #5h, Keine5AktuelleZeile
MOV P3, 025H
Keine5AktuelleZeile:
CJNE R5, #6h, Keine6AktuelleZeile
MOV P3, 026H
Keine6AktuelleZeile:
CJNE R5, #7h, Keine7AktuelleZeile
MOV P3, 027H
Keine7AktuelleZeile:
RET

SpeicherAktuelleZeile:
CJNE R5, #0h, Keine0aktuellezeile2
MOV 020H, P3

Keine0AktuelleZeile2:
CJNE R5, #1h, Keine1AktuelleZeile2
MOV 021H, P3
Keine1AktuelleZeile2:
CJNE R5, #2h, Keine2AktuelleZeile2
MOV 022H, P3
Keine2AktuelleZeile2:
CJNE R5, #3h, Keine3AktuelleZeile2
MOV 023H, P3
Keine3AktuelleZeile2:
CJNE R5, #4h, Keine4AktuelleZeile2
MOV 024H, P3
Keine4AktuelleZeile2:
CJNE R5, #5h, Keine5AktuelleZeile2
MOV 025H, P3
Keine5AktuelleZeile2:
CJNE R5, #6h, Keine6AktuelleZeile2
MOV 026H, P3
Keine6AktuelleZeile2:
CJNE R5, #7h, Keine7AktuelleZeile2
MOV 027H, P3
Keine7AktuelleZeile2:
RET

LebtNoch:
MOV a,R6
MOV b,#0ffh ; durch ff teilen weil R6=FF wenn negativ
DIV ab
CJNE a, #00h, Abbruch
MOV a,R5
MOV b,#0ffh ; durch ff teilen weil R5=FF wenn negativ
DIV ab
CJNE a, #00h , Abbruch

CJNE R6,#00h, Keine0
MOV c, P3.0
CPL c
JNC Abbruch
INC R2

Keine0:
CJNE R6,#01h, Keine1
MOV c, P3.1
CPL c
JNC Abbruch
INC R2
Keine1:
CJNE R6,#02h, Keine2
MOV c,P3.2
CPL c
JNC Abbruch
INC R2
Keine2:
CJNE R6,#03h, Keine3
MOV c,P3.3
CPL c
JNC Abbruch
INC R2
Keine3:
CJNE R6,#04h, Keine4
MOV c,P3.4
CPL c
JNC Abbruch
INC R2
Keine4:
CJNE R6,#05h, Keine5
MOV c,P3.5
CPL c
JNC Abbruch
INC R2
Keine5:
CJNE R6,#06h, Keine6
MOV c,P3.6
CPL c
JNC Abbruch
INC R2
Keine6:
CJNE R6,#07h, Keine7
MOV c,P3.7
CPL c
JNC Abbruch
INC R2
Keine7:
JMP Abbruch

Abbruch:
ret

Vergleich:
CJNE R4,#00h, Abbruch
CJNE R3,#00h, Abbruch
INC R2
ret
