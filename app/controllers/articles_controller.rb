class ArticlesController < ApplicationController
  #A esta ruta se accede con el verbo
  #GET/articles
  def index
    @articles=Article.all
  end
# -----------------------------------
#GET/articles/:id
  def show
    @article =Article.find(params[:id])
  end
  # -----------------------------------
  #GET/articles/new
    #NEW VA CON CREATE
  def new
    @article= Article.new #se crea un objeto de Articles, queda en memoria más no en la Base de datos (es para el formulario)
  end
  #POST/articles -> lo invoca al enviar formulario (dar clic en submit de new)
  def create
    @article= Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  # -----------------------------------
  # GET /articles/:id/edit
      # ÈDITAR VA CON UPDATE
  def edit
    @article= Article.find(params[:id])
  end

  def update
      @article= Article.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end

  end

# -----------------------------------
  # DELETE  /articles/:id
  def destroy #le mandan del index
    @article= Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
# -----------------------------------
# ASPECTO DE SEGURIDAD, ES LO QUE EL USUARIO PUEDE EDITAR
  def article_params
    params.require(:article).permit(:title,:body)

  end


end
