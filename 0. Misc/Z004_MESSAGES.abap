*&---------------------------------------------------------------------*
*& Report Z004_MESSAGES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z004_messages.
data lv_msgelement type c LENGTH 25.
lv_msgelement = 'Greeting text'(001).

WRITE lv_msgelement.

PARAMETERS:
p_1 type ABAP_bool RADIOBUTTON GROUP a,
p_2 type ABAP_bool RADIOBUTTON GROUP a.

IF p_1 = abap_true.
  MESSAGE 'This is an info message (from the source code)'(002) TYPE 'I'.
ELSEIF p_2 = abap_true.
  MESSAGE 'This is a warning message (from the source code)' TYPE 'W'.
ENDIF.

"Message from a class:
MESSAGE i888(sabapdemos) WITH 'End of program' 'second message'.