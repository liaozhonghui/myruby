puts "Hello, World!"
"Hello, Ruby.".index("Ruby.")
10.times {puts "Liao. "}
10.times { |i| puts "This is sentence number #{i + 1}"}

RAMD_NUM = 8
while ((x = gets())) 
    if ( (x <=> RAMD_NUM) == 1) 
        puts "large"
    elsif  (x <=> RAMD_NUM) == 0
        puts "right."
    else 
        puts "small."
    end
end