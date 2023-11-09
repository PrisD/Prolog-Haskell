import Data.Void (Void)

data Serie = UnaSerie
  { nombre :: String,
    genero :: String,
    duracion :: Int,
    cantTemporadas :: Int,
    calificaciones :: [Int],
    esOriginalDeNetflis :: Bool
  }
  deriving (Eq, Show)

tioGolpetazo =
  UnaSerie
    { nombre = "One punch man",
      genero = "Monito chino",
      duracion = 24,
      cantTemporadas = 1,
      calificaciones = [5],
      esOriginalDeNetflis = False
    }

cosasExtranias =
  UnaSerie
    { nombre = "Stranger things",
      genero = "Misterio",
      duracion = 50,
      cantTemporadas = 2,
      calificaciones = [3, 3],
      esOriginalDeNetflis = True
    }

dbs =
  UnaSerie
    { nombre = "Dragon ball supah",
      genero = "Monito chino",
      duracion = 150,
      cantTemporadas = 5,
      calificaciones = [],
      esOriginalDeNetflis = False
    }

espejoNegro =
  UnaSerie
    { nombre = "Black mirror",
      genero = "Suspenso",
      duracion = 123,
      cantTemporadas = 4,
      calificaciones = [2],
      esOriginalDeNetflis = True
    }

rompiendoMalo =
  UnaSerie
    { nombre = "Breaking Bad",
      genero = "Drama",
      duracion = 200,
      cantTemporadas = 5,
      calificaciones = [],
      esOriginalDeNetflis = False
    }

treceRazonesPorque :: Serie
treceRazonesPorque =
  UnaSerie
    { nombre = "13 reasons why",
      genero = "Drama",
      duracion = 50,
      cantTemporadas = 2,
      calificaciones = [4, 4, 3],
      esOriginalDeNetflis = True
    }

breakingbad =
  UnaSerie
    { nombre = "Breaking Bad",
      genero = "Drama",
      duracion = 200,
      cantTemporadas = 5,
      calificaciones = [],
      esOriginalDeNetflis = False
    }

type Maraton = [Serie]

maraton :: Maraton
maraton = [tioGolpetazo, cosasExtranias, dbs, espejoNegro, rompiendoMalo, treceRazonesPorque]

maraton2 = [tioGolpetazo, treceRazonesPorque]

cantidadMaraton :: Maraton -> Int
cantidadMaraton = length

seriePopular :: Serie -> Bool
seriePopular serie = length (calificaciones serie) >= 3

valeLaPena :: Serie -> Bool
valeLaPena serie = cantTemporadas serie >= 1 && seriePopular serie


valeLaPenaMaraton :: Maraton -> Bool
valeLaPenaMaraton maraton =
  (valeLaPena (head maraton) && valeLaPena (last maraton)) || bbEnMaraton maraton

bbEnMaraton :: Maraton -> Bool
bbEnMaraton = elem breakingbad

repuntaAlFinal :: Maraton -> Bool
repuntaAlFinal maraton = parOImpar maraton (length maraton)

parOImpar :: Maraton -> Int -> Bool
parOImpar maraton cantidad
  | even cantidad = not (valeLaPenaMaraton (take (cantidad `div` 2) maraton)) && valeLaPenaMaraton (drop (cantidad `div` 2) maraton)
  | otherwise = not (valeLaPenaMaraton (take ((cantidad `div` 2) + 1) maraton)) && valeLaPenaMaraton (drop (cantidad `div` 2) maraton)


calificacion :: Serie -> Int
calificacion = promedio . calificaciones

promedio :: [Int] -> Int
promedio lista = sum lista `div` length lista + 1

dispersion :: Serie -> Int
dispersion serie = maximum  (calificaciones serie) - minimum (calificaciones serie )

calificar :: Serie -> Int -> Serie
calificar serie calificacion = serie {calificaciones = calificaciones serie ++ [calificacion]}

hypearSerie :: Serie -> Serie
hypearSerie serie
  | 1 `elem` calificaciones serie = serie
  | otherwise = serie {calificaciones = hypear (calificaciones serie)}

hypear :: [Int] -> [Int]
hypear [] = []
hypear [x] = [min 5 (x + 2)]
hypear (x : xs) = min 5 (x + 2) :  drop 1 xs ++ [min 5 (last xs + 2)]

{- Obtener todas las series que sean de monitos chinos -}

seriesMonitosChinos :: [Serie] -> [Serie]
seriesMonitosChinos = filter ((== "Monito chino") . genero)

seriesNetflisValeLaPena :: [Serie] -> [Serie]
seriesNetflisValeLaPena = filter (\serie -> esOriginalDeNetflis serie && valeLaPena serie)

seriesConNTemporadas :: [Serie] -> Int -> [Serie]
seriesConNTemporadas series n = filter ((== n) . cantTemporadas) series
