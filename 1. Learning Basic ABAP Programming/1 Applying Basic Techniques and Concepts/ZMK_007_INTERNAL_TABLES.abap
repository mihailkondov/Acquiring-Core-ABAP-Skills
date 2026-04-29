*&---------------------------------------------------------------------*
*& Report ZMK_007_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_007_internal_tables.

DATA a TYPE i.
DATA internal_table_of_integers TYPE TABLE OF i.
DATA b TYPE i VALUE 1.
DATA c TYPE i VALUE 3.

APPEND 1 TO internal_table_of_integers.
APPEND 2 + 1 TO internal_table_of_integers.
APPEND c TO internal_table_of_integers.
APPEND b + c * 2 TO internal_table_of_integers.

CLEAR a.
LOOP AT internal_table_of_integers INTO a.
  WRITE a.
ENDLOOP.

TYPES tty_integers TYPE TABLE OF i.
TYPES tty_integers_same_as_above LIKE internal_table_of_integers.

DATA t_b TYPE tty_integers.
DATA t_c TYPE tty_integers_same_as_above.

LOOP AT internal_table_of_integers INTO a.
  APPEND a TO t_b.
  APPEND a TO t_c.
ENDLOOP.

WRITE / |copied the contents of the first table into the other two. Here are they are:|.

WRITE /.
CLEAR a.
LOOP AT t_b INTO a.
  WRITE a.
ENDLOOP.

WRITE /.
CLEAR a.
LOOP AT t_c INTO a.
  WRITE a.
ENDLOOP.

WRITE / |Clearing internal_table_of_integers. Printing result:|.
CLEAR internal_table_of_integers.
CLEAR a.
LOOP AT internal_table_of_integers INTO a.
  WRITE a.
ENDLOOP.
WRITE / |Nothing to print obviously.|.

WRITE /.

WRITE: / |Inline declaration to loop over table:|,
       / |LOOP AT t_b into data(iterator).|,
       /.
LOOP AT t_b INTO DATA(iterator).
  WRITE iterator.
ENDLOOP.