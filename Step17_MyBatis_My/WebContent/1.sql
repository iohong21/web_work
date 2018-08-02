select *
  from (select num, writer, title
             , lag(num,1,0) over(order by num desc) as prevNum
             , lead(num,1,0) over(order by num desc) as nextNum
          from board_cafe
         order by num desc)
 where num = 32;
 
-- 댓글에 달린 하위 댓글의 갯수
select a.*
     , (select count(*) 
          from (select *
                  from BOARD_CAFE_COMMENT
                 where num <> comment_group) b
         where b.comment_group = a.num) as replayCount
  from BOARD_CAFE_COMMENT a
  
  SELECT  num, writer, caption, imagePath,  to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate      
    FROM board_gallery