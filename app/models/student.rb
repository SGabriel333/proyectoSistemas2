class Student < ApplicationRecord
  belongs_to :career
  has_many :participants
  audited

  scope :perteneces, ->(x,y) {find_by_sql("SELECT * FROM students
  where students.id not in (SELECT participants.student_id as id FROM 
  participants INNER JOIN extensions on extensions.id = participants.extension_id
  where extensions.id = #{x} AND participants.id != #{y})")}
end
