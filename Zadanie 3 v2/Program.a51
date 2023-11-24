MY_KILLING_COPY SEGMENT CODE	; Ulokowanie kodu w najbardziej wygodnym (wg asemblera)
								; miejscu w pamieci kodu.
Bufor DATA 30h
BuforKoniec DATA 3ah			; 30h + 0ah
j Data 7
k Data 10
IleDanych EQU 10

CSEG AT 0
JMP start

RSEG MY_KILLING_COPY
	start:
		MOV R0,#Bufor		; Przeniesienie adresu Cel do Rejestru R0.
		MOV R2,#IleDanych	; Przeniesienie stalej IleDanych do Rejestru R2.
		MOV DPTR,#etykieta	; Zaladowanie adresu pierwszego elementu tablicy danych.
							; Etykieta do wskaznika.
	; Inicjowanie generatora liczb pseudolosowych
	inicjuj:
		CLR A			; Wyczyszczenie Akumulatora.
		MOVC A,@A+DPTR	; Przeniesienie z komorki pamieci programu do akumulatora.
		MOV @R0,A		; Przeniesienie zawartosci Akumulatora
						; do komorki RAM o adresie w Rejestrze R0.
		INC DPTR		; Inkrementacja wskaznika.
		INC R0			; Inkrementacja adresu w Rejestrze R0.
		DJNZ R2,inicjuj	; Dekrementacja R2. Nastepna iteracja petli, jesli mozliwe R2 rozna od 0.
						
	; Przygotuj do generowania
	MOV R0, #Bufor
	MOV A, #Bufor
	ADD A, #k
	SUBB A, #j
	MOV R1, A			; Pozycja drugiego rejestru (i(0) + k - j)
	
	; Generowanie liczb pseudolosowych
	petla:
		MOV A, @R0
		ADD A, @R1
		ANL A, #3 ; Liczba z zakresu 0-3
		MOV @R0, A
		INC R0
		CJNE R0, #BuforKoniec, inc_r1	; W zakresie - pominiecie resetu bufora
		MOV R0, #Bufor
	inc_r1:
		INC R1
		CJNE R1, #BuforKoniec, kontynuuj ; W zakresie - pominiecie resetu bufora
		MOV R1, #Bufor
	kontynuuj:
		SJMP petla

	etykieta: db 4, 5, 3, 3, 3, 4, 6, 2, 6, 5
END
