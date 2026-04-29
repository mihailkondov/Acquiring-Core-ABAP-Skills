*&---------------------------------------------------------------------*
*& Report Z003_STRUCTURES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z003_STRUCTURES.

TYPES: BEGIN OF ty_wizard,
    name TYPE zmk_firstname,
    surname TYPE zmk_lastname,
    birthdate type /IWBEP/GWS_DATE_OF_BIRTH,
  END OF ty_wizard.

DATA ls_ginny_weasley TYPE ty_wizard.
  ls_ginny_weasley-name = 'GINNY'.
  ls_ginny_weasley-surname = 'WEASLEY'.
  ls_ginny_weasley-birthdate = '19810811'.

  WRITE 'Creating a new student '.

DATA ls_new_student TYPE ty_wizard.
  ls_new_student-name = 'GINNY'.

WRITE: / 'Name: ', ls_new_student-name,
  / 'Surname: ', ls_new_student-surname,
  / 'Birthdate: ', ls_new_student-birthdate.

WRITE / 'Loading data...'.



" Copying a structure in a single instruction

MOVE-CORRESPONDING ls_ginny_weasley TO ls_new_student.

WRITE: / 'Name: ', ls_new_student-name,
  / 'Surname: ', ls_new_student-surname,
  / 'Birthdate: ', ls_new_student-birthdate.