# encoding: UTF-8

class CardsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @cards = paginate current_user.cards.today.order("updated_at DESC")
  end

  def new
    @card = current_user.cards.build
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  def create
    @card = current_user.cards.build(params[:card])

    if @card.save
      redirect_to cards_path, notice: "단어가 등록되었습니다." 
    else
      render action: "new" 
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(params[:card])
      redirect_to cards_path, notice: "단어가 수정되었습니다." 
    else
      render action: "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    
    if @card.destroy
      redirect_to cards_path, notice: "단어가 삭제되었습니다." 
    else
      redirect_to cards_path, notice: "오류로 인해 단어가 삭제되지 못하였습니다." 
    end
  end
           
  def build
    @card = Card.build(word: params[:word], user_id: current_user.id) 
  rescue Exception => e
    render text: e.message
  end
end
