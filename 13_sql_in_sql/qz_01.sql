# 삼성블루윙즈 케이스문

select PLAYER_NAME, BACK_NO,
  case when POSITION='FW' then '공격수'
    when POSITION='MF' then '미드필더'
    when POSITION='DF' then '수비수'
    when POSITION='GK' then '골키퍼'
  end
from PLAYER
where POSITION not in ('TC', 'TD', 'TM');
