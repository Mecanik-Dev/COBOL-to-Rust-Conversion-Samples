      * Sample COBOL Program
      * Copyright (c) 2026 Mecanik Dev. All rights reserved.
      * See LICENSE file for terms of use.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIZE-ERROR-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-SMALL         PIC 999        VALUE 0.
       01  WS-LARGE         PIC 9(7)       VALUE 0.
       01  WS-SIGNED        PIC S999       VALUE 0.
       01  WS-VAL-A         PIC 999        VALUE 995.
       01  WS-VAL-B         PIC 999        VALUE 6.
       01  WS-OVERFLOW      PIC 9          VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "=== ON SIZE ERROR TESTS ===".

      *--- Case A: ADD overflows PIC 999 (max 999)
           MOVE 0 TO WS-OVERFLOW.
           ADD WS-VAL-A WS-VAL-B GIVING WS-SMALL
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-ADD.
           DISPLAY "Case A: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case B: ADD fits PIC 9(7)
           MOVE 0 TO WS-OVERFLOW.
           ADD WS-VAL-A WS-VAL-B GIVING WS-LARGE
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-ADD.
           DISPLAY "Case B: WS-LARGE=" WS-LARGE
                   " overflow=" WS-OVERFLOW.

      *--- Case C: MULTIPLY overflows PIC 999
           MOVE 0 TO WS-OVERFLOW.
           MULTIPLY WS-VAL-A BY WS-VAL-B
               GIVING WS-SMALL
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-MULTIPLY.
           DISPLAY "Case C: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case D: SUBTRACT underflows unsigned PIC 999
           MOVE 0 TO WS-OVERFLOW.
           SUBTRACT 10 FROM 5 GIVING WS-SMALL
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-SUBTRACT.
           DISPLAY "Case D: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case E: DIVIDE by zero
           MOVE 0 TO WS-OVERFLOW.
           DIVIDE WS-VAL-A BY 0 GIVING WS-SMALL
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-DIVIDE.
           DISPLAY "Case E: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case F: COMPUTE overflows PIC 999
           MOVE 0 TO WS-OVERFLOW.
           COMPUTE WS-SMALL = WS-VAL-A + WS-VAL-B
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-COMPUTE.
           DISPLAY "Case F: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case G: Negative into unsigned PIC 999
           MOVE 0 TO WS-OVERFLOW.
           COMPUTE WS-SMALL = 5 - 10
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-COMPUTE.
           DISPLAY "Case G: WS-SMALL=" WS-SMALL
                   " overflow=" WS-OVERFLOW.

      *--- Case H: Negative OK for signed PIC S999
           MOVE 0 TO WS-OVERFLOW.
           COMPUTE WS-SIGNED = 5 - 10
               ON SIZE ERROR
                   MOVE 1 TO WS-OVERFLOW
           END-COMPUTE.
           DISPLAY "Case H: WS-SIGNED=" WS-SIGNED
                   " overflow=" WS-OVERFLOW.

           STOP RUN.
