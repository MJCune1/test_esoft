
def matrix_pro n,m

  # validating n & m being greater than 2 
  return if n <= 2 || m <= 2

  # defining array with random unique values
  limit = n * m  
  array = []
  array[0] = 1
  y = 1
  greater_than_average = 0
  while y < limit do 
    found = 1
    x = 0 
    nuevo = rand(limit)+1
    while x < y && found == 1 do
      if array[x] == nuevo
        found = 0 
      end
      x = x + 1
    end
    if found == 1 
      array[y] = nuevo
      y = y + 1
    end 
  end
  
  # defining matrix and pushing ramdom unique values from array
  array_sum_cols = Array.new(m,0)
  matrix = []
  count = 0
  sum = 0 
  items = m % 2 == 0 ? m / 2 : (m/2)+1
  for x in 1..n
    matrix[x] = []
    for y in 1..m
      matrix[x][y] = array[count]
      array_sum_cols[y-1] += array[count]
      #after last row sum even cols's value
      if x - n == 0 && (y-1) % 2 == 0 
        sum += array_sum_cols[y-1]
      end
      count += 1
      #**uncomment  below if you want to print the matrix** 
      # print "| #{matrix[x][y]} |"
    end
    # puts
  end 

  for z in 0..m-1
    if array_sum_cols[z] > sum/items.to_f
      greater_than_average += 1
    end
  end
   
  # **uncomment below if you want to check variable's outputs**
  # puts 
  # puts "sumatoria por columna:"
  # puts array_sum_cols
  # puts "promedio de sumatoria de columnas pares: #{sum/items.to_f}"
  # puts "numero de columnas pares (empezando desde columna 0): #{items}"
  # puts "numero columna(s) mayor(es) al promedio de sumatorias de las columnas pares: #{greater_than_average}"

  return greater_than_average
end

# **uncomment below if you want to print what is returned you can change arguments**
# puts matrix_pro 3,3