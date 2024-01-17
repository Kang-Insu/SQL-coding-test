-- 코드를 입력하세요
SELECT a.apnt_no, p.pt_name, a.pt_no, a.mcdp_cd, d.dr_name, a.apnt_ymd
FROM patient p
    JOIN appointment a ON p.pt_no = a.pt_no
    JOIN doctor d ON a.mddr_id = d.dr_id
WHERE date_format(a.apnt_ymd, '%Y-%m-%d') = '2022-04-13' AND a.mcdp_cd = 'cs' AND a.apnt_cncl_yn = 'N'
ORDER BY 6;