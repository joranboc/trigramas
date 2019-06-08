
#Se crea un Hash para guardar los trigramas
trigramas = Hash.new
#Se lee el texto y se elimina los saltos de linea
archivoTexto=File.open('text.txt').read
archivoTexto = archivoTexto.gsub("\n"," ") 
#Se mapean los ngramas al hashmap
archivoTexto.each_line  do |linea|
    temporalArray = linea.strip.split(' ').each_cons(3).to_a
    temporalArray.each { |ngrama| 
        if(trigramas["#{ngrama[0]+" "+ngrama[1]}"])
            trigramas["#{ngrama[0]+" "+ngrama[1]}"].push(ngrama[2])
        else            
            trigramas["#{ngrama[0]+" "++ngrama[1]}"] = [ngrama[2]]
        end        
     }    
end
#Se reciben las palabras
puts "Ingrese las dos palabras"
nuevaLlave = gets.to_s.strip
textoGenerado = nuevaLlave
#Se genera el nuevo texto
while trigramas[nuevaLlave] do    
    if trigramas[nuevaLlave].size == 1
        n = trigramas[nuevaLlave].join()
        textoGenerado = textoGenerado + " "+ n
        nuevaLlave = nuevaLlave.split.last + " " + n    
    else
        n = trigramas[nuevaLlave][rand(trigramas[nuevaLlave].size)]
        nuevaLlave = nuevaLlave.split.last+" "+ n 
        textoGenerado = textoGenerado + " " + n
    end    
end
puts textoGenerado
