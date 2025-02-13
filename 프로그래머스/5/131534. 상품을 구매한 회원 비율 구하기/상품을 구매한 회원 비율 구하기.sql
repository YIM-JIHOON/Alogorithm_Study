-- 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율을 년, 월별로 출력
-- 비율: 2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수

SELECT YEAR(O.SALES_DATE) AS YEAR,
       MONTH(O.SALES_DATE) AS MONTH,
       COUNT(DISTINCT O.USER_ID) AS PURCHASED_USERS,
       ROUND(COUNT(DISTINCT O.USER_ID) 
       / (SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = '2021'),1) AS PUCHASED_RATIO
FROM USER_INFO U
JOIN ONLINE_SALE O
  ON U.USER_ID = O.USER_ID
WHERE YEAR(U.JOINED) = '2021'
GROUP BY 1, 2
ORDER BY 1, 2