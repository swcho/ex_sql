
-- # K-리그에서 팀 별 경기수를 조회하기 위해 팀명, 총 경기수, 치른 경기수, 남은 경기수 순으로 조회하고,
-- # 실행계획을 만들어 확인하라. 단, 경기를 했는지 여부는 GUBUN 코드의 'Y', 'N'으로 구분한다.

EXPLAIN PLAN SET STATEMENT_ID='18_11.SQL'
FOR
SELECT S1.HOMETEAM_ID, S1.SCHE1, S2.SCHE2
FROM (SELECT HOMETEAM_ID, COUNT(*) SCHE1
      FROM SCHEDULE_T
      WHERE GUBUN='Y'
      GROUP BY HOMETEAM_ID) S1,
  (SELECT HOMETEAM_ID, COUNT(*) SCHE2
   FROM SCHEDULE_T
   WHERE GUBUN='N'
   GROUP BY HOMETEAM_ID) S2
WHERE S1.HOMETEAM_ID=S2.HOMETEAM_ID
ORDER BY S1.HOMETEAM_ID;