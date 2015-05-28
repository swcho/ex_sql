-- 대한민국 국적의 선수가 각 팀 별로 몇명인가?

CREATE INDEX PLAYER_IDX_NATION ON PLAYER(NATION);

SELECT T.TEAM_NAME 팀명, COUNT(*) 대한민국선수
FROM PLAYER P, TEAM T
WHERE P.NATION = '대한민국'
AND P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME
ORDER BY T.TEAM_NAME;

-- sort group by
---- nested loops
------ table access by index rowid:player
-------- index rage scan:player_idx_nation
------ table access by index rowid:team
-------- index unique scan:team_pk

UPDATE PLAYER
SET NATION = NULL
WHERE NATION = '대한민국';

ALTER INDEX PLAYER_IDX_NATION REBUILD UNRECOVERABLE;

SELECT T.TEAM_NAME 팀명, COUNT(*) 대한민국선수
FROM PLAYER P, TEAM T
WHERE P.NATION IS NULL
AND P.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_NAME
ORDER BY T.TEAM_NAME;

-- sort group by
---- index range scan:schedule_idx_1