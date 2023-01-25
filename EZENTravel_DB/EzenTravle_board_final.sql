-- 유저 테이블 us
create table us (
    user_num number not null primary key, -- 유저 번호 pk(시퀀스)
    nickname varchar2(50) not null -- 유저 닉네임
);
-- 게시판 테이블 cm_board
create table cm_board(
    bno number not null primary key, -- 게시판 번호 pk(시퀀스)
    title varchar2(100) not null, -- 제목
    readcount number default 0, -- 조회수
    create_date date, -- 게시판 생성 날짜
    content varchar2(4000) not null, -- 게시글
    user_num number not null  -- 유저 번호 fk
);
-- 댓글 테이블 cm_comment
create table cm_comment (
    cno number not null primary key, -- 댓글 번호 pk(시퀀스)
    board_comment varchar2(2000), -- 댓글
    comment_date date, -- 댓글 생성 날짜
    user_num number not null, -- 유저 번호 fk
    bno number not null -- 게시글 번호 fk
);

-- foreign key 참조 및 제약조건 설정 (oracle update cascade 설정 안됨)
alter table cm_board add constraint cm_board_us_fk 
    foreign key (user_num) REFERENCES us (user_num) ON DELETE CASCADe; on update cascade;

alter table cm_comment add constraint cm_comment_cm_board_fk
    foreign key (bno) references cm_board (bno) ON DELETE CASCADE; on update cascade;
    
alter table cm_comment add constraint cm_comment_us_fk
    foreign key (user_num) references us (user_num) ON DELETE CASCADE; on update cascade ;

-- user_num 시퀀스 생성
create sequence us_user_num_seq
start with 1
increment by 1
nocache
nocycle;
-- bno 시퀀스 생성
create sequence cm_board_bno_seq
start with 1
increment by 1
nocache
nocycle;
-- cno 시퀀스 생성
create sequence cm_comment_cno_seq
start with 1
increment by 1
nocache
nocycle;

drop sequence cm_comment_cno_seq;

-- 초기 값
insert into us
values (us_user_num_seq.nextval, 'eoooomji5');

select * from us;

insert into cm_board(bno, title, readcount, create_date, content, user_num)
values(cm_board_bno_seq.nextval, '안녕하세요~', 0, sysdate, '안녕하세요!! ㅎㅎ', 3);

select * from cm_board
order by bno;

insert into cm_comment(cno, board_comment, comment_group, comment_step, comment_level, comment_date, user_num, bno)
values(3, '댓글테스트3', 1, 1, 1, sysdate, 1, 2);

select * from cm_comment;

commit;

---------
drop table us;

drop table cm_board;

drop table cm_comment;