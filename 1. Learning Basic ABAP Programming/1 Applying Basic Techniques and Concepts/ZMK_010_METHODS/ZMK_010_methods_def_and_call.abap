*&---------------------------------------------------------------------*
*& Report ZMK_010_methods_def_and_call
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_010_methods_def_and_call.

DATA lcl_instance TYPE REF TO zmkcl_010_methods_def_and_call.


lcl_instance =  NEW #( ).
" the # sign is shorthand for using the type from the left hand side.
" Alternatively the expression looks like this:
* lcl_instance = new ZMKCL_009_global( ).

" Another way of creating the object is this:
*CREATE OBJECT lcl_instance.

**********************************************************************
* running the program:

*since this can't be executed in a report
*lcl_instance->if_oo_adt_classrun~main( out = out ).
*I recreated it like this

lcl_instance->main_report(  ).