-- GK 포지션의 선수별 연고지명, 팀명, 구장명을 출력
select p.POSITION, p.PLAYER_NAME, t.REGION_NAME, t.TEAM_NAME, s.STADIUM_NAME
  from PLAYER p
  join TEAM t
    on p.TEAM_ID=t.TEAM_ID
  join STADIUM s
    on t.STADIUM_ID=s.STADIUM_ID
where p.POSITION='GK'
