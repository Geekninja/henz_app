class CurriculumsController < ApplicationController
layout 'layouts/site.html.haml'
  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(params[:curriculum])
    @curriculum.request = request
    if @curriculum.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
