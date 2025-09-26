       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLEMATH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-N         PIC 99     VALUE 5.
       01  WS-I         PIC 99     VALUE 0.
       01  WS-SQUARE    PIC 9(5)   VALUE 0.
       01  WS-TRI       PIC 9(5)   VALUE 0.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "Enter a small integer N (1-99): " WITH NO ADVANCING
           ACCEPT WS-N

           *>Guard against zero/negative input
           IF WS-N < 1
              MOVE 1 TO WS-N
           END-IF

           *> Simple math (no loop): square
           COMPUTE WS-SQUARE = WS-N * WS-N

           *> Simple math function with a LOOP:
           *> T(N) = sum of 1..N
           MOVE 0 TO WS-TRI
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-N
              ADD WS-I TO WS-TRI
           END-PERFORM

           DISPLAY "N        = " WS-N
           DISPLAY "N^2      = " WS-SQUARE
           DISPLAY "T(N)     = " WS-TRI
           STOP RUN.
