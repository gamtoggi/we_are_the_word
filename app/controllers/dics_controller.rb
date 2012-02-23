class DicsController < ApplicationController    
  # GET /disc/search.json?word=blah
  def search
    render json: { mean: Dic.search(params[:word]) }
  end
end