# [a..z] => [97..122]
# [A..Z] => [65..90]
require 'pry-byebug'

def caesar_cipher(string, number)
  number = number % 26
  letters = string.split('')
  letters.map! do |letter|
    if letter.ord >= 65 && letter.ord <= 90 || letter.ord >= 97 && letter.ord <= 122
      if letter == letter.upcase
        if letter.ord + number > 90
          (letter.ord + number - 26).chr
        else
          (letter.ord + number).chr
        end
      else
        if letter.ord + number > 122
          (letter.ord + number - 26).chr
        else
          (letter.ord + number).chr
        end
      end
    else
      letter
    end
  end
  letters.join
end

puts "--- INICIO DE PRUEBAS CON LLAMADAS DIRECTAS ---"

puts "\n1. Desplazamiento básico de minúsculas:"
input_str = "abcde"
shift_val = 3
expected_output = "defgh"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n2. Desplazamiento básico de mayúsculas:"
input_str = "FGHIJ"
shift_val = 5
expected_output = "KLMNO"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n3. Wrapping (desbordamiento) en minúsculas:"
input_str = "xyz"
shift_val = 3
expected_output = "abc"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n4. Wrapping (desbordamiento) en mayúsculas:"
input_str = "XYZ"
shift_val = 3
expected_output = "ABC"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n5. Mezcla de mayúsculas, minúsculas, espacios y puntuación:"
input_str = "Hello, World! 123"
shift_val = 7
expected_output = "Olssv, Dvysk! 123"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n6. Desplazamiento de cero (sin cambios):"
input_str = "NoChange"
shift_val = 0
expected_output = "NoChange"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n7. Desplazamiento negativo (hacia atrás):"
input_str = "def"
shift_val = -2
expected_output = "bcd"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n8. Desplazamiento negativo con wrapping:"
input_str = "Abc"
shift_val = -3
expected_output = "Xyz"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n9. Desplazamiento positivo grande (mayor que 26):"
input_str = "Hello"
shift_val = 27 # Equivalente a 1
expected_output = "Ifmmp"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

input_str = "Test"
shift_val = 53 # Equivalente a 1 (53 % 26 = 1)
expected_output = "Uftu"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"


puts "\n10. Desplazamiento negativo grande (menor que -26):"
input_str = "Ifmmp"
shift_val = -27 # Equivalente a -1 (o 25)
expected_output = "Hello"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

input_str = "Uftu"
shift_val = -53 # Equivalente a -1 (o 25)
expected_output = "Test"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n11. Cadena vacía:"
input_str = ""
shift_val = 10
expected_output = ""
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n12. Cadena solo con caracteres no alfabéticos:"
input_str = "123 !@#$%"
shift_val = 5
expected_output = "123 !@#$%"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n13. Caso original del proyecto:"
input_str = "What a string!"
shift_val = 5
expected_output = "Bmfy f xywnsl!"
actual_output = caesar_cipher(input_str, shift_val)
puts "Input: \"#{input_str}\", #{shift_val}"
puts "Expected: \"#{expected_output}\""
puts "Actual:   \"#{actual_output}\""
puts "Match: #{actual_output == expected_output}"

puts "\n--- FIN DE PRUEBAS ---"