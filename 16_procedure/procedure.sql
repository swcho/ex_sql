
create or replace procedure p_dept_insert(
    v_dpetno in number,
    v_dname in VARCHAR2,
    v_result out VARCHAR2
)
  is
    cnt number := 0;
  BEGIN
    select count(*) into cnt
    from dept where deptno = v_dpetno;
    if cnt > 0 THEN
      v_result := 'already exists';
    ELSE
      insert into dept (DEPTNO, DNAME, LOC)
        values (v_deptno, v_dname, v_loc);
      commit;
      v_result := 'completed';
    end if;
  EXCEPTION
    when others THEN ROLLBACK ;
    v_result := 'error';
  END ;