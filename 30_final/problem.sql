
select PLAYER_NAME, HEIGHT, WEIGHT from PLAYER_T order by PLAYER_NAME;

create index PLAYER_IDX_PLAYER_NAME on PLAYER_T(PLAYER_NAME);

select PLAYER_NAME, HEIGHT, WEIGHT from PLAYER_T order by PLAYER_NAME;
