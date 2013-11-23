delete from BMXX where bm_no<>0;
update BMXX set bmmc='版本权所有',in_gzd=true where bm_no=0;
delete from GZD;
delete from HTGL;
delete from OPERATOR_XX where operator_no<>999;
delete from RYXX;
delete from USER_RIGHT where user_id=999 and user_right<>'N10' and user_right<>'N15' and user_right<>'N12' and user_right<>'N14';
delete from ZWXX;
commit;