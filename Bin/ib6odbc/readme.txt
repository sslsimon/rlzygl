
ARCHIVE: IB6ODBC.ZIP
**********************
contains: 
 ib6xtg10.dll  - XTG Systems InterBase6 ODBC Driver for Win32
 install.exe   - installation utility  
 uninstall.exe - uninstallation utility
 readme.txt    - this file (installation instructions, misc. information)

Installation instructions
***************************
 * extract files from archive
 * run install.exe

Uninstall instructions
************************
 * run uninstall.exe 
   note: this will not remove the data sources using this driver
         you may have set up - it removes the driver only. If you want to remove
         the data sources too, remove them through ODBC driver manager BEFORE you 
         uninstall this driver.

What is it?
*************
This is InterBase6 ODBC driver. It aims to conform to the ODBC 3 API CORE level
at this time.

Supported platforms
*********************
 * Win32 (windows 9x/NT; the driver is tested in windows 95/98, windows NT4 SP3 and win2000)

What is new
*************
 * SQL_C_NUMERIC type is supported
 * double-to-decimal conversions are fixed
 * meta-function fixes (case-sensitivness and wild cards are handled in a better way)
 * supported data types retrieval fixes (when requested 'all' supported data types,
   only every second has been returned)
 * various small fixes

Release notes (version 1.0.0 beta 15)
**************************************
This version should be considered beta. It may contain some bugs but it should
be usable.



Data type conversions
***********************
Data type conversions for both inbound and outbound buffers should work. Please note
that string-to-date conversion supports several most commonly used formats by now only.
Number to date conversions assume the number is C type time_t and vice versa 
(date to number conversions will convert the date to time_t number). Please consider
possible problems with time_t which is not year 2038 safe. Note when you request data
as SQL_C_BINARY, the driver handles them the same way as SQL_C_CHAR.


Supported string date formats
********************************
   {ts 'YYYY-MM-DD hh:mm:ss'} {t 'hh:mm:ss'}      {d 'YYYY-MM-DD'}
   hh:mm:ss DD.MM.YYYY        hh:mm:ss DD.MM.YY   hh:mm:ss YYYY-MM-DD   hh:mm:ss MM/DD/YYYY
   hh:mm DD.MM.YYYY           hh:mm DD.MM.YY      hh:mm YYYY-MM-DD      hh:mm MM/DD/YYYY
   DD.MM.YYYY hh:mm:ss        DD.MM.YY hh:mm:ss   YYYY-MM-DD hh:mm:ss   MM/DD/YYYY hh:mm:ss
   DD.MM.YYYY hh:mm           DD.MM.YY hh:mm      YYYY-MM-DD hh:mm      MM/DD/YYYY hh:mm
   DD.MM.YYYY                 DD.MM.YY            YYYY-MM-DD            MM/DD/YYYY
   hh:mm                      hh:mm:ss


BLOBs
*******
BLOBs are supported in 1.0.0 beta 2 and later. From 1.0.0 beta 3 there is full support
for BLOB manipulation (read and write through SQLBindCol, SQLBindParam, SQLGetData and
SQLPutData according to ODBC specifications). Please don't rely on SQLSTATEs after
SQLGetData, they are not set up properly by now (but return value and length indicator
should work fine). Please note there are no auto conversions for BLOB data (they can only
be read/written through SQL_C_CHAR or SQL_C_BINARY buffers).

SQLGetData extensions
***********************
The majority of SQLGetData extensions is supported:
 - SQL_GD_ANY_COLUMN (SQLGetData can be called for any unbound column,
   including those before the last bound column)
 - SQL_GD_ANY_ORDER (SQLGetData can be called for unbound columns in any order)
 - SQL_GD_BOUND (SQLGetData can be called for bound columns as well as unbound columns)

Isolation levels
******************
Isolation level defaults to SQL_TXN_READ_COMMITTED.
ODBC isolation levels are interpreted by driver in this way:
 SQL_TXN_READ_UNCOMMITTED and SQL_TXN_READ_COMMITTED
   isc_tpb_read_committed + isc_tpb_rec_version
 SQL_TXN_REPEATABLE_READ
   isc_tpb_concurrency
 SQL_TXN_SERIALIZABLE
   isc_tpb_consistency


Authors
*********
This software has been written and it is copyrighted by Roman Vanicek at XTG Systems, s.r.o.
You can find more inforamtion on http://ofbodbc.sourceforge.net and at
http://www.xtgsystems.com.


More information
******************
Firebird wevsite at http://firebird.sourceforge.net
InterBase website at http://www.interbase.com
XTG Systems website at http://www.xtgsystems.com
Open Firebird ODBC driver website http://ofbodbc.sourceforge.net


Thanks
********
Our greatest thanks go to many people around the globe who try to use this driver
and help us to find (and fix) the bugs.

License
*********
This release is free software licensed under terms and conditions of GNU LGPL
(Lesser Genral Public License). For details see COPYING.txt.
This software comes with no warranty of any kind and you use it at you own risk.


Change log
************
 * 1.0.0 beta 1 - first public release, basic functions are working
 * 1.0.0 beta 2 - fixed SQLTables to return long table names (containing spaces)
		- added BLOB support (both read and write) with some limitations
		   (see 1.0 beta2 readme.txt)
 * 1.0.0 beta 3 - full BLOB support finished, implemented SQLParamData and SQLPutData,
                   added graphical install/uninstall utility
 * 1.0.0 beta 4 - string-to-date auto conversions, date-to-string conversions fix,
		SQLDriverConnect fixes and enhancements, freshly implemented: SQLColAttributes,
                SQLNumParanms, SQLNativeSql, SQLColumns, SQLExtendedFetch (FETCH_NEXT only),
                installer now checks InterBase client library, and some more (see release notes).
 * 1.0.0 beta 5 - SQLDriverConnect fixed to support dialog asking for connection attributes,
                SQLDescribeCol and SQLColAttributes fixed to provide correct information
                on meta-queries result set columns
 * 1.0.0 beta 6 - implemented SQLSetCursorName, SQLGetCursorName functions; updated
                SQLGetStmtOption, SQLSetStmtOption, SQLGetConnectOption, 
                SQLSetConnectOption, SQLGetInfo functions, isolation level setting,
                commit retains execution context and cursor state; some cursor
                related errors have been fixed
 * 1.0.0 beta 7 - fixed support for int64,decimal,numeric; fixed SQLExtendedFetch;
                  rollback retains execution context; more SQLGetInfo parameters supported
 * 1.0.0 beta 8 - misc fixes; SQLTables rewritten; license changes to LGPL
 * 1.0.0 beta 9 - SQLTables and SQLColumns fixes; SQLPrimaryKeys added; misc fixes to work 
                  with StarOffice
 * 1.0.0 beta 10 - skipped
 * 1.0.0 beta 11 - core and interface upgrade to ODBC 3, bug-fixes
 * 1.0.0 beta 12 - many fixes, debugging with MS Access; query pre-processor (curly braced
                  syntax for outer-joins and date/times); SQLStatistics now returns correct
                  but empty result-set; SQLRowCount, SQLSpecialColumns implemented.
 * 1.0.0 beta 13 - skipped
 * 1.0.0 beta 14 - SQLSet/Get...Attrs reimplemented for ODBC 3; CHARSET and ROLE supported
                   as connection parameters
 * 1.0.0 beta 15 - SQL_C_NUMERIC support; double-to-decimal fixed; meta-function fixes (case
                   sensitivity, wild-cards handling); supported data types retrieval fixes

We hope you will find it useful,
XTG Systems team
