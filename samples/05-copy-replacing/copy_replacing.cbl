      * Sample COBOL Program
      * Copyright (c) 2026 Mecanik Dev. All rights reserved.
      * See LICENSE file for terms of use.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COPY-STRUCT.
      *
      * Test case: COPY REPLACING as structure instantiation
      * The copybook ACCTDEF.cpy defines a template structure with
      * :PREFIX: pseudo-text tokens.  Each COPY REPLACING creates
      * a separate "instance" of the same structure.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      * Template copybook included three times with different
      * prefixes, creating three instances of the same structure
      *
       COPY ACCTDEF REPLACING ==:PREFIX:== BY ==SAVINGS==.
       COPY ACCTDEF REPLACING ==:PREFIX:== BY ==CHECKING==.
       COPY ACCTDEF REPLACING ==:PREFIX:== BY ==CREDIT==.

       01  WS-TRANSFER-AMT   PIC S9(7)V99 VALUE 0.

       PROCEDURE DIVISION.
      *
      * Initialize the "savings" instance
      *
           MOVE "SAV-001-2026" TO SAVINGS-ACCT-ID
           MOVE "Smith, John" TO SAVINGS-ACCT-NAME
           MOVE 50000.00 TO SAVINGS-BALANCE
           MOVE 0.0325 TO SAVINGS-INT-RATE
           SET SAVINGS-ACTIVE TO TRUE

      *
      * Initialize the "checking" instance
      *
           MOVE "CHK-001-2026" TO CHECKING-ACCT-ID
           MOVE "Smith, John" TO CHECKING-ACCT-NAME
           MOVE 12500.00 TO CHECKING-BALANCE
           MOVE 0.0010 TO CHECKING-INT-RATE
           SET CHECKING-ACTIVE TO TRUE

      *
      * Initialize the "credit" instance
      *
           MOVE "CRD-001-2026" TO CREDIT-ACCT-ID
           MOVE "Smith, John" TO CREDIT-ACCT-NAME
           MOVE -3200.00 TO CREDIT-BALANCE
           MOVE 0.1999 TO CREDIT-INT-RATE
           SET CREDIT-ACTIVE TO TRUE

      *
      * Transfer between "instances"
      *
           MOVE 1000.00 TO WS-TRANSFER-AMT
           SUBTRACT WS-TRANSFER-AMT FROM SAVINGS-BALANCE
           ADD WS-TRANSFER-AMT TO CHECKING-BALANCE

           DISPLAY "After transfer of " WS-TRANSFER-AMT
           DISPLAY "Savings:  " SAVINGS-BALANCE
           DISPLAY "Checking: " CHECKING-BALANCE
           DISPLAY "Credit:   " CREDIT-BALANCE

           STOP RUN.
