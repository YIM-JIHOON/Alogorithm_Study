SELECT BOARD_ID, 
       WRITER_ID, 
       TITLE, 
       PRICE, 
       CASE STATUS WHEN 'SALE' THEN '판매중'
                   WHEN 'RESERVED' THEN '예약중'
                   WHEN 'DONE' THEN '거래완료'
       END
FROM USED_GOODS_BOARD 
WHERE CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC