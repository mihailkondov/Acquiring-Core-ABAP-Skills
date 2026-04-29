*&---------------------------------------------------------------------*
*& Report Z002_CALCULATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z002_CALCULATOR.

PARAMETERS: p_num1 type i, p_num2 TYPE i.

PARAMETERS :
  p_plus TYPE abap_bool RADIOBUTTON GROUP r1,
  p_minus TYPE abap_bool RADIOBUTTON GROUP r1,
  p_multip TYPE abap_bool RADIOBUTTON GROUP r1,
  p_divide TYPE abap_bool RADIOBUTTON GROUP r1.

DATA ev_result TYPE p LENGTH 10 DECIMALS 2.
IF p_plus = abap_true .
  ev_result = p_num1 + p_num2.
ELSEIF p_minus = abap_true.
  ev_result = p_num1 - p_num2.
ELSEIF p_multip = abap_true.
  ev_result = p_num1 * p_num2.
ELSEIF p_divide = abap_true.
  ev_result = p_num1 / p_num2.
ENDIF.

WRITE ev_result.