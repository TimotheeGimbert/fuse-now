class Event < ApplicationRecord

  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 140 }

  validates :start_date, 
    presence: true
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date <= Date.current
      errors.add(:start_date, "La date de début de l'évênement doit se situer dans le futur !")
    end
  end

  validates :duration, 
    presence: true, 
    numericality: { only_integer: true, greater_than: 0 }
  validate :duration_should_be_multiple_of_5

  def duration_should_be_multiple_of_5
    if duration % 5 != 0
      errors.add(:duration, "Un évênement doit avoir une durée multiple de 5 minutes !")
    end
  end

  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than: 1, less_than: 1000 }

  validates :description,
    presence: true,
    length: { minimum: 5, maximum: 140 }

  validates :location,
    presence: true

end
