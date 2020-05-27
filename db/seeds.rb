require_relative('../models/student.rb')
require_relative('../models/house.rb')

house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "/logo/Gryf.jpg"
  })
house2 = House.new({
  "name" => "Ravenclaw",
  "logo" => "/logo/Rave.jpg"
  })
house3 = House.new({
  "name" => "Hufflepuff",
  "logo" => "/logo/Huff.jpg"
  })
house4 = House.new({
  "name" => "Slytherin",
  "logo" => "/logo/Slyt.jpg"
  })

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 12
  })

  student2 = Student.new({
    "first_name" => "Ron",
    "second_name" => "Weasely",
    "house" => "Hufflepuff",
    "age" => 12
    })

    student1.save()
    student2.save()
