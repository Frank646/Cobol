        IDENTIFICATION DIVISION.
        PROGRAM-ID. Payroll.
        AUTHOR.     FRANK.

      *The Function of this program is to take an 
      *input and then provide an output for payroll

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        SELECT EMPLOYEEFILE ASSIGN TO "EMPFILE.DAT"
            FILE STATUS IS FILE-CHECK-KEY
        ORGANIZATION IS LINE SEQUENTIAL.

        SLECT PAYROLL ASSIGN TO "PAYROLLIN.DAT"
            ORGANIZATION IS LINE SEQUENTIAL.


        DATA DIVISION.
        FILE SECTION.
        FD EMPLOYEEFILE.
        01 EMPDETAILS.
            88 ENDOFFILE VALUE HIGH-VALUES.
            02 EMPDATA              PIC X(44).
            02 EMPINFO REDEFINES EMPDATA.
                04 EMPLOYEEID       PIC 9(7).
                04 EMPLOYEENAME.
                    05 FIRSTNAME    PIC X(10).
                    05 LASTNAME     PIC X(10).
                04 STARTDATE.
                    05 START-YEAR   PIC 9(4).
                    05 START-MONTH  PIC 9(2).
                    05 START-DATE   PIC 9(2).
                04 HOURSWORKED      PIC 9(3).
                04 HOURLYRATE       PIC 9(4)V99.
            02 DEPARTMENT           PIC X(30).
            02 GENDER               PIC X.
        
        FD PAYROLL.
        01 EMPPAYROLL.
            04 PAY-EMPLOTEEID       PIC 9(7).
            04 PAY-FIRSTNAME        PIC X(10).
            04 PAY-LASTNAME         PIC X(10).
            04 PAY-PAYAMOUNT        PIC 9(5)V99.
            04 PAY-DEPARTMENT       PIC X(30).
        
        WORKING-STORAGE SECTION.

        01 WS-WORK-AREAS.
            05  FILE-CHECK-KEY      PIC X(2).
            05  WS-EMPLOYEE-COUNT   PIC 9(5).


        PROCEDURE DIVISION.


        0100-READ-EMPLOYEES.

      *opening the input and output files, 
      *checking the file status, and initializing variables.

            OPEN INPUT EMPLOYEEFILE.
            OPEN OUTPUT PAYROLL.
            INITIALISE WS-EMPLOYEE-COUNT.
            IF FILE-CHECK-KEY NOT= "00"
                DISPLAY "Non-zero file status: ",
                    FILE-CHECK-KEY
                GO TO 9000-END-PROGRAM
            END-IF.

            IF FILE-CHECK-KEY NOT = "00"
                DISPLAY "Invalid file status, program terminating"
                STOP RUN
            END-IF

            READ EMPLOYEEFILE.
             AT END SET ENDOFFILE TO TRUE
             END-READ.
            PERFORM 0200-PROCESS-EMPLOYEES UNTIL ENDOFFILE.
            PERFORM 9000-END-PROGRAM.
        0100-END.


        0200-PROCESS-EMPLOYEES.
      * within in this section it moves data as well as calculates pay
            MOVE EMPLOYEEID TO PAY-EMPLOYEEID.
            MOVE LASTNAME TO PAY-LASTNAME.
            MOVE FIRSTNAME TO PAY-FIRSTNAME.
            COMPUTE PAY-PAYAMOUNT = (HOURSWORKED * HOURLYRATE) * 1.03.
            MOVE DEPARTMENT TO PAY-DEPARTMENT.
            WRITE EMPPAYROLL.
            ADD 1 TO WS-EMPLOYEE-COUNT.
            READ EMPLOYEEFILE
                AT END SET ENDOFFILE TO TRUE
            END-READ.


        0200-END.


        9000-END-PROGRAM.
      *Ends program and displays the current count of employees.
            CLOSE EMPLOYEEFILE, PAYROLL.
            DISPLAY "Number of employees processed: ", WS-EMPLOYEE-COUNT.
            STOP RUN.


            END PROGRAM PROCESSPAYROLL.