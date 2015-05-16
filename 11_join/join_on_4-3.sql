-- 홈팀이 3점 이상 차이로 승리한 경기의 경기장 이름, 경기 일정 홈팀과 원정팀 이름 정보 출력
-- select *
select st.STADIUM_NAME, s.SCHE_DATE, t1.TEAM_NAME, t2.TEAM_NAME
  from SCHEDULE s
  join STADIUM st
    on s.STADIUM_ID = st.STADIUM_ID
  join TEAM t1
    on s.HOMETEAM_ID = t1.TEAM_ID
  join TEAM t2
    on s.AWAYTEAM_ID = t2.TEAM_ID
where HOME_SCORE >= AWAY_SCORE + 3
group by SCHE_DATE
