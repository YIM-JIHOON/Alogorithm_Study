-- SKILL_CODE값이 'Python'나, 'C#'을 나타내는 비트를 포함하는 개발자를 찾기
-- 포함한다는 의미는 해당 기술을 나타내는 비트가 1로 설정되어 있음을 의미

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')
    OR SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')
ORDER BY ID

-- SELECT CODE FROM SKILLCODES WHERE NAME = 'Python'은 Python에 해당하는 비트 코드를 반환
-- SELECT CODE FROM SKILLCODES WHERE NAME = 'C#'은 C#에 해당하는 비트 코드를 반환

-- SKILL_CODE & (SELECT CODE ...)는 테이블 DEVELOPERS에서 얻은 SKILL_CODE와 위의 서브쿼리에서 얻은 코드 값을 & 연산자로 비트 AND 연산 수행하고, 그 결과가 0이 아닌 값들을 찾는다는 의미
-- 0이 아닌 결과는 적어도 한 개의 해당 기술 비트가 포함되어 있다는 것을 의미
-- & 연산자를 사용하면, 피연산자로 주어진 10진수 숫자들은 내부적으로 2진수로 변환된 후 비트별로 AND 연산이 수행됨

-- 예를 들면, 
-- Python 검사: 1010 & 1000 = 1000 (0이 아님, Python이 포함되어 있다는 의미) 
-- C# 검사: 1010 & 0010 = 0010 (0이 아님, C#이 포함되어 있다는 의미)