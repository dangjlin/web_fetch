class SplitwordsController < ApplicationController
  
  def index
    @keyworda = Keyworda.where.not('keyworda' => nil).order('priority asc')
    @keywordb = Keywordb.where.not('keywordb' => nil).order('priority asc')
  end
  
  def show 
   
  end
  
  
  def new
    @keyworda = Keyworda.new
    @keywordb = Keywordb.new
  end
  
  def create
    @splitword = Splitword.new(splitword_params)
	
    if @splitword.save
			flash[:success] = "查詢成功!寫入資料庫成功!"
      redirect_to splitwords_path 
		else
			render 'new'
		end
    
  end
 
  def edit
  end
  
  def update
  end
  
  def destroy
    @splitword = Splitword.find(params[:id])
    @splitword.destroy
    redirect_to :action => 'index'
   
  end
  
  private
  
  def splitword_params
    params.require(:splitword).permit(:keyworda, :keywordb)
  
  end
  
  
end
