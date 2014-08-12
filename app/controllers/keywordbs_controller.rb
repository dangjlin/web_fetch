class KeywordbsController < ApplicationController
   
  def index
    @keywordbs = Keywordb.all
  end
  
  def show 

  end
  
  
  def new
    @keywordb = Keywordb.new
  end
  
  def create
    @keywordb = Keywordb.new(keywordb_params)
	
    if @keywordb.save
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
    @keywordb = Keywordb.find(params[:id])
    @keywordb.destroy
    redirect_to spirtwords_path
   
  end
  
  private
  
  def keywordb_params
    params.require(:keywordb).permit(:keywordb)
  
  end
  
end
