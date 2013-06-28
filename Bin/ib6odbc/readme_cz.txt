
ARCHIV: IB6ODBC.ZIP
**********************
obsahuje: 
 ib6xtg10.dll  - XTG Systems InterBase6 ODBC Driver for Win32
 install.exe   - instalacni program
 uninstall.exe - deinstalacni program
 readme_cz.txt - tento soubor (instalacni instrukce, ruzne uzitecne informace)

Instalacni instrukce
***************************
 * rozbalte archiv (ib6odbc.zip)
 * spustte install.exe

Instrukce pro deinstalaci
***************************
 * spustte deinstall.exe
   poznamka: deinstalacni program nesmaze datove zdroje pouzivane timto ovladacem
             ktere byly nakonfigurovany v ODBC driver manageru. Pokud chcete smazat
             tyto datove zdroje, ucinte tak rucne pomoci ODBC driver manageru jeste
             PRED odinstalovanim tohoto ovladace.
Co to je?
*************
Tento software je ODBC ovladac pro InterBase6. V soucasne dobe je nasim cilem
vytvorit ovladac, ktery bude vyhovovat specifikaci ODBC 3 uroven CORE.

Podporovane platformy
***********************
 * Win32 (windows 9x/NT; ovladac je testovan na windows 95/98, windows NT4 SP3 a windows 2000)

Novinky v teto verzi
**********************
 * podpora pro SQL_C_NUMERIC
 * opravy prevodu double na decimal
 * opravy meta funkci (citlivost na velikost pismen a zastupne znaky)
 * oprava informaci o podporovanych datovych typech (kdyz byly pozadovany 'vsechny'
   datove typy, vratil ovladac informace jen o kazdem druhem)
 * ruzne male opravy

Poznamky k aktualni release (verze 1.0.0 beta 15)
**************************************************
Tato verze by mela byt povazovana za beta verzi.
Muze jeste obsahovat nektere chyby, ale uz by mela byt pouzitelna v mene narocnych
aplikacich.


Konverze datovych typu
************************
Konverze datovych typu funguji pro vsechny datove typy pro vstupni i vystupni
buffery. String-to-date konverze jsou vsak podporovany pouze pro nekolik 
nejbeznejsich datumovych formatu  Konverze cisla na datum predpoklada, ze dane cislo
je time_t (z jazyka C). Podobne opacna konverze prevede datum na hodnotu odpovidajici
time_t (pozor na pouziti - time_t neni bezpecny pro datumy za rokem 2038). Pokud 
nastavite datovy typ pri cteni dat na SQL_C_BINARY, ovladac s nim pracuje jako
by byl nastaven SQL_C_CHAR.


Podporovane formaty datumovych retezcu
****************************************
   {ts 'YYYY-MM-DD hh:mm:ss'} {t 'hh:mm:ss'}      {d 'YYYY-MM-DD'}
   hh:mm:ss DD.MM.YYYY        hh:mm:ss DD.MM.YY   hh:mm:ss YYYY-MM-DD   hh:mm:ss MM/DD/YYYY
   hh:mm DD.MM.YYYY           hh:mm DD.MM.YY      hh:mm YYYY-MM-DD      hh:mm MM/DD/YYYY
   DD.MM.YYYY hh:mm:ss        DD.MM.YY hh:mm:ss   YYYY-MM-DD hh:mm:ss   MM/DD/YYYY hh:mm:ss
   DD.MM.YYYY hh:mm           DD.MM.YY hh:mm      YYYY-MM-DD hh:mm      MM/DD/YYYY hh:mm
   DD.MM.YYYY                 DD.MM.YY            YYYY-MM-DD            MM/DD/YYYY
   hh:mm                      hh:mm:ss


BLOBy
*******
BLOBy jsou podporovany ve verzi 1.0.0 beta 2 a vyssi. Od verze 1.0.0 beta 3 je soucasti
ovladace plna podpora pro praci s BLOBy (cteni a zapis pomoci SQLBindCol, SQLBindParam,
SQLGetData a SQLPutData podle specifikace ODBC). Nespolehejte zatim na hodnoty SQLSTATEs
po SQLGetData (nejsou nastavovany spravne), navratova hodnota a indikatorovy buffer by
vsak mely odpovidat specifikaci. Pro BLOB sloupecky take nelze pouzit auto-konverze
datovych typu a lze je cist/zapisovat pouze pomoci bufferu typu SQL_C_CHAR nebo 
SQL_C_BINARY.


Rozsireni SQLGetData
**********************
Je podporovana vetsina rozsireni SQLGetData:
 - SQL_GD_ANY_COLUMN (SQLGetData lze volat pro kterykoli nesvazany sloupecek vcetne
   sloupceku pred poslednim navazanym sloupeckem)
 - SQL_GD_ANY_ORDER (SQLGetData muze byt volano s libovolnym poradim sloupecku)
 - SQL_GD_BOUND (SQLGetData muze byt volano i pro svazane sloupecky)


