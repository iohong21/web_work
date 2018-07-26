SELECT *
  FROM (SELECT result2.*
	           , LAG(num) over(order by num) as PrevNum
	           , LEAD(num) over(order by num) as NextNum
	        FROM (SELECT result1.*, ROWNUM rnum 
				          FROM (SELECT num, writer, title, content, viewCount
				                     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate
							            FROM board_cafe
							           ORDER BY num DESC
							         ) result1 
			         ) result2
			 )
 WHERE num = 22;
