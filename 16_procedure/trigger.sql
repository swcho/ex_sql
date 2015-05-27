--

create or replace trigger summary_sales
  after INSERT
  on order_list
  for each ROW
DECLARE
  o_date order_list.order_date%type;
  prd order_list.product%type;
BEGIN
  o_date := :new.order_date;
  prd := :new.product;
  update sales_per_date
    set qty = qty + :new.qty,
      amount = amount + :new.amount
  where sales_date = o_date
    and prodcut = prd;
  if sql%notfound THEN
    insert into sales_per_date
      values(o_date, prd, :new.qty, :new.amount);
  end if;
end;