module PatentsHelper
	def right_slice(item)
    @first_key.each do |match_key| 
      if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 
          @second_key.each do |match_key2|
            if (item.index("#{match_key2}")) != nil
            # 計算要從斷詞開始往右邊取到最後停止 
              @second_scope= item.slice( (item.index("#{match_key2}").to_i+2)..(item.size) )
            break
            end
          #  if (item.index('其中')) != nil
          #    @second_scope= item.slice( (item.index('其中').to_i+2)..(item.size) )
          #  elsif (item.index('包含')) != nil
          #    @second_scope= item.slice( (item.index('包含').to_i+2)..(item.size) )
          #  end
          end
      break
      else
         @second_scope= ""
      end   
    end 
  #下面return這一行很重要... 沒有這一行的話,這個 method 會回傳 @first_key 的內容 這是因為 loop 的關係  
  #ruby default 上 method 會回傳最後一個變數回去給呼叫的人
  return @second_scope    
  end

  def left_slice(item)
    @first_key.each do |match_key| 
      if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 
          @second_key.each do |match_key2|
            if (item.index("#{match_key2}")) != nil    
            # 計算要從第一個字往右邊取到何時停止 
              @first_scope= item.slice( 1..(item.index("#{match_key2}").to_i+1) ) 
            break
            end
          end
      break
      else
          @first_scope= item
      end 
    end
  return @first_scope   
  end

  def column_color(item)
    @first_key.each do |match_key| 
      if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 
       @color = ""
      break
      else
       @color = "red" 
      end
    end 
  return @color
  end

end
