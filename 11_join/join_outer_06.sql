-- STADIUM과 TEAM을 조인하되 홈팀이 없는 경기장도 출력
select *
  from STADIUM
  left outer join TEAM
    on STADIUM.HOMETEAM_ID=TEAM.TEAM_ID