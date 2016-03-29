
-- 1 
quad :: [Int] -> [Int]
quad [] = [] 
quad (x:xs) =  [x^2] ++ quad xs

-- 2
addSr :: [[Char]] -> [[Char]]
addSr [] = [] 
addSr (x:xs) = ["Sr. "++x] ++ addSr xs

-- 3 
pegaSpaco :: [Char] -> Int
pegaSpaco [] = 0 
pegaSpaco (x:xs)
                | x == ' ' = 1 + pegaSpaco xs
                | otherwise =  pegaSpaco xs

-- 4 
conta1 :: [Double] -> [Double]
conta1 [] = [] 
conta1 (x:xs) = [(3*x^2 +2/x+1)] ++ conta1 xs

-- 5 
negativos :: [Double] -> [Double]
negativos [] = [] 
negativos (x:xs) 
                | x < 0 = [x] ++ negativos xs
                | otherwise = negativos xs

-- 6
semVogais :: [Char] -> [Char]
semVogais x = filter (\n -> not $ elem n "aeiouAEIOU" ) x 


-- 7
semVogaisRec :: [Char] -> [Char]
semVogaisRec [] = [] 
semVogaisRec (x:xs) 
                  | not $ elem x "aeiouAEIOU" = [x] ++ semVogaisRec xs
                  |otherwise =  semVogaisRec xs


-- 8 
codifica :: [Char] -> [Char]
codifica x = map (\n -> if n == ' ' then ' ' else '-') x

-- essa foi dificil :) 

-- 9 
codificaRec :: [Char] -> [Char]
codificaRec [] = []
codificaRec (x:xs)
               | x == ' ' =  [x] ++ codificaRec xs
               | otherwise =  '-':(codificaRec xs)

-- 10
charFound :: Char -> [Char] -> Bool
charFound _ [] = False
charFound  a (x:xs)
                  | a == x = True 
                  |otherwise = charFound a xs

-- 11 
translate :: [(Double,Double)] -> [(Double,Double)]
translate [] = [] 
translate ((n1,n2):xs) = (n1+2,n2+2):(translate xs)
-- nem sabia que podia por tupla dentro de tupla :) 

-- 12
multiplica :: [Int]-> [Int] -> [Int]
multiplica _ [] = []
multiplica [] _ = []
multiplica (x:xs) (n:ns) = [ x*n ]++ multiplica xs ns 

-- 13 
multiplica2 :: [Int] -> [Int] -> [Int]
multiplica2 x n = zipWith (*) x n 

-- 14 
newFunc :: Int -> [(Int,Int)]
newFunc 0 = []
newFunc x = [(x,x*x)] ++ (newFunc (x-1))

geraTabela :: Int -> [(Int,Int)]
geraTabela x = reverse (newFunc x)

-- ou ou + facil 
  
geraTabela2 :: Int -> [(Int,Int)]
geraTabela2 0 = [] 
geraTabela2 x = geraTabela2 (x-1)++[(x,x*x)]

-- 

