MY_KILLING_COPY SEGMENT CODE	; Ulokowanie kodu w najbardziej dogodnym miejscu.
	
Bufor DATA 30h					; Poczatek obszaru na liczby pseudolosowe.
BuforKoniec DATA 3ah			; Koniec obszaru (pierwsza komorka poza zakresem).
j Data 7						; Do wskazania miejsca na druga liczbe.
k Data 10						; Do wskazania miejsca na druga liczbe.
IleDanych EQU 10				; Ilosc liczb poczatkowych i generowanych.

CSEG AT 0
JMP start

RSEG MY_KILLING_COPY
	start:
		MOV R0,#Bufor			; Przeniesienie adresu Cel do R0.
		MOV R2,#IleDanych		; Przeniesienie stalej IleDanych do R2.
		MOV DPTR,#liczby_start	; Tablica (pierwszy element) do wskaznika.
							
	; Inicjowanie generatora liczb pseudolosowych.
	inicjuj:
		CLR A			; Wyczyszczenie Akumulatora.
		MOVC A,@A+DPTR	; Przeniesienie z komorki pamieci programu do akumulatora.
		MOV @R0,A		; Przeniesienie zawartosci Akumulatora do komorki.
		INC DPTR		; Inkrementacja wskaznika.
		INC R0			; Inkrementacja adresu w R0.
		DJNZ R2,inicjuj	; Dekrementacja R2. Nastepna iteracja petli, jesli mozliwe.
						
	; Przygotuj do generowania.
	MOV R0, #Bufor		; Jeden ze skladnikow liczby, nadpisywany.
	MOV A, #Bufor		; Przygotowanie drugiego ze skladnikow liczby.
	ADD A, #k			
	SUBB A, #j			
	MOV R1, A			; Drugi ze skladnikow liczby (i(0) + k - j).
	
	; Generowanie liczb pseudolosowych.
	petla:
		MOV A, @R0							; Pierwszy skladnik liczby.
		ADD A, @R1							; Drugi skladnik liczby.
		ANL A, #3 							; Maska AND - liczba z zakresu 0-3.
		MOV @R0, A							; Zapisanie liczby w IRAM.
		INC R0
		CJNE R0, #BuforKoniec, inc_r1		; Przeskocz, jesli R0 poza obszarem.
		MOV R0, #Bufor						; Zresetuj do poczatku obszaru.
	inc_r1:
		INC R1
		CJNE R1, #BuforKoniec, kontynuuj 	; Przeskocz, jesli R1 poza obszarem.
		MOV R1, #Bufor						; Zresetuj do poczatku obszaru.
	kontynuuj:
		SJMP petla

	liczby_start: db 4, 5, 3, 3, 3, 4, 6, 2, 6, 5	; Poczatkowe liczby
END
