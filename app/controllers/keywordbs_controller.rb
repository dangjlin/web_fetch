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
    @keywordb = Keywordb.find(params[:id])
  end
  
  def update
    @keywordb = Keywordb.find(params[:id])

    if @keywordb.update_attributes(keywordb: params[:keywordb][:keywordb], priority: params[:keywordb][:priority])
    redirect_to splitwords_path
    else 
      puts "error occur"
    end
  end
    
  def destroy
    @keywordb = Keywordb.find(params[:id])
    if  @keywordb.destroy
    redirect_to spiltwords_path
    else
      puts "error occur"
    end
    
  end
  
  private
  
  def keywordb_params
    params.require(:keywordb).permit(:keywordb, :priority)
  
  end
  
end
