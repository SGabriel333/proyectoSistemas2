class Participant < ApplicationRecord
  belongs_to :student
  belongs_to :student_type
  belongs_to :extension
  before_update :actualizar
  after_save :crear
  after_destroy :eliminar
  def actualizar
    self.student.hours += self.hours - Participant.find(self.id).hours
  	self.student.save
  end
  def eliminar
    self.student.hours -= self.hours
    self.student.save
  end
  def crear
    self.student.hours += self.hours
    self.student.save
  end
end
