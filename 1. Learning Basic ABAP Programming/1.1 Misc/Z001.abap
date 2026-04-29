*&---------------------------------------------------------------------*
*& Report Z001
*&---------------------------------------------------------------------*
*& Program Z001 - Types
*&---------------------------------------------------------------------*
REPORT z001.

DATA lv_date TYPE d.
DATA lv_output TYPE c LENGTH 30.
DATA lv_output_time TYPE c LENGTH 50.
DATA lv_time TYPE t.


lv_date = sy-datum.
lv_time = sy-uzeit.
WRITE 'Date and time without format:'.
WRITE / lv_date.
WRITE:  / 'Time: ', lv_time.


"Convert to format
WRITE lv_date TO lv_output DD/MM/YYYY.
WRITE lv_time TO lv_output_time USING EDIT MASK 'The hour is __, __ minutes and __ seconds past'.

WRITE: /'Date with format: ', lv_output.
WRITE: /'Time with format: ', lv_output_time.

DATA lv_chartime TYPE c LENGTH 20.
lv_chartime = sy-uzeit.
WRITE: /'Time in char: ', lv_chartime.

DATA(lv_inline_time) = sy-uzeit.
WRITE: /'Time in inline variable: ', lv_inline_time.

DATA lv_t6 TYPE t.
lv_t6 = sy-uzeit.
WRITE: /'Time in t/(6): ', lv_t6.