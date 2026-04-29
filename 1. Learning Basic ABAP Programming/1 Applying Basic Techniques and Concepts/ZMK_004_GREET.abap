*&---------------------------------------------------------------------*
*& Report ZMK_004
*&---------------------------------------------------------------------*
*& Greet
*&---------------------------------------------------------------------*
REPORT zmk_004.

TYPES ty_1 TYPE c LENGTH 3.
TYPES: BEGIN OF ty_longtype,
         ty_1 LENGTH 3,
         d    TYPE d,
       END OF ty_longtype.


PARAMETERS p_name TYPE ty_1.
PARAMETERS p_date TYPE d.
DATA(lv_char) = 'c'.

DATA lv_longtype_data TYPE ty_longtype.

lv_longtype_data-ty_1 = p_name.
lv_longtype_data-d = p_date.

DATA(outputstring) = |{ lv_longtype_data-d  DATE = USER } { lv_longtype_data-ty_1 }|.

WRITE: outputstring.


IF lv_longtype_data CA 'M'."contains( val =  TO_UPPER( lv_longtype_data-ty_1 ) sub = 'M' ).
  WRITE / 'M detected.'.
ENDIF.