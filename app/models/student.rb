class Student < ApplicationRecord
  belongs_to :career
  has_many :participants
  belongs_to :category
  audited

  scope :perteneces, ->(x,y) {find_by_sql("SELECT * FROM students
  where students.id not in (SELECT participants.student_id as id FROM 
  participants INNER JOIN extensions on extensions.id = participants.extension_id
  where extensions.id = #{x} AND participants.id != #{y})")}
  scope :univ_extension, ->(x) {find_by_sql("SELECT * FROM students
  INNER JOIN participants on students.id = participants.student_id 
  INNER JOIN extensions on participants.extension_id = extensions.id
  where participants.student_id = #{x}")}
end
