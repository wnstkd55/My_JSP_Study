-- ȸ�� ������ �����ϴ� ���̺�
Create table mbTb1(
    idx number not null,    -- ������ ����, �ڵ� ���� �÷�.
    id varchar2(100) not null,
    pass varchar2(100) not null,
    name varchar2(100) not null,
    email varchar2(100) not null,
    city varchar2(100) null,
    phone varchar2(100));
    
select * from mbtb1;

alter table mbtb1
add constraint mbtb1_id_PK primary key(id);

create sequence seq_mbTb1_idx
    increment by 1
    start with 1
    nocache;
    
/*���� ������ �Է�*/
insert into mbtb1(idx,id,pass,name,email,city,phone) values(seq_mbTb1_idx.nextval,'admin','1234','������','kosmo@kosmo.com','����','010-1111-1111');

