
select a.RY_BM, a.RY_NO, a.RY_NAME, a.RY_GLGZ, a.RY_LZRQ, a.RY_ZT, a.BZ
from get_gzd_ryxx a left join gzd_item b on a.ry_no=b.ry_no
where b.gzd_month=201108 and (a.ry_zt<>2 or EXTRACT(month from a.ry_lzrq)+2='11')

