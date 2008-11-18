150.times do |n|
  puts "=span-#{n}\n  :width #{n * 10}px\n  :float left\n  :margin-right 0px\n=append-#{n}\n  :padding-right #{n * 10}px\n=prepend-#{n}\n  :padding-left #{n * 10}px"
end