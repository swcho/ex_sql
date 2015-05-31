-- SALES_PER_DATE 테이블을 이용하여 '20020911' 부터 '20020920' 까지 TTL 상품 판매액을 일자별로 조회

select SALE_DATE, PRODUCT, QTY*AMOUNT 판매액
from SALES_PER_DATE
where SALE_DATE between '20120911' and '20120920'
and PRODUCT = 'TTL';

-- table access by index rowid:sales_per_date
---- index range scan:sales_per_date_pk

create table CM_DATE(
    DATE_YMD char(8) not null
);

create unique index CM_DATE_IDX_DATE_YMD on CM_DATE(DATE_YMD);

select SALE_DATE, PRODUCT, QTY*AMOUNT 판매액
from SALES_PER_DATE
where SALE_DATE in (
    select DATE_YMD from CM_DATE where DATE_YMD between
    '20020911' and '20020920'
)
and product='TTL';

-- nested loops
---- index range scan:CM_DATE_IDX_DATE_YMD
---- table access by index rowid:sales_per_date
------ index unique scan:sales_per_date_pk
