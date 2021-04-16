WITH BRANDS_PRICE AS (SELECT BD.NAME
                        , SUM(ID.FINALPRICE) AS TOT_AMT
                FROM USERS_DIM UD
                        JOIN RECEIPTS_SUMMARY_FACT RS ON UD._ID = RS.USER_ID
                        JOIN RECEIPTS_FACT RF ON RS.RECEIPTS_ID = RF.RECEIPTS_ID
                        JOIN ITEMS_DIM ID ON RF.ITEMS_ID = ID._ID
                        JOIN BRANDS_DIM BD ON RF.BRAND_ID = BD._ID
                WHERE CREATEDDATE >= DATEADD(month, -6, SYSDATE())
                GROUP BY 1)
SELECT A.NAME
FROM (SELECT NAME
            , RANK() OVER(ORDER BY TOT_AMT DESC) AS RANK               
        FROM BRANDS_PRICE) A
WHERE A.RANK = 1;