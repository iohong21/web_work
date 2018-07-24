SELECT *
  FROM (SELECT X.*, ROWNUM rnum 
          FROM (SELECT num, writer, title, orgFileName, saveFileName, fileSize, downCount
                     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate
		              FROM board_file
             		 ORDER BY num DESC) X
        )
where rnum between 1 and 5