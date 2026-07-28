*&---------------------------------------------------------------------*
*& Report ZMK_011_using_encapsulation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_011_using_encapsulation.

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i READ-ONLY.


    CLASS-METHODS class_constructor.


    METHODS constructor
      IMPORTING
        iv_carrier_id    TYPE s_carr_id
        iv_connection_id TYPE s_conn_id
      RAISING
        cx_abap_invalid_value.

    METHODS get_attributes
      EXPORTING
        ev_connection_id TYPE s_conn_id
        ev_carrier_id    TYPE s_carr_id.

    METHODS set_attributes
      IMPORTING
                iv_connection_id TYPE s_conn_id OPTIONAL
                iv_carrier_id    TYPE s_carr_id OPTIONAL
      RAISING   cx_abap_invalid_value.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id TYPE s_carr_id.
    DATA connection_id TYPE s_conn_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.
    conn_counter = 5.
  ENDMETHOD.


  METHOD constructor.
    me->carrier_id = iv_carrier_id.
    me->connection_id = iv_connection_id.
    conn_counter = conn_counter + 1.
  ENDMETHOD.


  METHOD get_attributes.
    ev_carrier_id = carrier_id.
    ev_connection_id = connection_id.
  ENDMETHOD.


  METHOD set_attributes.
    IF iv_carrier_id IS INITIAL OR iv_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
    me->carrier_id = iv_carrier_id.
    me->connection_id = iv_connection_id.
  ENDMETHOD.


ENDCLASS.

PARAMETERS iv_carr TYPE s_carrid.
PARAMETERS iv_con TYPE s_conn_id.



START-OF-SELECTION.

  DATA connection TYPE REF TO lcl_connection.

  TRY.
      connection = NEW #(   iv_carrier_id = iv_carr iv_connection_id = iv_con ).

      connection->get_attributes( IMPORTING
                                      ev_carrier_id = DATA(lv_carrid)
                                      ev_connection_id = DATA(lv_connid) ).

      WRITE |Success! Carrier ID: { lv_carrid }; Connection ID: { lv_connid }|.
    CATCH cx_abap_invalid_value.
      WRITE 'invalid value'.
  ENDTRY.