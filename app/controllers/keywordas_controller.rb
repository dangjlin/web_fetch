class KeywordasController < ApplicationController
   
  def index
    @keywordas = Keyworda.all
  end
  
  def show 

  end
  
  
  def new
    @keyworda = Keyworda.new
  end
  
  def create
    @keyworda = Keyworda.new(keyworda_params)
	
    if @keyworda.save
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
    @keyworda = Keyworda.find(params[:id])
    @keyworda.destroy
    redirect_to spirtwords_path
   
  end
  
  private
  
  def keyworda_params
    params.require(:keyworda).permit(:keyworda)
  
  end
  
  
  
end