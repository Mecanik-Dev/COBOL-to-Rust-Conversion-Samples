      * Sample COBOL Program
      * Copyright (c) 2026 Mecanik Dev. All rights reserved.
      * See LICENSE file for terms of use.
      *
      * Test: PACKED DECIMAL (COMP-3) arithmetic
      * Exercises: PIC S9(n)V9(n) COMP-3, ROUNDED, GIVING
      * Focus: Does the transpiler preserve exact decimal semantics?
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PACKED-ARITH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-PRICE         PIC S9(5)V99 COMP-3 VALUE +12345.67.
       01  WS-QTY           PIC S9(3) COMP-3 VALUE +150.
       01  WS-DISCOUNT      PIC SV999 COMP-3 VALUE +0.075.
       01  WS-TAX-RATE      PIC SV9999 COMP-3 VALUE +0.1925.
       01  WS-SUBTOTAL      PIC S9(7)V99 COMP-3 VALUE +0.
       01  WS-DISCOUNT-AMT  PIC S9(7)V99 COMP-3 VALUE +0.
       01  WS-TAX-AMT       PIC S9(7)V99 COMP-3 VALUE +0.
       01  WS-TOTAL         PIC S9(7)V99 COMP-3 VALUE +0.
       01  WS-UNIT-PRICE    PIC S9(5)V9999 COMP-3 VALUE +0.

       PROCEDURE DIVISION.
           MULTIPLY WS-PRICE BY WS-QTY
               GIVING WS-SUBTOTAL ROUNDED

           MULTIPLY WS-SUBTOTAL BY WS-DISCOUNT
               GIVING WS-DISCOUNT-AMT ROUNDED

           SUBTRACT WS-DISCOUNT-AMT FROM WS-SUBTOTAL
               GIVING WS-TOTAL

           MULTIPLY WS-TOTAL BY WS-TAX-RATE
               GIVING WS-TAX-AMT ROUNDED

           ADD WS-TAX-AMT TO WS-TOTAL

           DIVIDE WS-TOTAL BY WS-QTY
               GIVING WS-UNIT-PRICE ROUNDED

           DISPLAY "Subtotal:     " WS-SUBTOTAL
           DISPLAY "Discount:     " WS-DISCOUNT-AMT
           DISPLAY "Tax:          " WS-TAX-AMT
           DISPLAY "Total:        " WS-TOTAL
           DISPLAY "Unit price:   " WS-UNIT-PRICE

           STOP RUN.
