%&%& RDIRZCL_UTILITIES=================CS
ZCL_UTILITIES=================CS           SD$        IS        ZANDARINN   20200729ZANDARINN   20200729000001     001 X 2020072916014720200729160147D$S                 X
%&%& REPOZCL_UTILITIES=================CS
class ZCL_UTILITIES definition
  public
  final
  create public .

public section.

  types:
    t_rke_dat TYPE TABLE OF rke_dat WITH DEFAULT KEY .
  types:
    sodlienti1_t TYPE TABLE OF sodlienti1 WITH DEFAULT KEY .

  class-methods CALL_WIKI .
  class-methods F4IF_INT_TABLE_VALUE_REQUEST
    importing
      value(IV_RETFIELD) type FIELDNAME
      value(IV_DYNPPROG) type SY-REPID default SY-REPID
      value(IV_DYNPNR) type SYST_DYNNR default SY-DYNNR
      value(IV_DYNPROFIELD) type DYNFNAM default SPACE
      value(IV_STEPL) type SYST_STEPL default 0
      value(IV_VALUE_ORG) type DDBOOL_D default 'S'
      value(IT_VALUES_TAB) type STANDARD TABLE
      value(IT_VALUES_MAP) type ICL_DSELC_T optional
    returning
      value(IT_VALUES_RET) type /AIF/DDSHRETVAL_T .
  class-methods F4_FOR_FILE
    importing
      value(IV_INIT_DIR) type STRING default 'C:\USERS\%USERPROFILE%\DESKTOP'
    returning
      value(RV_FILENAME) type LOCALFILE .
  class-methods F4_FOR_SERVER_DIRECTORY
    returning
      value(RV_PATH) type STRING .
  class-methods SO_DLI_READ_API1
    importing
      value(IV_DLI_NAME) type SO_OBJ_NAM
      value(IV_DLI_ID) type SO_OBJ_ID default SPACE
      value(IV_SHARED_DLI) type SO_TEXT001 default ABAP_TRUE
    returning
      value(RT_DLI_ENTRIES) type SODLIENTI1_T .
  class-methods READ_TEXT
    importing
      value(IV_ID) type TDID default 'ST'
      value(IV_LANGUAGE) type SPRAS default 'E'
      value(IV_NAME) type TDOBNAME
      value(IV_OBJECT) type TDOBJECT default 'TEXT'
    returning
      value(RT_LINES) type TLINE_T .
  class-methods GET_SEASON
    importing
      value(IV_MATNR) type MATNR
    returning
      value(RV_SEASON) type CHAR10 .
  class-methods DATE_COMPUTE_DAY
    importing
      value(IV_DATE) type SCDATUM default SY-DATUM
    returning
      value(RV_INDICATOR) type CIND .
  class-methods WDKAL_DATE_ADD_FKDAYS
    importing
      value(IV_DATE) type SYST_DATLO
      value(IV_FKDAY) type FKDAY
      value(IV_FABKL) type WFCID
    returning
      value(RV_DATLO) type SYST_DATLO .
  class-methods RKE_SELECT_FACTDAYS_FOR_PERIOD
    importing
      value(IV_DATAB) type ABDATAB
      value(IV_DATBI) type ABDATBI
      value(IV_FACTID) type WFCID
    returning
      value(ET_ETH_DATS) type T_RKE_DAT .
  class-methods CHECK_EMAIL_FORMAT
    importing
      value(IT_EMAIL) type ZRANGE_T_MAIL
    returning
      value(RT_EMAIL) type ZRANGE_T_MAIL .
  class-methods HRCM_STRING_TO_AMOUNT_CONVERT
    importing
      value(IV_STRING) type STRING
      value(IV_DEC_SEPARATOR) type C optional
      value(IV_THOUSANDS_SEPARATOR) type C optional
      value(IV_WAERS) type WAERS default SPACE
    returning
      value(RV_AMOUNT) type STRING .
  class-methods SSF_FUNCTION_MODULE_NAME
    importing
      value(IV_FORMNAME) type TDSFNAME
    returning
      value(RV_FM_NAME) type RS38L_FNAM .
  class-methods CATS_NUMERIC_INPUT_CHECK
    importing
      value(IV_INPUT) type STRING
    exporting
      value(EV_OUTPUT) type STRING
    returning
      value(RV_CHECK) type FLAG_X .
  class-methods STRING_TO_NUMBER
    importing
      value(IV_INPUT) type STRING
    returning
      value(RV_OUTPUT) type DECIMAL21_7 .
  class-methods UNIT_CONVERSION_SIMPLE
    importing
      value(IV_INPUT) type BGESWERT
      value(IV_NO_TYPE_CHECK) type FLAG_X default ABAP_TRUE
      value(IV_ROUND_SIGN) type CHAR01 default SPACE
      value(IV_UNIT_IN) type MSEHI default SPACE
      value(IV_UNIT_OUT) type MSEHI default SPACE
    returning
      value(RV_OUTPUT) type BGESWERT .
  class-methods CONVERT_DATE_TO_EXTERNAL
    importing
      value(IV_INPUT) type SYST_DATUM default SY-DATUM
      value(IV_SEPARATOR) type CHAR01 default '.'
    returning
      value(RV_OUTPUT) type CHAR10 .
  class-methods CONVERT_DATE_TO_INTERNAL
    importing
      value(IV_INPUT) type CHAR10
    returning
      value(RV_OUTPUT) type SYST_DATUM .
  class-methods G_SET_GET_ID_FROM_NAME
    importing
      value(IV_SHORTNAME) type C
    returning
      value(RV_NEW_SETID) type SETID .
  class-methods G_SET_GET_ALL_VALUES
    importing
      value(IV_SETNR) type C
    returning
      value(RT_SET_VALUES) type ZT_RGSB4 .
  class-methods SET_GET_ALL_VALUES
    importing
      value(IV_SHORTNAME) type C
    returning
      value(RT_SET_VALUES) type ZT_RGSB4 .
  class-methods DR_GET_COUNTRY_NAME
    importing
      value(IV_COUNTRY) type S_COUNTRY
      value(IV_LANGUAGE) type SYST_LANGU default 'E'
    returning
      value(RV_NAME) type LANDX .
  class-methods GET_NAME_FROM_SYUNAME
    importing
      value(IV_UNAME) type SYST_UNAME default SY-UNAME
    exporting
      value(EV_FIRST_NAME) type AD_NAMEFIR
      value(EV_LAST_NAME) type AD_NAMELAS
      value(EV_MAIL) type AD_SMTPADR
    returning
      value(RV_COMPLETE_NAME) type CHAR80 .
  class-methods RH_DYNAMIC_WHERE_BUILD
    importing
      value(IV_TABNAME) type TABNAME
      value(IT_TABCOND) type HRTB_COND
    returning
      value(RT_WHERE_CLAUSE) type FKK_CHAR100_TAB .
  class-methods MESSAGE_TEXT_BUILD
    importing
      value(IV_MSGID) type SYST_MSGID default SY-MSGID
      value(IV_MSGNO) type SYST_MSGNO default SY-MSGNO
      value(IV_MSGV1) type SYST_MSGV default SY-MSGV1
      value(IV_MSGV2) type SYST_MSGV default SY-MSGV2
      value(IV_MSGV3) type SYST_MSGV default SY-MSGV3
      value(IV_MSGV4) type SYST_MSGV default SY-MSGV4
    returning
      value(RV_MESSAGE_TEXT_OUTPUT) type STRING .
  class-methods GET_DYNAMIC_VALUE
    importing
      value(IV_TYPE) type ROLLNAME
      value(IV_VALUE) type STRING
      value(IV_ALPHA_IN) type FLAG_X default ABAP_TRUE
    returning
      value(RV_VALUE) type STRING .
  class-methods QSS0_FLTP_TO_CHAR_CONVERSION
    importing
      value(IV_NUMBER_OF_DIGITS) type QSTELLEN
      value(IV_FLTP_VALUE) type QSOLLWERTE
      value(IV_VALUE_NOT_INITIAL_FLAG) type QNINITIAL default ABAP_TRUE
      value(IV_SCREEN_FIELDLENGTH) type ICONLENGTH default 16
    returning
      value(RV_CHAR_FIELD) type QSOLLWERTC .
  class-methods NUMBER_GET_NEXT
    importing
      value(IV_RANGE_NR) type NRNR default '01'
      value(IV_OBJECT) type NROBJ
      value(IV_QUANTITY) type NRQUAN default '1'
      value(IV_SUBOBJECT) type FLAG_X default SPACE
      value(IV_TOYEAR) type NRYEAR default '0000'
      value(IV_IGNORE_BUFFER) type FLAG_X default SPACE
    exporting
      value(EV_RCODE) type NRRETURN
    returning
      value(RV_NUMBER) type CHAR100 .
  class-methods ABI_TIMESTAMP_CONVERT_INTO
    importing
      value(IV_DATE) type SYSTDATLO default SY-DATUM
      value(IV_TIME) type SYSTTIMLO default SY-UZEIT
    returning
      value(RV_TIMESTAMP) type TZNTSTMPS .
  class-methods REGEX
    importing
      value(IV_REGEX) type PAMA_RX
      value(IV_CHARS) type STRING
    returning
      value(RV_CHECK) type FLAG_X .
  class-methods RESIZE_TABLE_CONTROL
    importing
      value(IV_TABLE) type TABNAME
      value(IV_MAINT_FG) type RS38L_AREA
      value(IV_DYNPRO_NO) type SYST_DYNNR
      value(IV_WIDTH) type I .
  class-methods CONVERSION_EXIT_KONPD_INPUT
    importing
      value(IV_INPUT) type CLIKE
    returning
      value(RV_OUTPUT) type PS_INTNR .
  class-methods CONVERSION_EXIT_KONPD_OUTPUT
    importing
      value(IV_INPUT) type CLIKE
    returning
      value(RV_OUTPUT) type STRING .
  class-methods CONVERSION_EXIT_CUNIT_INPUT
    importing
      value(IV_UOM) type MEINS default 'PC'
      value(IV_LANG) type SYST_LANGU default SY-LANGU
    returning
      value(RV_UOM) type MEINS .
  class-methods CONVERSION_EXIT_CUNIT_OUTPUT
    importing
      value(IV_UOM) type MEINS default 'ST'
      value(IV_LANG) type SYST_LANGU default SY-LANGU
    returning
      value(RV_UOM) type MEINS .
  class-methods CONVERSION_EXIT_TSTRG_INPUT
    importing
      value(IV_INPUT) type STRING
    returning
      value(RV_OUTPUT) type TRAZTD .
  class-methods CONVERSION_EXIT_TSTRG_OUTPUT
    importing
      value(IV_INPUT) type TRAZTD
    returning
      value(RV_OUTPUT) type STRING .
  class-methods CONVERSION_EXIT_SPDEV_INPUT
    importing
      value(IV_INPUT) type RSPOLNAME
    returning
      value(RV_OUTPUT) type RSPOPNAME .
  class-methods CONVERSION_EXIT_SPDEV_OUTPUT
    importing
      value(IV_INPUT) type RSPOPNAME
    returning
      value(RV_OUTPUT) type RSPOLNAME .
  class-methods CONVERSION_EXIT_ATINN_INPUT
    importing
      value(IV_CHARNAME) type STRING
    returning
      value(RV_ATINN) type ATINN .
  class-methods CONVERSION_EXIT_ATINN_OUTPUT
    importing
      value(IV_ATINN) type ATINN
    returning
      value(RV_CHARNAME) type STRING .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_UTILITIES IMPLEMENTATION.


  METHOD abi_timestamp_convert_into.

    CALL FUNCTION 'ABI_TIMESTAMP_CONVERT_INTO'
      EXPORTING
        iv_date          = iv_date
        iv_time          = iv_time
      IMPORTING
        ev_timestamp     = rv_timestamp
      EXCEPTIONS
        conversion_error = 1
        OTHERS           = 2.

  ENDMETHOD.


  METHOD call_wiki.

    cl_gui_frontend_services=>execute(
      EXPORTING
        document = zcl_bc_get_link_wiki=>get_link( sy-tcode )
      EXCEPTIONS
        OTHERS   = 1
    ).

    CHECK sy-subrc <> 0.

    MESSAGE TEXT-w01 TYPE 'S' DISPLAY LIKE 'W'. " (W) Wiki not available.

  ENDMETHOD.


  METHOD cats_numeric_input_check.

    CHECK strlen( iv_input ) > 0.

    FIELD-SYMBOLS: <fs_input>  TYPE any,
                   <fs_output> TYPE any.
    DATA: lr_input  TYPE REF TO data,
          lr_output TYPE REF TO data.

    DATA(lv_length_input)  = strlen( iv_input ).
    DATA(lv_length_output) = lv_length_input + 2.

    CREATE DATA lr_input  TYPE c LENGTH lv_length_input.
    CREATE DATA lr_output TYPE c LENGTH lv_length_output.

    ASSIGN lr_input->*  TO <fs_input>.
    ASSIGN lr_output->* TO <fs_output>.

    <fs_input> = iv_input.

    CALL FUNCTION 'CATS_NUMERIC_INPUT_CHECK'
      EXPORTING
        input      = <fs_input>
      IMPORTING
        output     = <fs_output>
      EXCEPTIONS
        no_numeric = 1
        OTHERS     = 2.

    rv_check = COND #( WHEN sy-subrc <> 0 THEN abap_false ELSE abap_true ).

    ev_output = <fs_output>.

  ENDMETHOD.


  METHOD check_email_format.

    DATA: lt_mail_log TYPE esp1_message_tab_type,
          lv_index    TYPE i.

    DELETE it_email WHERE sign <> 'I' OR option <> 'EQ'.

    LOOP AT it_email INTO DATA(ls_email).
      lv_index = sy-tabix.
      TRY.
          cl_bcs_email_address=>validate( iv_full_email = ls_email-low ).
          APPEND VALUE #( msgid  = 'E4'
                          msgno  = '000'
                          msgty  = 'S'
                          msgv1  = replace( val   = TEXT-s01 " (S) E-Mail & is valid
                                            regex = '&'
                                            with  = ls_email-low
                                          )
                          lineno = lv_index
                        ) TO lt_mail_log.
        CATCH cx_address_bcs.
          APPEND VALUE #( msgid  = 'E4'
                          msgno  = '000'
                          msgty  = 'E'
                          msgv1  = replace( val   = TEXT-e01 " (E) E-Mail & is not valid
                                            regex = '&'
                                            with  = ls_email-low
                                          )
                          lineno = lv_index
                        ) TO lt_mail_log.
          DELETE it_email.
      ENDTRY.
    ENDLOOP.

    rt_email[] = it_email[].

    CHECK line_exists( lt_mail_log[ msgty = 'E' ] ).

    CALL FUNCTION 'C14Z_MESSAGES_SHOW_AS_POPUP'
      TABLES
        i_message_tab = lt_mail_log.

  ENDMETHOD.


  METHOD conversion_exit_atinn_input.

    CALL FUNCTION 'CONVERSION_EXIT_ATINN_INPUT'
      EXPORTING
        input  = iv_charname
      IMPORTING
        output = rv_atinn.

  ENDMETHOD.


  METHOD conversion_exit_atinn_output.

    CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
      EXPORTING
        input  = iv_atinn
      IMPORTING
        output = rv_charname.

  ENDMETHOD.


  METHOD conversion_exit_cunit_input.

    CALL FUNCTION 'CONVERSION_EXIT_CUNIT_INPUT'
      EXPORTING
        input          = iv_uom
        language       = iv_lang
      IMPORTING
        output         = rv_uom
      EXCEPTIONS
        unit_not_found = 1
        OTHERS         = 2.

  ENDMETHOD.


  METHOD conversion_exit_cunit_output.

    CALL FUNCTION 'CONVERSION_EXIT_CUNIT_OUTPUT'
      EXPORTING
        input          = iv_uom
        language       = iv_lang
      IMPORTING
        output         = rv_uom
      EXCEPTIONS
        unit_not_found = 1
        OTHERS         = 2.

  ENDMETHOD.


  METHOD conversion_exit_konpd_input.

    CALL FUNCTION 'CONVERSION_EXIT_KONPD_INPUT'
      EXPORTING
        input     = iv_input
      IMPORTING
        output    = rv_output
