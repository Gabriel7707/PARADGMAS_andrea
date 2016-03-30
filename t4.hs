import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)

maxWidth :: Float
maxWidth = 1000

maxHeight :: Float
maxHeight = 100

-- Gera um unico retangulo SVG 
-- a partir de coordenadas+dimensoes e de uma string com atributos de estilo
writeRect :: (Rect,String) -> String 
writeRect (((x,y),w,h),style) = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- Gera codigo-fonte de arquivo SVG 
-- concatenando uma lista de retangulos e seus atributos de estilo
writeAllRects :: Float -> Float -> [(Rect,String)] -> String 
writeAllRects w h rs = 
  printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 
      ++ (concat (map writeRect rs)) ++ "</svg>"

-- TO-DO
-- Esta funcao deve gerar n retangulos de largura w e altura h.
-- Use recursao para implementa-la.
---                                      Q1            GERA LISTA DE ERTANGULOS + 60 PRA NAO FICAREM GRUDADOS
geraR :: Float -> Float -> Float -> Float -> [Rect]
geraR 0 _ _ _ = []
geraR n pos  w h =  [((pos ,0.0), w, h)] ++ geraR (n-1) (pos+60) w h


genRects :: Float -> Float -> Float -> [Rect]
genRects n w h = geraR n 0 w h
                                     -- Lista com somente um retangulo. 

-- Combina (zip) a lista de estilos com a lista de retangulos, aplicando os estilos ciclicamente.
-- Se houverem mais retangulos que cores, havera retangulos com cores repetidas.
-- Se houverem menos retangulos que cores, algumas cores nao serao usadas.


--                                       Q2 ----- MEU ZIP ... SE A LISTA DE COR EH MENOR QUE A DE RETANGULO , 
--                                                REPETE A ULTIMA COR CATEH ACABAR A LISTA DE RETANGULOS 
myZip ::  [String] -> [Rect] -> [(Rect , String)]
myZip _ [] = [] 
myZip (n:ns) (x:xs)
                | ns == [] =  (x , n ):myZip [n] xs 
                | otherwise = (x , n ):myZip ns xs

applyStyles :: [String] -> [Rect] -> [(Rect,String)]
applyStyles styles rects = myZip styles rects 

--                                      Q3 ---- GERA UMA LISTA DE CORES DIFERENTES NAO ALEATÓRIAS DE TAMANHO N COMO PARAMETRO 
geraLisCores :: Int -> [String]
geraLisCores 0 = [] 
geraLisCores x =  [printf "fill:rgb(%d,%d,%d)"  (x^x-30) (x^x+1) (x^x*3)  ] ++ geraLisCores ( x-1)



      
{--
     O codigo abaixo gera um arquivo "mycolors.svg".
     A geracao usa 2 listas: uma com coordenadas dos retangulos e outra com as cores.
     Essas 2 listas sao combinadas numa lista resultante, que e' escrita no arquivo.
 --}


main :: IO ()
main = do
  let
    rects = genRects 10 50 50                          -- Deve gerar 10 retangulos de 50x50
    styles = geraLisCores 10                        -- Estilo: vermelho e verde
    rectstyles = applyStyles styles rects
  writeFile "mycolors.svg" (writeAllRects maxWidth maxHeight rectstyles)
