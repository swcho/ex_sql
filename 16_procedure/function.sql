
create or replace function util_abs(v_input in number)
return number
is
  v_return number := 0;
BEGIN
  if v_input < 0 then
    v_return := v_input * -1;
  else
    v_return := v_input;
  end if;
  return v_retur;
end;