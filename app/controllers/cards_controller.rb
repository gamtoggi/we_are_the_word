# encoding: UTF-8

class CardsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_card, :only => [:edit, :update, :destroy, :level_up] 
  
  def index
    @cards = paginate current_user.cards.today.order("updated_at DESC")
  end

  def edit
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
    if @card.update_attributes(params[:card])
      redirect_to cards_path, notice: "단어가 수정되었습니다." 
    else
      render action: "edit"
    end
  end

  def destroy
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
  
  # PUT /cards/1/level_up
  def level_up
    if @card.level_up!
      redirect_to cards_path, notice: "level up!" 
    else
      redirect_to cards_path, notice: "error.." 
    end
  end
  
  protected
  def find_card
    @card = Card.find(params[:id])
  end
end
