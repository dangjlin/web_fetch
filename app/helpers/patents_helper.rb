module PatentsHelper
 
	def right_slice(item)
   # @patent_scopy_by_item_right = Array.new 
    @second_scope = "" 
    @first_key.each do |match_key| 
      if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 
          @second_key.each do |match_key2|
            if (item.index("#{match_key2}")) != nil
            # 計算要從斷詞開始往右邊取到最後停止 
              @second_scope= item.slice( (item.index("#{match_key2}").to_i+match_key2.length)..(item.size) )
          
        
            break
            else
              @seconde_scope = "此項目為附屬項，但第二步關鍵字比對不到"
            end 
          end
      break
      else
         @second_scope= ""
      end   

  end 
  #下面return這一行很重要... 沒有這一行的話,這個 method 會回傳 @first_key 的內容 這是因為 loop 的關係  
  #ruby default 上 method 會回傳最後一個變數回去給呼叫的人
  
        @patent_scopy_by_item_right << @second_scope 
        @repeat_no << (@patent_scopy_by_item_right.index("#{@second_scope}")+1)
     return @second_scope  
    #  binding.pry
  end

  def left_slice(item)
    @first_key.each do |match_key| item
      if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 
          @second_key.each do |match_key2|
            if (item.index("#{match_key2}")) != nil    
            # 計算要從第一個字往右邊取到何時停止 
              @first_scope= item.slice( 1..(item.index("#{match_key2}").to_i+(match_key2.length-1) ) )
            break
            else
              @first_scope = "此項目為附屬項，但第二步關鍵字比對不到"
            end
          end
      break
      else
          @first_scope= item
      end 
    #  binding.pry
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

  def relationship
    
    @h = Hash.new { |hash,key| hash[:key] =[]}
    independent = Array.new
    b = Array.new
    c = Array.new

    @patent_scopy_by_item.each do |item|
      b.clear
      c.clear
 #     @first_key.each do |match_key| 
 #       if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 

        # 用來抓出從屬項的兩組數字，第一個是自身編號，第二個其繼承的獨立項編號
 #       c = item.scan(/\d+/)
 #       h[:"#{c[1]}"] << [c[0]]       
 #     break
 #       else
          if (item.index("<td class=\"rectd2\">")) == 0 
            b = item.slice(19..item.length).scan(/\d+/)
          else
            b = item.scan(/\d+/)
          end

          # 開始增加獨立項的編號作為 hash 的 key 值 
            @h[:"#{b[0]}"] = %w()
            if b.size >= 2 
              @h[:"#{b[1]}"] << b[0]
            end
           #binding.pry  
            independent << b[0]
  #      end 
  #    end
      independent.uniq
  # Nested set model          
    end
#  binding.pry  
  end

def relationship_parent
    
    @parent = Hash.new { |hash,key| hash[:key] =[]}
    independent = Array.new
    d = Array.new
    e = Array.new

    @patent_scopy_by_item.each do |item|
      d.clear
      e.clear
 #     @first_key.each do |match_key| 
 #       if ( item.index("#{match_key}") == 3 ) || ( item.index("#{match_key}") == 4 ) 

        # 用來抓出從屬項的兩組數字，第一個是自身編號，第二個其繼承的獨立項編號
 #       c = item.scan(/\d+/)
 #       h[:"#{c[1]}"] << [c[0]]       
 #     break
 #       else
          if (item.index("<td class=\"rectd2\">")) == 0 
            d = item.slice(19..item.length).scan(/\d+/)
          else
            d = item.scan(/\d+/)
          end

          # 判斷每一個子項目的母項目編號，寫入陣列當中
                @parent[:"#{d[0]}"] = %w()
            if d.size >= 2 
                @parent[:"#{d[0]}"] << d[1]
            end
           #binding.pry  

         
         
#      end  if ending point
#    end second each loop ending point
         
      end  # each loop ending point
#  binding.pry  
  end  # method ending point


end   # helper module ending point
