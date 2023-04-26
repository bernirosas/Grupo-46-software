class HomeController < ApplicationController
  def index
  end

  def inicio
    respond_to do |format|
      format.html { render :inicio }
    end
  end
end
