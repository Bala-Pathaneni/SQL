--PIVOTING A TABLE IN SQL

CREATE TABLE STUDENT (
"STUDENT_ID" INTEGER,
"NAME" VARCHAR(50),
"SUBJECT" VARCHAR(50),
"SCORE" INTEGER
);

INSERT INTO STUDENT VALUES
(1,'Richard','Math',50),
(1,'Richard','Physics',56),
(1,'Richard','Chemistry',70),
(2,'Nicholas','Math',79),
(2,'Nicholas','Physics',7),
(2,'Nicholas','Chemistry',11),
(3,'John','Math',100),
(3,'John','Physics',40),
(3,'John','Chemistry',50);

SELECT STUDENT_ID,NAME,
	[MATH] AS Math_Marks,
	[Physics] AS Physics_Marks,
	[Chemistry] AS Chemistry_Marks
FROM  (
		SELECT STUDENT_ID,NAME,SUBJECT,SCORE FROM STUDENT
	   ) SRC
PIVOT (
		MAX(SCORE) FOR SUBJECT IN ([Math], [Physics], [Chemistry])
	  ) PIV
ORDER BY STUDENT_ID;
		