      * Sample COBOL Program
      * Copyright (c) 2026 Mecanik Dev. All rights reserved.
      * See LICENSE file for terms of use.
      *
      * Test: EDITED NUMERIC fields and BLANK WHEN ZERO
      * Exercises: PIC -ZZ,ZZ9.99, PIC $$$,$$9.99, BLANK WHEN ZERO
      * Focus: Does the transpiler format edited fields correctly?
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EDITED-NUM-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-AMOUNT         PIC 9(5)V99  VALUE 12345.67.
       01  WS-SMALL          PIC 9(5)V99  VALUE 42.50.
       01  WS-ZERO           PIC 9(5)V99  VALUE 0.
       01  WS-NEGATIVE       PIC S9(5)V99 VALUE -1234.56.
       01  WS-EDIT1          PIC -ZZ,ZZ9.99.
       01  WS-EDIT2          PIC $$$,$$9.99.
       01  WS-EDIT3          PIC *(5)9.99.
       01  WS-EDIT4          PIC ZZ,ZZ9.99.
       01  WS-BWZ            PIC ZZ,ZZ9.99 BLANK WHEN ZERO.

       PROCEDURE DIVISION.
           DISPLAY "=== EDITED NUMERIC TESTS ===".

           MOVE WS-AMOUNT TO WS-EDIT1.
           DISPLAY "Edit1 (large):  [" WS-EDIT1 "]".

           MOVE WS-SMALL TO WS-EDIT1.
           DISPLAY "Edit1 (small):  [" WS-EDIT1 "]".

           MOVE WS-NEGATIVE TO WS-EDIT1.
           DISPLAY "Edit1 (neg):    [" WS-EDIT1 "]".

           MOVE WS-AMOUNT TO WS-EDIT2.
           DISPLAY "Edit2 (large):  [" WS-EDIT2 "]".

           MOVE WS-SMALL TO WS-EDIT2.
           DISPLAY "Edit2 (small):  [" WS-EDIT2 "]".

           MOVE WS-AMOUNT TO WS-EDIT3.
           DISPLAY "Edit3 (large):  [" WS-EDIT3 "]".

           MOVE WS-SMALL TO WS-EDIT3.
           DISPLAY "Edit3 (small):  [" WS-EDIT3 "]".

           MOVE WS-AMOUNT TO WS-EDIT4.
           DISPLAY "Edit4 (large):  [" WS-EDIT4 "]".

           MOVE WS-SMALL TO WS-EDIT4.
           DISPLAY "Edit4 (small):  [" WS-EDIT4 "]".

           MOVE WS-ZERO TO WS-BWZ.
           DISPLAY "BWZ (zero):     [" WS-BWZ "]".

           MOVE WS-SMALL TO WS-BWZ.
           DISPLAY "BWZ (nonzero):  [" WS-BWZ "]".

           STOP RUN.
