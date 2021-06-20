--first query
--course_name,course_level,course_code,test_code,score
select CI.child_id,course_name,course_level,course_code,test_code,pre_requisite,score from courses C
inner join child_takes_course CI USING(course_code)
inner join tests T USING(course_code)
inner join results R USING(test_code)
where CI.child_id=1 and R.child_id=1 and C.course_name='Writing';

select C.course_code,C.pre_requisite,R.score 
from tests T
join Results R on R.test_code=T.test_code
join courses C on C.pre_requisite=T.course_code where R.score>10 and C.course_code not in (select course_code from child_takes_course);




select T.course_code,C.course_level,C.course_name,C.course_duration,T.test_code,R.score,CI.child_id
from  results R 
join tests T on T.test_code=R.test_code
join courses C on C.course_code=T.course_code
join child_takes_course CI on  CI.child_id=R.child_id
where CI.child_id=1;
/*
1	w_01	1
1	w_02	2
2	w_02	3
2	w_03	4
1	w_03	5
*/
INSERT INTO CHILD_TAKES_COURSE ( CHILD_CID_TAKES,CHILD_ID, COURSE_CODE) VALUES ('1', '1','w_1');
INSERT INTO CHILD_TAKES_COURSE ( CHILD_CID_TAKES,CHILD_ID, COURSE_CODE) VALUES ('2', '1','w_2');
INSERT INTO CHILD_TAKES_COURSE ( CHILD_CID_TAKES,CHILD_ID, COURSE_CODE) VALUES ('3', '2','w_2');
INSERT INTO CHILD_TAKES_COURSE ( CHILD_CID_TAKES,CHILD_ID, COURSE_CODE) VALUES ('4', '2','w_3');
INSERT INTO CHILD_TAKES_COURSE ( CHILD_CID_TAKES,CHILD_ID, COURSE_CODE) VALUES ('5', '1','w_3');

/*
1	1	01	9
2	2	2	5
3	3	2	16
4	1	3	5
5	1	4	15
6	1	5	20
*/
INSERT INTO Results(result_id,CHILD_ID, test_CODE,score) VALUES ('1', '1','1','9');
INSERT INTO Results(result_id,CHILD_ID, test_CODE,score) VALUES ('2', '2','2','5');
INSERT INTO Results(result_id,CHILD_ID, test_CODE,score) VALUES ('4', '1','3','5');
INSERT INTO Results(result_id,CHILD_ID, test_CODE,score) VALUES ('5', '1','4','15');
INSERT INTO Results(result_id,CHILD_ID, test_CODE,score) VALUES ('6', '1','5','20');

INSERT INTO tests(test_code,course_code,teacher_id) VALUES ('1', 'w_1','1');
INSERT INTO tests(test_code,course_code,teacher_id) VALUES ('2', 'w_2','1');
INSERT INTO tests(test_code,course_code,teacher_id) VALUES ('3', 'w_3','1');
INSERT INTO tests(test_code,course_code,teacher_id) VALUES ('4', 'w_2','1');
INSERT INTO tests(test_code,course_code,teacher_id) VALUES ('5', 'w_1','1');

/* sazia's code for course_codes in which the child fails (gets <10)*/
select C.course_code,R.score
from tests T
join Results R on R.test_code=T.test_code
join courses C on C.course_code=T.course_code
where R.score<10;


SELECT course_code,course_level,test_code,test_question
        from courses join tests using(course_code) join child_takes_course using(course_code)
        where child_id = 1
         order by test_code
         
select course_code,test_code from tests inner join courses using (course_code);