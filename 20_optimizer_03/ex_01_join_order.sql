
-- 경기 중, 2012년 9월 11일에 있는 경기의 홈팀 선수 중 골키퍼만 조회

select /*+ordered*/ ST.STADIUM_NAME 경기장, S.SCHE_DATE 경기일자, S.HOMETEAM_ID 홈팀, P.PLAYER_NAME 선수명, P.POSITION 포지션
from SCHEDULE_T S, PLAYER_T P, STADIUM_T ST
where P.TEAM_ID=S.HOMETEAM_ID
and S.GUBUN='N'
and S.SCHE_DATE='20120911'
and S.STADIUM_ID=ST.STADIUM_ID
and P.POSITION='GK'

-- nested loops
---- nested loops
------ table access by index rowid:schedule
-------- index range scan:schedule_pk
------ table access by index rowid:player
-------- index range scan:player_idx_position
---- table access by index rowid:stadium
------ index unique scan:stadium_pk

select /*+ordered*/ ST.STADIUM_NAME 경기장, S.SCHE_DATE 경기일자, S.HOMETEAM_ID 홈팀, P.PLAYER_NAME 선수명, P.POSITION 포지션
from PLAYER_T P, SCHEDULE_T S, STADIUM_T ST
where P.TEAM_ID=S.HOMETEAM_ID
and S.GUBUN='N'
and S.SCHE_DATE='20120911'
and S.STADIUM_ID=ST.STADIUM_ID
and P.POSITION='GK'

-- nested loops
---- nested loops
------ table access by index rowid:player
-------- index range scan:player_idx_position
------ table access by index rowid:schedule
-------- index range scan:schedule_pk
---- table access by index rowid:stadium
------ index unique scan:stadium_pk