Izolacni urovne
******************
Defaultni izolacni urovni je SQL_TXN_READ_COMMITTED.
Izolacni urovne ODBC jsou interpretovany nasledujicim zpusobem:
 SQL_TXN_READ_UNCOMMITTED and SQL_TXN_READ_COMMITTED
   isc_tpb_read_committed + isc_tpb_rec_version
 SQL_TXN_REPEATABLE_READ
   isc_tpb_concurrency
 SQL_TXN_SERIALIZABLE
   isc_tpb_consistency


Autori
*********
Autorem teto knihovny je Roman Vanicek, XTG Systems, s.r.o.
Dalsi informace najdete na http://ofbodbc.sourceforge.net nebo http://www.xtgsystems.com.

Dalsi informace
******************
Firebird (WWW stranky) na http://firebird.sourceforge.net
InterBase (WWW stranky) na http://www.interbase.com
XTG Systems (WWW stranky) na http://www.xtg.cz
Open Firebird ODBC driver (WWW stranky) na http://ofbodbc.sourceforge.net

Podekovani
************
Chteli bychom na tomto miste velice podekovat mnoha lidem z celeho sveta, kteri se
rozhodli vyzkouset tento ovladac a pomahaji nam v jeho vylepsovani.

Licence
*********
Tato knihovna je free software vydany pod licenci GNU LGPL (Lesser General Public License).
Presne zneni je uvedeno v prilozenem souboru COPYING.txt
Tento software je uvolnen bez zaruky jakehokoli druhu a pouzivate jej vyhradne na sve
vlastni nebezpeci. Autori nenesou za funkci tohoto software a chyby a skody jim
zpusobene zadnou odpovednost.


Zaznam o zmenach
******************
 * 1.0.0 beta 1 - prvni verejna release, zakladni funkce funguji
 * 1.0.0 beta 2 - opravena SQLTables, aby spravne vracela dlouha jmena (s mezerami)
		- pridana podpora pro BLOB data (cteni i zapis) s nekterymi omezenimi
		   (viz. readme_cz.txt teto verze)
 * 1.0.0 beta 3 - dokoncena plna podpora pro praci s BLOBy, implementovano SQLParamData
                   a SQLPutData, graficky instalator a deinstalator
 * 1.0.0 beta 4 - string-to-date auto konverze, oprava date-to-string konverze,
		opravy a vylepseni SQLDriverConnect, nove implementovane funkce: SQLColAttributes,
                SQLNumParanms, SQLNativeSql, SQLColumns, SQLExtendedFetch (pouze FETCH_NEXT),
                instalator nyni kontroluje klientskou knihovnu InterBase, a dalsi (viz. release notes).
 * 1.0.0 beta 5 - oprava funkce SQLDriverConnect (nyni podporuje zjisteni udaju pomoci 
                dialogu); funkce SQLDescribeCol and SQLColAttributes nyni davaji spravne
                informace i o sloupeccich meta-result-setu.
 * 1.0.0 beta 6 - implementovany funkce SQLSetCursorName, SQLGetCursorName; upraveny
                funkce SQLGetStmtOption, SQLSetStmtOption, SQLGetConnectOption, 
                SQLSetConnectOption, SQLGetInfo, nastaveni izolacnich urovni,
                commit zachovava kontext prikazu stav kurzoru; oprava nekterych chyb
                souvisejicich s kurzory
 * 1.0.0 beta 7 - opravena podpora typu int64,decimal,numeric; opravena funkce SQLExtendedFetch;
                  rollback zachovava kontext prikazu; podpora dalsich parametru SQLGetInfo
 * 1.0.0 beta 8 - ruzne opravy; prepsani funkce SQLTables; zmena licence na LGPL
 * 1.0.0 beta 9 - opravy SQLTables a SQLColumns; pridana funkce SQLPrimaryKeys; ruzne opravy
                  a podpora spoluprace se StarOffice
 * 1.0.0 beta 10 - preskocena
 * 1.0.0 beta 11 - upgrade jadra a rohrani ovladace na ODBC 3, opravy chyb
 * 1.0.0 beta 12 - rada oprav, ladeni s MS Access; pre-procesor SQL prikazu (je podporovana
                   syntaxe outer-joins a datumu/casu se slozenymi zavorkami); SQLStatistics
                   vraci korektni ale prazdny result-set; implementovany funkce SQLRowCount
                   a SQLSpecialColumns.
 * 1.0.0 beta 13 - preskocena
 * 1.0.0 beta 14 - funkce SQLGetSetAttrs byly reimplementovany pro ODBC 3; connect podporuje
                   parametry CHARSET a ROLE
 * 1.0.0 beta 15 - podpora SQL_C_NUMERIC; oprava prevodu double na decimal; opravy meta-funkci
                   (citlivost na velikost pismen a zastupne znaky); oprava informaci
                   o podporovabych datovych typech

Doufame, ze shledate tento software uzitecnym,

XTG Systems team
