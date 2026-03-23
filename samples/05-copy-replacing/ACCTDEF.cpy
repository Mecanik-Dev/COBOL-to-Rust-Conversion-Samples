      *
      * ACCTDEF.cpy - Account structure template
      * Used with COPY REPLACING ==:PREFIX:== BY ==instance-name==
      * Each inclusion creates a new "instance" of this structure
      *
       01  :PREFIX:-ACCOUNT.
           05  :PREFIX:-ACCT-ID     PIC X(12).
           05  :PREFIX:-ACCT-NAME   PIC X(30).
           05  :PREFIX:-BALANCE     PIC S9(7)V99 COMP-3.
           05  :PREFIX:-INT-RATE    PIC SV9999 COMP-3.
           05  :PREFIX:-STATUS      PIC X(1).
               88  :PREFIX:-ACTIVE  VALUE "A".
               88  :PREFIX:-CLOSED  VALUE "C".
               88  :PREFIX:-FROZEN  VALUE "F".
