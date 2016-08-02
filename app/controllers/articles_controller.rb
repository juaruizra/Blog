class ArticlesController < ApplicationController
  # before_action :validate_user, except: [:show,:index]
  before_action :authenticate_user!, except: [:show,:index] #only: [:create,:new]
  before_action :set_article, except: [:new,:index, :create]

  #A esta ruta se accede con el verbo
  #GET/articles
  def index
    @articles=Article.all
  end
# -----------------------------------
#GET/articles/:id
  def show
    # @article =Article.find(params[:id])  #codigo igual
    @article.update_visits_count
  end
  # -----------------------------------
  #GET/articles/new
    #NEW VA CON CREATE
  def new
    @article= Article.new #se crea un objeto de Articles, queda en memoria más no en la Base de datos (es para el formulario)
  end
  #POST/articles -> lo invoca al enviar formulario (dar clic en submit de new)
  def create
    @article= current_user.article.new(article_params)
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
    # @article= Article.find(params[:id])  #codigo igual
  end

  def update
      # @article= Article.find(params[:id])  #codigo igual
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end

  end

# -----------------------------------
  # DELETE  /articles/:id
  def destroy #le mandan del index
    # @article= Article.find(params[:id]) #codigo igual
    @article.destroy
    redirect_to articles_path
  end
# -----------------------------------

# private
# def validate_user
#   redirect_to new_user_session_path, notice: "Hola,registrate"
# end
private
def set_article
  @article =Article.find(params[:id])
end
# ASPECTO DE SEGURIDAD, ES LO QUE EL USUARIO PUEDE EDITAR
private
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
