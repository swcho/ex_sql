
-- 포지션이 미드필더가 아닌 선수 정보를 팀 코드, 선수명, 포지션 순으로 조회

CREATE INDEX PLAYER_IDX_POSITION ON PLAYER(POSITION);

SELECT TEAM_ID, PLAYER_NAME, POSITION
FROM PLAYER
WHERE POSITION <> 'MF'
ORDER BY TEAM_ID, PLAYER_NAME;

-- SORT ORDER BY
---- TABLE ACCESS FULL:PLAYER

SELECT TEAM_ID, PLAYER_NAME, POSITION
FROM PLAYER
WHERE POSITION < 'MF'
AND POSITION > 'MF'
ORDER BY TEAM_ID, PLAYER_NAME;

-- SORT ORDER BY
---- CONCATENATION
------ TABLE ACCESS BY INDEX ROWID:PLAYER
-------- INDEX RANGE SCAN:PLAYER_IDX_POSITION
------ TABLE ACCESS BY INDEX ROWID:PLAYER
-------- INDEX RANGE SCAN:PLAYER_IDX_POSITION