*       PROJWA    =
      EXCEPTIONS
        not_found = 1
        OTHERS    = 2.

  ENDMETHOD.


  METHOD conversion_exit_konpd_output.

    CALL FUNCTION 'CONVERSION_EXIT_KONPD_OUTPUT'
      EXPORTING
        input  = iv_input
      IMPORTING
        output = rv_output
*       PSELT  =
      .

  ENDMETHOD.


  METHOD conversion_exit_spdev_input.

    CALL FUNCTION 'CONVERSION_EXIT_SPDEV_INPUT'
      EXPORTING
        input         = iv_input
      IMPORTING
        output        = rv_output
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.

  ENDMETHOD.


  METHOD conversion_exit_spdev_output.

    CALL FUNCTION 'CONVERSION_EXIT_SPDEV_OUTPUT'
      EXPORTING
        input         = iv_input
      IMPORTING
        output        = rv_output
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.

  ENDMETHOD.


  METHOD conversion_exit_tstrg_input.

    CALL FUNCTION 'CONVERSION_EXIT_TSTRG_INPUT'
      EXPORTING
        input          = iv_input
      IMPORTING
        output         = rv_output
      EXCEPTIONS
        invalid_format = 1
        OTHERS         = 2.

  ENDMETHOD.


  METHOD conversion_exit_tstrg_output.

    CALL FUNCTION 'CONVERSION_EXIT_TSTRG_OUTPUT'
      EXPORTING
        input  = iv_input
      IMPORTING
        output = rv_output
      EXCEPTIONS
        OTHERS = 1.

  ENDMETHOD.


  METHOD convert_date_to_external.

    CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
      EXPORTING
        date_internal            = iv_input
      IMPORTING
        date_external            = rv_output
      EXCEPTIONS
        date_internal_is_invalid = 1
        OTHERS                   = 2.

    CHECK sy-subrc = 0 AND iv_separator <> '.'.

    rv_output = replace( val   = rv_output
                         regex = |\\.|
                         with  = iv_separator
                         occ   = 0
                       ).

  ENDMETHOD.


  METHOD convert_date_to_internal.

    DATA(lv_input) = replace( val   = iv_input
                              regex = '[^0-9]'
                              with  = '.'
                              occ   = 0 ).

    CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
      EXPORTING
        date_external            = lv_input
