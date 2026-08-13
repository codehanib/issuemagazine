select * from member;

INSERT INTO orders (o_no,o_date,o_status,m_no)
VALUES (1,SYSDATE,'배송준비중',1001);

INSERT INTO orders_detail (od_no,o_no,od_name,od_quantity,od_price,p_no)
VALUES (1,1,'테스트 상품',1,25000,2001);

select * from USER_SEQUENCES;

COMMIT;

SELECT *
FROM member
WHERE m_no = 1001;

SELECT *
FROM product
WHERE p_no = 2001;