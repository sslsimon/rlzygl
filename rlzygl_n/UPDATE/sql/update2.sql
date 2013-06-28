DROP VIEW GET_RYXX;
;
DROP PROCEDURE UPDATE_YGGL;
;
ALTER TABLE RYXX DROP RY_GL;
;
ALTER TABLE RYXX ADD RY_GL COMPUTED BY ((current_date-RY_RZRQ)/365);
;
CREATE VIEW GET_RYXX(
    RY_NO,
    RY_NAME,
    RY_SEX,
    RY_RZRQ,
    RY_ZZRQ,
    RY_LZRQ,
    RY_ZT,
    RY_HY,
    RY_ZGXL,
    RY_ZY,
    RY_WY,
    RY_WYSP,
    RY_TC,
    RY_DW,
    RY_BM,
    RY_ZW,
    RY_ZW_RZRQ,
    RY_ZC,
    RY_ZCZ,
    RY_MZ,
    RY_ZZMM,
    RY_JG,
    RY_SFZH,
    RY_CSRQ,
    RY_JTZZ,
    RY_JTZZYZBM,
    RY_HKSZD,
    RY_HKYZBM,
    RY_HKXZ,
    RY_SBZH,
    RY_SB_SQRQ,
    RY_SB_TBRQ,
    RY_GJJH,
    RY_GJJ_SQRQ,
    RY_HTRQ_BEGIN,
    RY_HTRQ_END,
    RY_PHONE,
    RY_MOBEL_PHONE,
    RY_JBGZ,
    RY_XJBD,
    RY_GWBD,
    RY_BZ,
    RY_XSBM,
    RY_GL,
    RY_ZIC,
    RY_ZIGZ,
    JY_KSRQ,
    JY_JSRQ,
    JY_ADDRESS,
    JY_ZYMC,
    JY_XLMC,
    GZ_KSRQ,
    GZ_JSRQ,
    GZ_ADDRESS,
    GZ_ZWMC,
    XZBD_BDRQ,
    XZBD_BDHJE)
AS
select A.*,B.JY_KSRQ,B.jy_jsrq, B.jy_address, B.JY_ZYMC,B.jy_xlmc,C.gz_ksrq,C.gz_jsrq,C.gz_address,C.gz_zwmc,
D.xzbd_bdrq,D.xzbd_bdhje from ryxx a,ryxx_jyjl b,ryxx_gzjl c,ryxx_xzbdjl d
where a.ry_no=b.ry_no and a.ry_no=c.ry_no and a.ry_no=d.ry_no
;