*       ACCEPT_INITIAL_DATE      =
      IMPORTING
        date_internal            = rv_output
      EXCEPTIONS
        date_external_is_invalid = 1
        OTHERS                   = 2.

  ENDMETHOD.


  METHOD date_compute_day.

    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = iv_date
      IMPORTING
        day  = rv_indicator.

  ENDMETHOD.


  METHOD dr_get_country_name.

    CALL FUNCTION 'DR_GET_COUNTRY_NAME'
      EXPORTING
        country  = iv_country
        language = iv_language
      IMPORTING
        name     = rv_name.

  ENDMETHOD.


  METHOD f4if_int_table_value_request.

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
*       DDIC_STRUCTURE  = ' '
        retfield        = iv_retfield
*       PVALKEY         = ' '
        dynpprog        = iv_dynpprog
        dynpnr          = iv_dynpnr
        dynprofield     = iv_dynprofield
        stepl           = iv_stepl
*       WINDOW_TITLE    =
*       VALUE           = ' '
        value_org       = iv_value_org
*       MULTIPLE_CHOICE = ' '
*       DISPLAY         = ' '
*       CALLBACK_PROGRAM       = ' '
*       CALLBACK_FORM   = ' '
*       CALLBACK_METHOD =
*       MARK_TAB        =
*     IMPORTING
*       USER_RESET      =
      TABLES
        value_tab       = it_values_tab[]
