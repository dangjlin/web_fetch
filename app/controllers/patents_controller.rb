class PatentsController < ApplicationController


	def index 
    @patents = Patent.all.order("created_at DESC")
	end 

	def new

		@patent = Patent.new 

	end

	def create
		@patent = Patent.new(patent_params)
		return_patent_scope(patent_params[:apply_no],12)
		@patent.patent_scope = @result

		if @patent.save
			#flash[:success] = "查詢成功!寫入資料庫成功!"
			redirect_to @patent
		else
			render 'new'
		end

	end
  
  def slice_sentence
    @patent = Patent.friendly.find(params[:id])
		@patent_scopy_by_item = @patent.patent_scope.split("<br>")
    index = 0
    b = Array.new
    c = Array.new

    @patent_scopy_by_item.each do |item|
     # binding.pry
      article = Article.new
      article.patent_id = params[:id].to_s
      #article.sentence_id = index+1
      article.sentence = item 

      b.clear
      c.clear
          if (item.index("<td class=\"rectd2\">")) == 0 
            b = item.slice(19..item.length).scan(/\d+/)
          else
            b = item.scan(/\d+/)
          end

         # binding.pry

          if b.size >=2           
            article.child_id = b[0]
            article.parent_id = b[1] 
            article.sentence_id = b[0]
          else 
            article.child_id = "no_child"
            article.parent_id = "no_parent"
            article.sentence_id = b[0]
          end        
	    
      if article.save 
      #  flash[:success] = "查詢成功!寫入資料庫成功!"
      #  redirect_to :back
      else
        puts "error occur"
      end
	  end
    redirect_to @patent  

  end
  
  def json_tree
    @patent = Patent.friendly.find(params[:id])
		@patent_scopy_by_item = @patent.patent_scope.split("<br>")
  
    @abc = Patent.relationship_parent(@patent_scopy_by_item)
    @def = Patent.relationship(@patent_scopy_by_item)
   # binding.pry
    @show_index = @abc.select {|k,v| v.empty? } 

    @result_hash = []
      @show_index.keys.each do |root| 
     # binding.pry
      @result_hash << build_tree(root.to_s, @def)  
     # binding.pry    
      end
     
    respond_to do |format|
      format.html { render json: @result_hash  } 
    end
  end
  

	def show

	#	@patent = Patent.find(params[:id])
	#   use friendly_id as slugged title 
		@patent = Patent.friendly.find(params[:id])
		@patent_scopy_by_item = @patent.patent_scope.split("<br>")
    @first_key = Keyworda.where.not('keyworda' => nil).order('priority asc').pluck(:keyworda)
    @second_key = Keywordb.where.not('keywordb' => nil).order('priority asc').pluck(:keywordb)
    @patent_scopy_by_item_right = Array.new 
    @repeat_no = Array.new(1,"No.0")
	end

	def edit

		#@patent = Patent.find(params[:id])
		@patent = Patent.friendly.find(params[:id])
		@patent_scopy_by_item = @patent.patent_scope.split("<br>")

	end 

	def update

		@patent = Patent.friendly.find(params[:id])
		return_patent_scope(params[:apply_no],params[:new_fetch_no])
		
		if @patent.update_attributes(patent_scope: @result)
		redirect_to @patent
		else 
			puts "error occur"
		end

	end

	def delete
	end

  	def return_patent_scope(apply_key,fetch_key)
		require 'rubygems'
		require 'nokogiri'
		#require 'open-uri'
		#require 'watir-webdriver'
		require 'mechanize'

		agent = Mechanize.new
		page = agent.get("http://210.69.13.40/tipotwoc/tipotwkm")
		#page = agent.get("http://twpat.tipo.gov.tw/tipotwoc/tipotwkm")


		page = agent.page.link_with(:text => "專利檢索").click

		form = agent.page.forms.first

		#設定下拉式選單到正確的選項 value
		form._1_0_n_1 = "n_AN"

		#設定 input box 裡面要查詢的值
		#form._1_0_n_2 = "99106886"
		form._1_0_n_2 = "#{apply_key}"

		#puts apply_key

		#按下查詢的按鈕
		result_page = form.submit(form.button_with(:name => "_IMG_檢索@s"))

		#按下“專利範圍”的連結

		if !(result_page.links_with(:text => "")[3].href.match(/^http:\/\/twpat/) )
			@result = "查無此專利案"
		else
		result_page2 = result_page.links_with(:text => "")[3].click
		page_html = Nokogiri::HTML.parse(result_page2.parser.to_html)
		@result = page_html.xpath("html/body/form/table/tr[2]/td/table/tr/td/table/tr[3]/td/table/tr/td/table/tr[2]/td/table/tr/td[1]/div/table/tr[#{fetch_key}]/td[2]").to_s
      #binding.pry
      if @result == "" 
        new_fetch_key = fetch_key-1
        @result = page_html.xpath("html/body/form/table/tr[2]/td/table/tr/td/table/tr[3]/td/table/tr/td/table/tr[2]/td/table/tr/td[1]/div/table/tr[#{new_fetch_key}]/td[2]").to_s
      else
      end
      
		end


  	end



	private

	def patent_params
    params.require(:patent).permit(:apply_no, :patent_scope)
  end


  def build_tree(id, src)
    child_array = src[:"#{id}"]
  #  @index+=1
    return { name: id } if child_array.empty? 
  #  binding.pry
    #children = child_array
    return { name: id, children: child_array.map { |child_id| build_tree(child_id.to_s, src) } }
  end


end
