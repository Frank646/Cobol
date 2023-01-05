        IDENTIFICATION DIVISION
         PROGRAM-ID. "BMICALC".
         AUTHOR. FRANK
      *Well this is the third project
      *of my learning process for COBOL
      *Reads the input data to workout the BMI of user
        ENVIRONMENT DIVISION.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 HEIGHT PIC 999.
        01 WEIGHT PIC 999.
        01 BMI PIC 999v99.
      *implied cobol decimal 999v99  
        PROCEDURE DIVISION.
            0100-START-HERE.
                DISPLAY "Please enter your height in inches".
                ACCEPT HEIGHT.

                DISPLAY "Please enter your weight in pounds"
                ACCEPT WEIGHT.

                COMPUTE BMI = WEIGHT * 703 / (HEIGHT * HEIGHT)

                DISPLAY "Your BMI is ", BMI.

        STOP RUN.
        END PROGRAM BMICALC.


