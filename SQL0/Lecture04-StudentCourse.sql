USE lecture04;

SELECT S.sid,S.name,S.gpa,E.cid,E.grade
FROM S, E # student table and enroll table
WHERE S.sid=E.sid and grade = 'A'; #match sid from the 2 tables