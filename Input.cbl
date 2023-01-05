        IDENTIFICATION DIVISION
        PROGRAM-ID. "INPUT".
        AUTHOR. FRANK
      *Well this is the second project
      *of my learning process for COBOL
        ENVIRONMENT DIVISION.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 NAME PIC A(20).

        PROCEDURE DIVISION.
            0100-START-HERE.
                DISPLAY "Please enter your name:".
                ACCEPT NAME.
                DISPLAY "It is nice to meet you, ", NAME.
        STOP RUN.
        END PROGRAM INPUT.
        