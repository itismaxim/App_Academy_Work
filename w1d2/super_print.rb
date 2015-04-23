def super_print(string, options={})
  defaults = {:times => 1,:upcase => false, :reverse => false}

  options = defaults.merge(options)
  result = string
  result.upcase! if options[:upcase]
  result.reverse! if options[:reverse]
  options[:times].times { puts result }
  nil
end

super_print("Hello")                                    #=> "Hello"
puts
super_print("Hello", :times => 3)                       #=> "Hello" 3x
puts
super_print("Hello", :upcase => true)                   #=> "HELLO"
puts
super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
