      * Sample COBOL Program
      * Copyright (c) 2026 Mecanik Dev. All rights reserved.
      * See LICENSE file for terms of use.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALL-PATTERN.
      *
      * Test case: MOVE/PERFORM patterns that resemble function calls.
      * MOVE 'ABC' TO WS1, MOVE 3.14 TO WS2, PERFORM DEF
      * where DEF sets WS3 is semantically: ws3 = def('ABC', 3.14)
      *
      * This program has several patterns ranging from
      * clean (easily detectable as calls) to messy.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      * "Parameters" for CALC-INTEREST
      *
       01  WS-PRINCIPAL     PIC S9(7)V99 VALUE 0.
       01  WS-RATE          PIC SV9999 VALUE 0.
       01  WS-YEARS         PIC 9(2) VALUE 0.
       01  WS-INTEREST      PIC S9(7)V99 VALUE 0.

      *
      * "Parameters" for FORMAT-NAME
      *
       01  WS-FIRST-NAME    PIC X(20) VALUE SPACES.
       01  WS-LAST-NAME     PIC X(20) VALUE SPACES.
       01  WS-FULL-NAME     PIC X(42) VALUE SPACES.

      *
      * "Parameters" for VALIDATE-AMOUNT
      *
       01  WS-AMOUNT        PIC S9(7)V99 VALUE 0.
       01  WS-MIN-AMOUNT    PIC S9(7)V99 VALUE 0.
       01  WS-MAX-AMOUNT    PIC S9(7)V99 VALUE 0.
       01  WS-VALID-FLAG    PIC X(1) VALUE "N".
           88 WS-IS-VALID   VALUE "Y".
           88 WS-IS-INVALID VALUE "N".

      *
      * Shared / accumulator
      *
       01  WS-TOTAL-INTEREST PIC S9(9)V99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
      *
      * Pattern A: Clean call-like pattern
      * MOVE inputs, PERFORM, use output
      * The MOVEs to WS-PRINCIPAL, WS-RATE, WS-YEARS "go dead"
      * after the PERFORM. WS-INTEREST is the "return value."
      *
           MOVE 50000.00 TO WS-PRINCIPAL
           MOVE 0.0450 TO WS-RATE
           MOVE 5 TO WS-YEARS
           PERFORM CALC-INTEREST
           DISPLAY "Interest (50K, 4.5%, 5yr): " WS-INTEREST
           ADD WS-INTEREST TO WS-TOTAL-INTEREST

      *
      * Pattern A again with different "arguments"
      *
           MOVE 100000.00 TO WS-PRINCIPAL
           MOVE 0.0325 TO WS-RATE
           MOVE 10 TO WS-YEARS
           PERFORM CALC-INTEREST
           DISPLAY "Interest (100K, 3.25%, 10yr): " WS-INTEREST
           ADD WS-INTEREST TO WS-TOTAL-INTEREST

           DISPLAY "Total interest: " WS-TOTAL-INTEREST

      *
      * Pattern B: String builder call-like pattern
      *
           MOVE "John" TO WS-FIRST-NAME
           MOVE "Smith" TO WS-LAST-NAME
           PERFORM FORMAT-NAME
           DISPLAY "Formatted: " WS-FULL-NAME

      *
      * Pattern C: Validation call-like pattern
      * Returns a boolean via level 88
      *
           MOVE 5000.00 TO WS-AMOUNT
           MOVE 100.00 TO WS-MIN-AMOUNT
           MOVE 10000.00 TO WS-MAX-AMOUNT
           PERFORM VALIDATE-AMOUNT
           IF WS-IS-VALID
               DISPLAY "Amount 5000.00 is valid"
           ELSE
               DISPLAY "Amount 5000.00 is invalid"
           END-IF

           MOVE 50000.00 TO WS-AMOUNT
           PERFORM VALIDATE-AMOUNT
           IF WS-IS-VALID
               DISPLAY "Amount 50000.00 is valid"
           ELSE
               DISPLAY "Amount 50000.00 is invalid"
           END-IF

           STOP RUN.

      *
      * "Function": Calculate simple interest
      * Inputs:  WS-PRINCIPAL, WS-RATE, WS-YEARS
      * Output:  WS-INTEREST
      *
       CALC-INTEREST.
           MULTIPLY WS-PRINCIPAL BY WS-RATE
               GIVING WS-INTEREST ROUNDED
           MULTIPLY WS-INTEREST BY WS-YEARS.

      *
      * "Function": Format full name
      * Inputs:  WS-FIRST-NAME, WS-LAST-NAME
      * Output:  WS-FULL-NAME
      *
       FORMAT-NAME.
           STRING WS-LAST-NAME DELIMITED BY SPACES
                  ", " DELIMITED BY SIZE
                  WS-FIRST-NAME DELIMITED BY SPACES
                  INTO WS-FULL-NAME
           END-STRING.

      *
      * "Function": Validate amount within range
      * Inputs:  WS-AMOUNT, WS-MIN-AMOUNT, WS-MAX-AMOUNT
      * Output:  WS-VALID-FLAG (level 88)
      *
       VALIDATE-AMOUNT.
           SET WS-IS-INVALID TO TRUE
           IF WS-AMOUNT >= WS-MIN-AMOUNT
               AND WS-AMOUNT <= WS-MAX-AMOUNT
               SET WS-IS-VALID TO TRUE
           END-IF.
