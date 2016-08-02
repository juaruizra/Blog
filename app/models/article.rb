class Article < ActiveRecord::Base
  # la Tabla=> sabe la table por el nombre de la clase "Articles"
  # campos=> article.title()=> devuelve el titulo del darticulo
  # escribir metodos

  validates :title, presence: true
  validates :body, :presence => {:message => "Usted debe ingresar un título"}, length: {minimum: 2, maximum: 500, :message => "El título debe tener entre 2 y 500 caracteres"}
end
