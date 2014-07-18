class PatentsController < ApplicationController


	def index 
		@patents = Patent.all 
	end 

	def new

		@patent = Patent.new 

	end

	def create
		@patent = Patent.new(patent_params)
		return_patent_scope(patent_params[:apply_no],12)
		@patent.patent_scope = @result

		if @patent.save
			flash[:success] = "查詢成功!寫入資料庫成功!"
			redirect_to @patent
		else
			render 'new'
		end

	end

	def show

	#	@patent = Patent.find(params[:id])
	#   use friendly_id as slugged title 
		@patent = Patent.friendly.find(params[:id])
		@patent_scopy_by_item = @patent.patent_scope.split("<br>")

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
		end


  	end



	private

	def patent_params
    params.require(:patent).permit(:apply_no, :patent_scope)
  	end


end
