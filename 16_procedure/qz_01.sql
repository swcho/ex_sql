-- K-리그에서 팀별 총 경기수를 조회하는 PROCEDURE를 작성하라.
-- PROCEDURE 명은 SELECT_SCHEDULE로 하고, 파라미터는 V_TEAM_ID, V_RESULT로 하고,
-- 데이터 타입은 CHAR(3), NUMBER로 정의한다.
-- V_TEAM_ID에 팀 코드를 넣으면 경기수를 V_RESULT로 입력한다.
-- 오류 발생은 고려하지 않는다.

CREATE OR REPLACE PROCEDURE SELECT_SCHEDULE(
  V_HOMETEAM_ID IN CHAR,
  V_RESULT OUT NUMBER
)
  IS

BEGIN
  SELECT COUNT(*) INTO V_RESULT
  FROM SCHEDULE
  WHERE HOMETEAM_ID=V_HOMETEAM_ID;
END;
  /

VARIABLE RS NUMBER EXECUTE SELECT_SCHEDULE('K02',:RS);
print RS;