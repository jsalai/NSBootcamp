       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRINSPECT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TEXT        PIC X(60)  VALUE SPACES.
       01  WS-UP          PIC X(60)  VALUE SPACES.
       01  WS-HYPH        PIC X(60)  VALUE SPACES.
       01  WS-SCRUB       PIC X(60)  VALUE SPACES.

       01  WS-SPACES      PIC 9(4)   VALUE 0.
       01  WS-VOWELS      PIC 9(4)   VALUE 0.
       01  WS-DIGITS      PIC 9(4)   VALUE 0.
       01  WS-THE-COUNT   PIC 9(4)   VALUE 0.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "Enter a short line of text:" WITH NO ADVANCING
           ACCEPT WS-TEXT

           *> 1) Count spaces, vowels, and digits with INSPECT TALLYING
           MOVE 0 TO WS-SPACES WS-VOWELS WS-DIGITS WS-THE-COUNT
           INSPECT WS-TEXT
               TALLYING
                   WS-SPACES FOR ALL SPACE
                   WS-VOWELS FOR ALL "A"
                   WS-VOWELS FOR ALL "E"
                   WS-VOWELS FOR ALL "I"
                   WS-VOWELS FOR ALL "O"
                   WS-VOWELS FOR ALL "U"
                   WS-VOWELS FOR ALL "a"
                   WS-VOWELS FOR ALL "e"
                   WS-VOWELS FOR ALL "i"
                   WS-VOWELS FOR ALL "o"
                   WS-VOWELS FOR ALL "u"
                   WS-DIGITS FOR ALL "0"
                   WS-DIGITS FOR ALL "1"
                   WS-DIGITS FOR ALL "2"
                   WS-DIGITS FOR ALL "3"
                   WS-DIGITS FOR ALL "4"
                   WS-DIGITS FOR ALL "5"
                   WS-DIGITS FOR ALL "6"
                   WS-DIGITS FOR ALL "7"
                   WS-DIGITS FOR ALL "8"
                   WS-DIGITS FOR ALL "9".

           *> 2)Make an uppercase copy using INSPECT CONVERTING
           MOVE WS-TEXT TO WS-UP
           INSPECT WS-UP
               CONVERTING "abcdefghijklmnopqrstuvwxyz"
                          TO "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

           *> Count "THE" (case-insensitive) by looking in the uppercase copy
           MOVE 0 TO WS-THE-COUNT
           INSPECT WS-UP TALLYING WS-THE-COUNT FOR ALL "THE"

           *> 3) Replace spaces with hyphens; and replace THE with *** on a copy
           MOVE WS-TEXT TO WS-HYPH
           INSPECT WS-HYPH REPLACING ALL SPACE BY "-"

           DISPLAY " "
           DISPLAY "Original:          " WS-TEXT
           DISPLAY "Uppercased:        " WS-UP
           DISPLAY "Spaces->Hyphens:   " WS-HYPH
           DISPLAY " "
           DISPLAY "Space count:       " WS-SPACES
           DISPLAY "Vowel count:       " WS-VOWELS
           DISPLAY "Digit count:       " WS-DIGITS
           DISPLAY "THE count (any case): " WS-THE-COUNT

           STOP RUN.
