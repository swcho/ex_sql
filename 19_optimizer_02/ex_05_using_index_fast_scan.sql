
-- 각 경기장별 홈팀의 총 득점수를 합산

SELECT STADIUM_ID, SUM(HOME_SCORE)
FROM SCHEDULE_T
WHERE GUBUN='Y'
GROUP BY STADIUM_ID;

-- sort gourp by
---- table access by index rowid:schedule
------ index range scan:scheduel_pk

CREATE INDEX SCHEDULE_IDX_1 ON SCHEDULE(
GUBUN,
STADIUM_ID,
HOME_SCORE
);

SELECT STADIUM_ID, SUM(HOME_SCORE)
FROM SCHEDULE
WHERE GUBUN='Y'
GROUP BY STADIUM_ID;

-- sort group by
---- index range scan:schedule_idx_1


