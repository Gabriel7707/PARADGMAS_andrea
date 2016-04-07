-- 1 

addSuffix :: String -> [String] -> [String]
addSuffix x yL = [y++x | y <- yL ]

-- 2 

countShorts :: [String] -> Int
countShorts [] = 0 
countShorts (x:xs)
                   | length x < 5 = 1 + countShorts xs
                   | otherwise = countShorts xs 

-- 3

count :: [String] -> Int
count xl = length [ x | x <- xl, (length x ) < 5 ]

-- 4

ciclo :: Int -> [Int] -> [Int]
ciclo 0 _ = []
ciclo x yl = yl ++ ciclo (x-1) yl

-- 5 

numera :: [String] -> [(Int,String)] 
numera x = numAux x 1

numAux :: [String] -> Int -> [(Int,String)]  
numAux [] _ = []
numAux (x:xs) n = (n,x):numAux xs (n+1)

-- 6 
{-- 



 1) ele forma um tupla com as listas x e y .. { [ (x,y) | } com as 
    combinações que satisfazem as seguintes condiçoes ..
    1 condição : se x for um numero par { x <- [1..5], even x, } , y vai ser uma lista x ate 6 { y <- [(x + 1)..6], }
    para cada elemento par da lista x (ja que eh de forma distributiva) ... 
    2 condição : se o elemento da lista y for ímpar .. 
    adiciona o numero par da lista x e o elemento impar da lista y na tupla e pula pro proximo elemento x ... 
    assim formando uma lista de tuplas com x pares e y impares maiores q x .. 
 
 2) forma uma nova lista contatenando { [ a++b | } os elementos das 
    duas listas { | a <- ["lazy","big"], b <- ["frog", "dog"]] } de forma distributiva .

 3) primeiro A eh todos os elementos da lista { | a <- "paralelepipedo", }
    que dao True na condição { , not (elem a "aeiou")] } , se a for um caractere diferente de "aeiou" 
    ele cria uma lista com 2 elementos { [ [a,'-'] | } ...  no final disso cria-se uma lista de listas ..
    [[a,'-'],[a,'-'],[a,'-']..] .. dai a função concat tem como objetivo juntar todas essas listas 
    em uma unica lista: concat [[a,'-'],[a,'-'],[a,'-']..] = [a,'-',a,'-',a,'-'..]  ... e eh isso ai :)   


    Esse foi o mais díficil entre todos os exercícios ateh agora ... 
    explicar eh dificil demais .. tenq ter talento .. :)

--} 

-- 7
 -- pelo que eu entendi (google tradutor :] ) eh pra fazer uma função equivalente a [ (x,y) | x <- xs, y <- ys ] , sem list Comp.

pairWithAll :: [a] -> [b] -> [(a,b)]
pairWithAll [] _ = []
pairWithAll (x:xs) y = pairAux x y ++ pairWithAll xs y

pairAux :: a -> [b] -> [(a,b)]
pairAux _ [] = []
pairAux x (y:ys) = (x,y):pairAux x ys


-- 8 
    
genRects :: Int -> (Int,Int) -> [(Float,Float,Float,Float)]
genRects n (x,y) =  genAux n y x

genAux :: Int -> Int -> Int -> [(Float,Float,Float,Float)]
genAux 0 _ _ = [] 
genAux n posY x = [( fromIntegral posY , fromIntegral x , 5.5 , 5.5 )]++ genAux (n-1) (posY+6) x

-- 9 

criaListA :: [(a,b)] -> [a]
criaListA [] = [] 
criaListA ((aa,bb):xs) = [aa]++criaListA xs

criaListB :: [(a,b)] -> [b]
criaListB [] = [] 
criaListB ((aa,bb):xs) = [bb]++criaListB xs


listToTupla :: [(a,b)] -> ([a],[b])
listToTupla x = (criaListA x, criaListB x)


-- 10 

criaListAA :: [(a,b)] -> [a]
criaListAA xab = [a | (a,b) <- xab]

criaListBB :: [(a,b)] -> [b]
criaListBB xab = [b | (a,b) <- xab]

listToTuplaa :: [(a,b)] -> ([a],[b])
listToTuplaa x = (criaListAA x, criaListBB x) 

-- 11 
 

-- lttAlta :: [(a,b)] -> ([a],[b])
-- lttAlta x = 



-- 12 --























