-- '동일한 회원이, 동일한 상품을' -> group by로 두덩어리를 그룹핑
-- '재구매한 데이터를 추출해야한다' -> 그룹핑된 데이터(행)가 2개 이상만 -> having 사용

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(USER_ID) >= 2
ORDER BY USER_ID, PRODUCT_ID DESC