class CurriculumsController < ApplicationController
layout 'layouts/site.html.haml'
  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(params[:curriculum])
    @curriculum.request = request
    if @curriculum.deliver
      flash.now[:notice] = 'Obrigado por enviar seu curriculum, retornaremos o contato em breve.'
    else
      flash.now[:error] = 'A mensagem não pode ser enviada, tente mais tarde novamente.'
      render :new
    end
  end
end
