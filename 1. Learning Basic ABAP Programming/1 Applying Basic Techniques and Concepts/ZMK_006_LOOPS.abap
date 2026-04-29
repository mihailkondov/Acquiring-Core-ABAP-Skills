*&---------------------------------------------------------------------*
*& Report ZMK_006_loops
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_006_loops.

DO 5 TIMES.
  WRITE |sy-index is { sy-index }.|.
ENDDO.


WRITE / 'Counter starts at 12. Manipulating counter...'.

DATA counter type i VALUE '12'.

DO.
    WRITE counter.
    counter = counter / 2 - 1.
  IF counter < 0.
    WRITE / | Condition of counter < 0 met. Exiting loop. Counter is { counter SIGN = LEFT }.|.
    EXIT.
  ENDIF.
ENDDO.