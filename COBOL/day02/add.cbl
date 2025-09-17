>>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD2NUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  NUM1    PIC 9(4).
           01  NUM2    PIC 9(4).
           01  RESULT  PIC 9(5).
           01  WS-ANSWER   PIC X   VALUE "Y".

       PROCEDURE DIVISION.
MAIN-LOOP.
    PERFORM UNTIL WS-ANSWER NOT = "Y"
        DISPLAY "Enter first number: "
        ACCEPT NUM1
        DISPLAY "Enter second number: "
        ACCEPT NUM2
        COMPUTE RESULT = NUM1 + NUM2
        DISPLAY "The sum is: " RESULT
        
        *> Ask whether to continue
        DISPLAY "Do you want to continue (Y/N)? "
        ACCEPT WS-ANSWER
        MOVE FUNCTION UPPER-CASE(WS-ANSWER) TO WS-ANSWER
        
        *> Re-prompt until user types Y or N
        PERFORM UNTIL WS-ANSWER = "Y" OR WS-ANSWER = "N"
            DISPLAY "Invalid input. Please enter Y or N."
            DISPLAY "Do you want to continue (Y/N)? "
            ACCEPT WS-ANSWER
            MOVE FUNCTION UPPER-CASE(WS-ANSWER) TO WS-ANSWER
        END-PERFORM
    END-PERFORM
    STOP RUN.
           