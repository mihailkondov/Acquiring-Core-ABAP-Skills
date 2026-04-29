*&---------------------------------------------------------------------*
*& Report ZMK_008_fibonacci_numbers
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_008_fibonacci_numbers.

CONSTANTS max_iterations TYPE i VALUE 25.
PARAMETERS pa_count TYPE i.
DATA:
  lv_fi1               TYPE i VALUE 0,
  lv_fi2               TYPE i VALUE 1,
  lt_fibonacci_numbers TYPE TABLE OF i.

IF pa_count > max_iterations.
  MESSAGE 'MAXIMUM ITERATIONS IS 25. PLEASE CHOOSE A LOWER NUMBER.' TYPE 'E' DISPLAY LIKE 'I'.
ENDIF.

* calculate numbers.
APPEND lv_fi1 TO lt_fibonacci_numbers.
APPEND lv_fi2 TO lt_fibonacci_numbers.
DATA lv_newnumber TYPE i.
DO pa_count - 2 TIMES.
  lv_newnumber = lv_fi1 + lv_fi2.
  APPEND lv_newnumber TO lt_fibonacci_numbers.
  lv_fi1 = lv_fi2.
  lv_fi2 = lv_newnumber.
ENDDO.

CASE pa_count.
  WHEN 0.
    WRITE 'No numbers to display.'.
  WHEN 1.
    WRITE lt_fibonacci_numbers[ 1 ].

  WHEN OTHERS.
    LOOP AT lt_fibonacci_numbers INTO DATA(current).
      WRITE current.
    ENDLOOP.
ENDCASE.


**********************************************************************
* A cool solution>
* CASE sy-index.
*      WHEN 1.
*        APPEND 0 TO numbers.
*      WHEN 2.
*        APPEND 1 TO numbers.
*      WHEN OTHERS.
*          APPEND numbers[  sy-index - 2 ]
*               + numbers[  sy-index - 1 ]
*              TO numbers.
*   ENDCASE.