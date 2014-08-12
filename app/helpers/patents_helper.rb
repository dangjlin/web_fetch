module PatentsHelper
	def right_slice(item)
   # for i in 0..1
    if ( item.index("#{@first_key[1]}") == 3 ) || ( item.index("#{@first_key[1]}") == 4 ) 
     #   for j in 0..(@second_key.size-1) 
          # 計算要從哪一個字右邊開始截取
          if (item.index('其中')) != nil
            @second_scope= item.slice( (item.index('其中').to_i+2)..(item.size) )
          elsif (item.index('包含')) != nil
            @second_scope= item.slice( (item.index('包含').to_i+2)..(item.size) )
          end   
      #  end 
      else
         @second_scope= ""
       # @second_scope= item.index("#{@first_key[1]}")
      end 
  
  #  break
  #  end 
      
  end

  def left_slice(item)
 #     if ( item.index('如申請專利範圍') == 3 ) || ( item.index('如申請專利範圍') == 4 ) 
      if ( item.index('如申請') == 3 ) || ( item.index('如申請') == 4 ) 
          # 計算要從第一個字往右邊取到何時停止 
          if (item.index('其中')) != nil 
            @first_scope= item.slice( 1..(item.index('其中').to_i+1) ) 
          elsif (item.index('包含')) != nil 
            @first_scope= item.slice( 1..(item.index('包含').to_i+1) )
          end
      else
          @first_scope= item
      end 
  end

  def column_color(item)
    if ( item.index('如申請') == 3 ) || ( item.index('如申請') == 4 ) 
      ""
    else
      "red" 
    end
  end

end
