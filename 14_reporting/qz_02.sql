
# K리그 선수 수를 팀 별, 포지션 별 선수 수를 조회하기 위해, 팀 명, 포지션, 선수 수 순으로 조회하라.
# 팀 별, 포지션 별 소계, 총계를 같이 조회하고, 포지션 별로 별도 총계를 조회한다.
# 단, TEAM 과 PLAYER 테이블은 NATURAL JOIN으로 JOIN 하고, 포지션이, TC, TD, TM은 제외한다.

SELECT TEAM.TEAM_NAME, PLAYER.POSITION, COUNT(*)
FROM TEAM NATURAL JOIN PLAYER
WHERE POSITION NOT IN ('TC', 'TD', 'TM')
GROUP BY CUBE (TEAM_NAME, POSITION)
ORDER BY 1, 2;