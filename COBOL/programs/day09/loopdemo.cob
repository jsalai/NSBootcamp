       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOPDEMO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-N             PIC 99       VALUE 5.
       01  WS-I             PIC 99       VALUE 0.
       01  WS-J             PIC 99       VALUE 0.
       01  WS-SUM           PIC 9(9)     VALUE 0.
       01  WS-FACT          PIC 9(18)    VALUE 1.
       01  WS-PROD          PIC 9(9)     VALUE 0.
       01  WS-ARR-ITEM      PIC 9(4) OCCURS 5 TIMES.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "=== OBOL LOOP PRACTICE ===".
           DISPLAY "Enter a number N (1-9): " WITH NO ADVANCING.
           ACCEPT WS-N.
           IF WS-N < 1 OR WS-N > 9
               DISPLAY "Invalid input. Using N = 5."
               MOVE 5 TO WS-N
           END-IF

           *> 1) PERFORM TIMES
           DISPLAY " ".
           DISPLAY "1) PERFORM TIMES demo (" WS-N " times):".
           PERFORM WS-N TIMES
               DISPLAY "   Hello from TIMES loop."
           END-PERFORM

           *> 2) PERFORM VARYING: sum and factorial
           DISPLAY " ".
           DISPLAY "2) PERFORM VARYING demo (sum and factorial):".
           MOVE 0 TO WS-SUM
           MOVE 1 TO WS-FACT
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-N
               ADD WS-I TO WS-SUM
               COMPUTE WS-FACT = WS-FACT * WS-I
           END-PERFORM
           DISPLAY "   Sum 1..N = " WS-SUM
           DISPLAY "   N!       = " WS-FACT

           *> 3)PERFORM UNTIL: simple counter up to N
           DISPLAY " ".
           DISPLAY "3) PERFORM UNTIL demo (count to N):".
           MOVE 0 TO WS-I
           PERFORM UNTIL WS-I >= WS-N
               ADD 1 TO WS-I
               DISPLAY "   UNTIL loop count = " WS-I
           END-PERFORM

           *> 4) Array with VARYING + nested loops for a small times table
           DISPLAY " ".
           DISPLAY "4) Array loop (squares 1..5) and nested loops (table up to N, capped at 5):".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               COMPUTE WS-ARR-ITEM(WS-I) = WS-I * WS-I
           END-PERFORM
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               DISPLAY "   Square(" WS-I ") = " WS-ARR-ITEM(WS-I)
           END-PERFORM

           IF WS-N > 5
               MOVE 5 TO WS-N
           END-IF
           DISPLAY " ".
           DISPLAY "   Multiplication table 1.." WS-N ":".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-N
               PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > WS-N
                   COMPUTE WS-PROD = WS-I * WS-J
                   DISPLAY "     " WS-I " x " WS-J " = " WS-PROD
               END-PERFORM
           END-PERFORM

           DISPLAY " ".
           DISPLAY "=== Done. ===".
           STOP RUN.
           