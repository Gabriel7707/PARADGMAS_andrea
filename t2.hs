--1
somaQuad :: Int -> Int -> Int
somaQuad x y = x^2 + y^2

--2
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads x y = ( head(x) == head(y) )

--3
addSr :: [[Char]] -> [[Char]]
addSr x = map ("Sr. "++ ) x 

--4 
contaSpacos :: [Char] -> Int
contaSpacos x = length ( filter (==' ') x )

--5 
calculo5 :: [Int] -> [Int]
calculo5 x = map (\n -> (3*n^2 + 2 + n +1) ) x

--6 
procuraNeg :: [Int] -> [Int]
procuraNeg x = filter (< 0) x

--7 
ent1cem :: [Int]->[Int]
ent1cem x = filter (\n -> n<101 && n>0) x

--8
anoNas :: [Int] -> [Int]
anoNas x = map (\n -> 2016 - n ) x  

--9
pares :: [Int] -> [Int]
pares x = filter (\n -> mod n 2 == 0 ) x

--10 
harFound :: Char -> String -> Bool
harFound x y  = if ( [] == filter (== True )( map (\n -> x == n ) y )) then False else True

-- aposto q tem solução bem mais simples :P

--11 
------- takeWhile (< 5) [1,2,3,4,5] 
------- [1,2,3,4]
------- takeWhile (/=' ') "Fulana de Tal"
------- "Fulana"
------- coloca os itens iniciais de uma lista em uma nova lista ate o ponto de parada *_*

--12
termA :: [[Char]] -> [[Char]]
termA x = filter (\n -> last n == 'a') x 