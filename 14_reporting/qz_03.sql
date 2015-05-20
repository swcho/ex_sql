# K-리그의 선수 수를 팀 별 선수 수, 포지션 별 선수 수를 조회하기 위해,
# 팀 명, 포지션, 선수 수 순으로 GROUPING SETS() 함수를 사용하여 조회하라.
# 단, TEAM 과 PLAYER 테이블은 NATURAL JOIN 으로 JOIN 하고, 포지션이 TC, TD, TM은 제외

SELECT TEAM.TEAM_NAME, PLAYER.POSITION, COUNT(*)
FROM TEAM NATURAL JOIN PLAYER
WHERE POSITION NOT IN ('TC', 'TD', 'TM')
GROUP BY GROUPING SETS (TEAM_NAME, POSITION);