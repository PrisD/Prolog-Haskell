data Dirigente = UnDirigente { 
    nombre :: String,
    imagenPositiva  :: Float,
    habilidades :: [String],
    cargo :: Cargo,
    partido :: Partido
} deriving (Eq,Show)

type Partido = String
type Alianza = [Partido]

data Cargo = Intendente|Gobernador|Senador|Vicepresidente|Presidente 
    deriving (Eq, Ord, Show)

dirigentes = [UnDirigente "Dirigente1" 30 ["habilidad1", "habilidad2"] Presidente "pro",
             UnDirigente "Dirigente2" 50 ["habilidad3", "habilidad4"] Gobernador "ucr"]


cambiemos = ["pro","ucr","cc"]
frenteDeIzquierda = ["po","pcr"]{- 

El dirigente con mayor cargo actual como presidente
 y cualquiera que tenga más de 20 puntos de imagen positiva como vice. -}

type Formula = (Dirigente,Dirigente) 

{- 
Los modos de construcción política los modelamos como un par de funciones
que devuelven un dirigente de entre una lista de dirigentes 
-}

type Construccion = [Dirigente]->Dirigente

{- 
El armado de la fórmula se puede como dos problemas:
Por un lado un función que hace la busqueda de todos los dirigentes 
de todos los partidos de la alianza,
y por otro lado, una funcion que aplica sobre ellos 
los dos modos de construcción política y permite obtener la fórmula 
-}

armarFormula:: (Construccion,Construccion) -> [Alianza] -> [Dirigente]->   Formula
armarFormula modoConstruccion alianza dirigentes =
    elegirCandidatos  modoConstruccion (dirigentesDe alianza dirigentes)
-- armarFormula modoConstruccion alianza = 
--    elegirCandidatos modoConstruccion . dirigentesDe alianza

elegirCandidatos:: (Construccion,Construccion) -> [Dirigente]  -> Formula
elegirCandidatos (constrPresi,constrVice) dirigentes  =
    (constrPresi dirigentes, constrVice dirigentes)
