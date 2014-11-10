class Patent < ActiveRecord::Base
  
  has_many :articles
 # before_save :update_patent_article_total
 
	extend FriendlyId
	friendly_id :apply_no, use: :slugged 
	validates(:apply_no, presence: true)


  def self.relationship_parent(patent_scopy)
    
    @parent = Hash.new { |hash,key| hash[:key] =[]}
    independent = Array.new
    d = Array.new
    e = Array.new

   # @patent_scopy_by_item.each do |item|
      patent_scopy.each do |item|
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
         
         
#      end  if ending point
#    end second each loop ending point
         
      end  # each loop ending point
  return @parent
  end  # method relationship_parent ending point


  def self.relationship(patent_scopy)
    
    @h = Hash.new { |hash,key| hash[:key] =[]}
    independent = Array.new
    b = Array.new
    c = Array.new

    patent_scopy.each do |item|
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
          
            independent << b[0]
        #   binding.pry  
  #      end 
  #    end
      independent.uniq
  # Nested set model          
    end
#  binding.pry  
#json = build_tree(@h.keys[0], @h)
  return @h
  end

  def build_tree(id, src)
    child_array = src[:"#{id}"]
  #  @index+=1
    return { name: id } if child_array.empty? 
  #  binding.pry
    #children = child_array
    return { name: id, children: child_array.map { |child_id| build_tree(child_id.to_s, src) } }
  end

def update_patent_article_total
  scopy_by_item = self.patent_scope.split("<br>")
  self.update_attributes(article_total: scopy_by_item.length) if self.article_total == nil 
end


end
 
