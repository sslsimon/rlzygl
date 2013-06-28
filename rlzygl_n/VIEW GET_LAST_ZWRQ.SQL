CREATE VIEW GET_LAST_ZWRQ(
    RY_NO,
    LAST_ZW_RQ,
    MAX_ID)
AS
select ry_no,max(gz_jsrq) as gz_jsrq,max(gzjl_id) as gzjl_id from ryxx_gzjl
where ry_no in (select ry_no from ryxx_gzjl)
group by ry_no
;