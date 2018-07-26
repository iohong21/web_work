select *
  from (select num, writer, title
             , lag(num,1,0) over(order by num desc) as prevNum
             , lead(num,1,0) over(order by num desc) as nextNum
          from board_cafe
         order by num desc)
 where num = 32;
 