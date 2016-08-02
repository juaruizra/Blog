class Article < ActiveRecord::Base
  # la Tabla=> sabe la table por el nombre de la clase "Articles"
  # campos=> article.title()=> devuelve el titulo del darticulo
  # escribir metodos
  belongs_to :user
  validates :title, presence: true
  validates :body, :presence => {:message => "Usted debe ingresar un título"}, length: {minimum: 2, maximum: 500, :message => "El título debe tener entre 2 y 500 caracteres"}

  before_save :set_visits_count

  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end
  def set_visits_count
    self.visits_count ||=0
  end

end
