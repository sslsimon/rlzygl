copy isql.exe C:\WINDOWS\system32 /y
copy My_fun.dll C:\"Program Files"\Borland\InterBase\udf\ /y
isql D:\rlzygl\Data\RYXX.GDB -u sysdba -p masterkey -i dy_udf.SQL
pasuse