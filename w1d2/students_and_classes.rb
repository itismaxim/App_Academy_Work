class Student
  attr_reader :courses, :first_name, :last_name
  
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def enroll(new_course)
    unless self.courses.any? {|course| course.conflicts_with?(new_course)}
      new_course.students << self
      courses << new_course
     end
  end
  
  def course_load
    result = {}
    result.default = 0    
    courses.each do |course|
      current_credits = result[course.department]
      result[course.department] = current_credits + course.credits
    end
    results
  end
  
end

class Course
  attr_reader :name, :department, :credits, :days, :time, :students
  
  def initialize (name, department, credits, days, time)
    @name = name                  # string
    @department = department      # string
    @credits = credits            # int
    @days = days                    # array of days symbols (:M, :Tu, :W, :Th, :F)
    @time = time                  # int 1 to 8
    @students = []
  end
  
  def add_student (student)
    student.enroll(self)
  end
  
  def conflicts_with?(second_course)
    return false if self.time != second_course.time
    
    days.any? do |days|
      second_course.days.include?(days)
    end
    #The Old method only account for one time symbol, instead of an array of them.
    #return true if ((self.days == second_course.days) && (self.time == second_course.time))
    #return false
   end
end



lloyd = Student.new("Lloyd", "Smithers")
clair = Student.new("Clair", "Avoyante")
urist = Student.new("Urist", "McLearny")

math = Course.new("Calc A", "Math", 4, [:M], 1)
english = Course.new("Classics", "English", 4, [:F], 1)
english2 = Course.new("Writing", "English", 4, [:M], 2)

#math.add_student(lloyd)
#math.add_student(clair)
math.add_student(urist)
#math.add_student(clair)
english.add_student(urist)
english2.add_student(urist)
#p math
p math.students
p english.students
p english2.students

urist.course_load
hash = {"rabbit" => "bunny"}
puts hash