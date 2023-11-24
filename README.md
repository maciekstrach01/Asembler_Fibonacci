
# Asembler

Celem zadania jest napisanie programu do generowania liczb pseudolosowych oparty o opóźniony ciąg Fibonacciego. Program wykorzystuje bufor cykliczny do przechowywania wygenerowanych liczb pseudolosowych wykorzystywanych do generowania następnych.

## Description

Program
![Obraz45](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/71bf8749-c805-489a-afd8-74cbc71a2b5a)
![Obraz46](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/8a51de6e-26dd-4d0f-b178-906cd9428910)

1.Załadowanie z pamięci programu do pamięci IRAM 10 startowych liczb.
![Obraz47](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/b58f7716-fefc-4318-afcf-9b6b6b686af8)

2.Załadowanie do rejestrów adresów pamięci danych wykorzystywanych do generowania liczby pseudolosowej.
o	R0: 30h + ((0 + 10h) % 10h) = 30h
o	R1: 30h + ((0 – 7h + 10h) % 10h) = 33h


![Obraz48](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/c13880e5-65ad-417c-9e51-6ff8e523d5d7)

3.Dodanie liczb wskazanych przez R0 i R1.

![Obraz49](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/7294c782-7b28-4125-a92e-6ea13b5e00a2)

4.Uzyskanie liczby z przedziału 0-3. Operacja bitowa AND zawartości akumulatora i liczby 3. Zapisanie uzyskanej liczby do komórki wskazanej w R0.

![Obraz50](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/7abe5851-3975-4718-9ae2-906a17e3d7e2)

5.Inkrementacja R0 i R1. Zresetowanie pozycji do początku buforu, jeśli adres wyjdzie poza zakres buforu. W tym przypadku to nie następuje. Skok do początku pętli. Program działa dalej analogicznie.

![Obraz51](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/096015e5-f4ab-47e0-8329-ea564e85604f)

6.Dalsze działanie programu. Zresetowanie pozycji R1 do początku buforu.


![Obraz52](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/69252f63-5f36-4b1c-b9dc-7dba1ba91e97)

![Obraz53](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/d692198b-2b72-4424-9f7a-7b245084f767)

7.Dalsze działanie programu. Zresetowanie pozycji R0 do początku buforu.

![Obraz54](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/820c45f6-a399-4df1-9aa5-cc9d9340c94d)

![Obraz55](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/6656883c-7596-414f-b4ec-f9bcc3cceb02)

8.Stan cyklicznego bufora po pierwszym przebiegu.

![Obraz56](https://github.com/maciekstrach01/Asembler_addition_subtraction/assets/146733279/ad270711-8fad-4314-a702-7ce3c1a43026)

Podsumowanie działania programu

•	Program generuje liczby pseudolosowe w oparciu o opóźniony ciąg Fibonacciego dla pary (j,k) = (7, 10).

•	Program generuje liczby pseudolosowe dodając dwie wskazane wartości oraz wykonując na sumie i liczbie 3 operację bitową AND. Działa to na zasadzie maski.

•	Program korzysta z cyklicznego buforu w pamięci IRAM do przechowywania najpierw startowych liczb, a następnie wygenerowanych liczb z zakresu od 0 do 3.

•	Bufor przechowuje 10 liczb.

•	Źródła informacji o działaniu generatora liczb pseudolosowych w oparciu o opóźniony ciąg Fibonacciego:

o	https://pl.wikipedia.org/wiki/Generator_Fibonacciego

o	http://www.algorytm.org/liczby-pseudolosowe/generator-lfg-opozniony-generator-fibonacciego.html














## 🛠 Skills
Asembler


## Running Tests

    Uruchom środowisko μVision.

    Z menu "Project" utwórz nowy projekt.

    Wybierz procesor (np. Atmel AT89C51RD2 dla zestawu ZL2MCS51).

    Ustaw częstotliwość rezonatora kwarcowego na 11,0592MHz.

    Zaznacz opcję "Create HEX file" na karcie "Output" w oknie "Options for Target".

    Dodaj plik z kodem źródłowym do projektu.

    Skompiluj projekt za pomocą polecenia "Build" (skrót klawiaturowy F7).

    Z menu "Debug" uruchom sesję debugowania za pomocą opcji "Start/Stop debug session".

    Monitoruj stan mikrokontrolera, rejestrów, pamięci programu, i IRAM za pomocą okien "Registers Window" i "Memory Windows".

    W trybie debugowania, naciśnij F11 lub użyj opcji "Step" do przejścia do następnej instrukcji.

    W oknie "Memory" wpisz adres, aby przeglądać i modyfikować zawartość pamięci programu.