*       FIELD_TAB       =
        return_tab      = it_values_ret[]
        dynpfld_mapping = it_values_map[]
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        OTHERS          = 3.

  ENDMETHOD.


  METHOD f4_for_file.

    DATA: lt_file TYPE filetable,
          lv_rc   TYPE i.

    cl_gui_frontend_services=>file_open_dialog(
      EXPORTING
        initial_directory = iv_init_dir
      CHANGING
        file_table        = lt_file
        rc                = lv_rc ).

    rv_filename = VALUE #( lt_file[ 1 ]-filename OPTIONAL ).

  ENDMETHOD.


  METHOD f4_for_server_directory.

    CALL FUNCTION '/SAPDMC/LSM_F4_SERVER_FILE'
      IMPORTING
        serverfile       = rv_path
      EXCEPTIONS
        canceled_by_user = 1
        OTHERS           = 2.

  ENDMETHOD.


  METHOD get_dynamic_value.

    CHECK iv_type IS NOT INITIAL.

    FIELD-SYMBOLS <fs_value> TYPE any.
    DATA lr_value TYPE REF TO data.

    CREATE DATA lr_value TYPE (iv_type).

    ASSIGN lr_value->* TO <fs_value>.

    <fs_value> = iv_value.
    <fs_value> = |{ <fs_value> ALPHA = COND #( WHEN iv_alpha_in IS INITIAL THEN cl_abap_format=>l_out ELSE cl_abap_format=>l_in ) }|.

    rv_value = <fs_value>.

  ENDMETHOD.


  METHOD get_name_from_syuname.

    SELECT SINGLE name_first name_last smtp_addr
    FROM usr21 JOIN adr6 ON usr21~persnumber = adr6~persnumber
               JOIN adrp ON adrp~persnumber  = adr6~persnumber
    INTO ( ev_first_name, ev_last_name, ev_mail )
    WHERE bname = iv_uname.

    rv_complete_name = condense( |{ to_mixed( ev_last_name ) } { to_mixed( ev_first_name ) }| ).

  ENDMETHOD.


  METHOD get_season.

    CHECK iv_matnr IS NOT INITIAL.

    DATA(lv_matnr) = CONV matnr( |{ iv_matnr ALPHA = IN }| ).

    SELECT SINGLE fsh_season, fsh_season_year, fsh_collection
    FROM fsh_seasons_mat
    INTO @DATA(ls_season)
    WHERE matnr   = @lv_matnr  AND
          season1 = @abap_true AND
          season2 = @abap_true AND
          season3 = @abap_true.

    CHECK sy-subrc = 0.

    rv_season = |{ ls_season-fsh_season }{ ls_season-fsh_season_year }{ ls_season-fsh_collection }|.

  ENDMETHOD.


  METHOD g_set_get_all_values.

    CALL FUNCTION 'G_SET_GET_ALL_VALUES'
      EXPORTING
        setnr         = iv_setnr
      TABLES
        set_values    = rt_set_values
      EXCEPTIONS
        set_not_found = 1
        OTHERS        = 2.

  ENDMETHOD.


  METHOD g_set_get_id_from_name.

    CALL FUNCTION 'G_SET_GET_ID_FROM_NAME'
      EXPORTING
        shortname                = iv_shortname
      IMPORTING
        new_setid                = rv_new_setid
*       SET_INFO                 =
*     TABLES
*       T_SETS                   =
      EXCEPTIONS
        no_set_found             = 1
        no_set_picked_from_popup = 2
        wrong_class              = 3
        wrong_subclass           = 4
        table_field_not_found    = 5
        fields_dont_match        = 6
        set_is_empty             = 7
        formula_in_set           = 8
        set_is_dynamic           = 9
        OTHERS                   = 10.

  ENDMETHOD.


  METHOD hrcm_string_to_amount_convert.

    CALL FUNCTION 'HRCM_STRING_TO_AMOUNT_CONVERT'
      EXPORTING
        string              = iv_string
        decimal_separator   = iv_dec_separator
        thousands_separator = iv_thousands_separator
        waers               = iv_waers
      IMPORTING
        betrg               = rv_amount
      EXCEPTIONS
        convert_error       = 1
        OTHERS              = 2.

  ENDMETHOD.


  METHOD message_text_build.

    CALL FUNCTION 'MESSAGE_TEXT_BUILD'
      EXPORTING
        msgid               = iv_msgid
        msgnr               = iv_msgno
        msgv1               = iv_msgv1
        msgv2               = iv_msgv2
        msgv3               = iv_msgv3
        msgv4               = iv_msgv4
      IMPORTING
        message_text_output = rv_message_text_output.

  ENDMETHOD.


  METHOD number_get_next.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = iv_range_nr
        object                  = iv_object
        quantity                = iv_quantity
        subobject               = iv_subobject
        toyear                  = iv_toyear
        ignore_buffer           = iv_ignore_buffer
      IMPORTING
        number                  = rv_number
*       quantity                =
        returncode              = ev_rcode
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.

  ENDMETHOD.


  METHOD qss0_fltp_to_char_conversion.

    CALL FUNCTION 'QSS0_FLTP_TO_CHAR_CONVERSION'
      EXPORTING
        i_number_of_digits       = iv_number_of_digits
        i_fltp_value             = iv_fltp_value
        i_value_not_initial_flag = iv_value_not_initial_flag
        i_screen_fieldlength     = iv_screen_fieldlength
      IMPORTING
        e_char_field             = rv_char_field.

  ENDMETHOD.


  METHOD read_text.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        id                      = iv_id
        language                = iv_language
        name                    = iv_name
        object                  = iv_object
      TABLES
        lines                   = rt_lines
      EXCEPTIONS
        id                      = 1
        language                = 2
        name                    = 3
        not_found               = 4
        object                  = 5
        reference_check         = 6
        wrong_access_to_archive = 7
        OTHERS                  = 8.

  ENDMETHOD.


  METHOD regex.

    rv_check = NEW cl_abap_matcher(
                     regex = NEW cl_abap_regex( pattern = iv_regex )
                     text  = iv_chars
                   )->match( ).

  ENDMETHOD.


  METHOD resize_table_control.

    CHECK iv_width <= 255.

    TYPES: BEGIN OF s_dynpro_descr,
             prog   TYPE progname,
             dynpro TYPE char4,
           END OF s_dynpro_descr.

    DATA: h  TYPE d020s,
          f  TYPE TABLE OF d021s,
          e  TYPE TABLE OF d022s,
          m  TYPE TABLE OF d023s,
          m1 TYPE string,
          l1 TYPE string,
          w1 TYPE string.

    DATA(ls_dynpro_descr) = VALUE s_dynpro_descr(
                                    prog   = |SAPL{ iv_maint_fg }|
                                    dynpro = iv_dynpro_no
                                  ).

    DATA(lv_fnam) = CONV fnam_____4( |TCTRL_{ iv_table }| ).

    IMPORT DYNPRO h f e m ID ls_dynpro_descr.

    CHECK sy-subrc = 0 AND line_exists( f[ fnam = lv_fnam ] ).

    DATA(ls_f) = VALUE d021s( f[ fnam = lv_fnam ] ).

*    CHECK h-noco < iv_width.

    h-noco = iv_width.

*" Convert to hexa
    DATA(lv_crmt_ei_kb_id) = CONV crmt_ei_kb_id( iv_width - 2 ).

    CALL FUNCTION 'CRM_EI_KB_CONV_DEC_TO_HEX'
      EXPORTING
        iv_decimal = lv_crmt_ei_kb_id
      IMPORTING
        ev_hex     = lv_crmt_ei_kb_id.

    CHECK NOT lv_crmt_ei_kb_id+30(2) IS INITIAL.

    ls_f-leng = lv_crmt_ei_kb_id+30(2). " '9B'. " 155 em hexa

    MODIFY f FROM ls_f INDEX sy-tabix TRANSPORTING leng.
    CHECK sy-subrc = 0.

    EXPORT DYNPRO h f e m ID ls_dynpro_descr.

    GENERATE DYNPRO h f e m ID ls_dynpro_descr MESSAGE m1 LINE l1 WORD w1.

  ENDMETHOD.


  METHOD rh_dynamic_where_build.

    CALL FUNCTION 'RH_DYNAMIC_WHERE_BUILD'
      EXPORTING
        dbtable         = iv_tabname
      TABLES
        condtab         = it_tabcond[]
        where_clause    = rt_where_clause[]
      EXCEPTIONS
        empty_condtab   = 1
        no_db_field     = 2
        unknown_db      = 3
        wrong_condition = 4
        OTHERS          = 5.

  ENDMETHOD.


  METHOD rke_select_factdays_for_period.

    CALL FUNCTION 'RKE_SELECT_FACTDAYS_FOR_PERIOD'
      EXPORTING
        i_datab               = iv_datab
        i_datbi               = iv_datbi
        i_factid              = iv_factid
      TABLES
        eth_dats              = et_eth_dats
      EXCEPTIONS
        date_conversion_error = 1
        OTHERS                = 2.

  ENDMETHOD.


  METHOD set_get_all_values.

    rt_set_values[] = g_set_get_all_values( g_set_get_id_from_name( iv_shortname ) ).

  ENDMETHOD.


  METHOD so_dli_read_api1.

    DATA lt_list TYPE TABLE OF sodlienti1.

    CALL FUNCTION 'SO_DLI_READ_API1'
      EXPORTING
        dli_name                   = iv_dli_name
        dli_id                     = iv_dli_id
        shared_dli                 = iv_shared_dli
      TABLES
        dli_entries                = lt_list
      EXCEPTIONS
        dli_not_exist              = 1
        operation_no_authorization = 2
        parameter_error            = 3
        x_error                    = 4
        OTHERS                     = 5.

    rt_dli_entries = VALUE #( FOR ls_list IN lt_list ( CORRESPONDING sodlienti1( ls_list ) ) ).

  ENDMETHOD.


  METHOD ssf_function_module_name.

    CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
      EXPORTING
        formname           = iv_formname
*       VARIANT            = ' '
*       DIRECT_CALL        = ' '
      IMPORTING
        fm_name            = rv_fm_name
      EXCEPTIONS
        no_form            = 1
        no_function_module = 2
        OTHERS             = 3.

  ENDMETHOD.


  METHOD string_to_number.

    TRY.
        cats_numeric_input_check(
          EXPORTING
            iv_input  = iv_input
          IMPORTING
            ev_output = DATA(lv_out)
        ).

        rv_output = CONV decimal21_7( lv_out ).
      CATCH cx_sy_conversion_no_number cx_sy_conversion_overflow.
    ENDTRY.

  ENDMETHOD.


  METHOD unit_conversion_simple.

    CALL FUNCTION 'UNIT_CONVERSION_SIMPLE'
      EXPORTING
        input                = iv_input
        no_type_check        = iv_no_type_check
        round_sign           = iv_round_sign
        unit_in              = iv_unit_in
        unit_out             = iv_unit_out
      IMPORTING
*       ADD_CONST            =
*       DECIMALS             =
*       DENOMINATOR          =
*       NUMERATOR            =
        output               = rv_output
      EXCEPTIONS
        conversion_not_found = 1
        division_by_zero     = 2
        input_invalid        = 3
        output_invalid       = 4
        overflow             = 5
        type_invalid         = 6
        units_missing        = 7
        unit_in_not_found    = 8
        unit_out_not_found   = 9
        OTHERS               = 10.

  ENDMETHOD.


  METHOD wdkal_date_add_fkdays.

    CALL FUNCTION 'WDKAL_DATE_ADD_FKDAYS'
      EXPORTING
        i_date  = iv_date
        i_fkday = iv_fkday
        i_fabkl = iv_fabkl
      IMPORTING
        e_date  = rv_datlo
*       E_FKDAY =
      EXCEPTIONS
        error   = 1
        OTHERS  = 2.

  ENDMETHOD.
ENDCLASS.
%&%& TEXPZCL_UTILITIES=================CS
%&%& HEADZCL_UTILITIES=================CS
                                                                                                                                                               00000                00000000000000                0000000000000000000000  0
%&%& DOKLZCL_UTILITIES=================CS
