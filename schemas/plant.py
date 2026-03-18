from pydantic import BaseModel
from enum import Enum
from datetime import datetime
from uuid import UUID

# Tipo de plantas dados por la tabla de tipos (provisionales)
class PlantType(str, Enum):
    hidro = "hidro"
    solar = "solar"
    xerofito = "xerofito"
    montaña = "montaña"
    Templado = "templado"

# State de la planta
class PlantStage(str, Enum):
    seed = "seed"
    bush = "bush"
    tree = "tree"
    ent = "ent"

# Recursos para que la planta logre cambiar de estado
class SourcesNextState(BaseModel):
    water: int
    sun: int
    prune: int

# PlantBase      → campos comunes (los que siempre existen)
# PlantCreate    → lo que Flutter manda al crear (hereda Base)
# PlantResponse  → lo que el servidor devuelve (hereda Base + agrega id)

# Modelo base para el estado de la planta
class PlantStateBase(BaseModel):
    plant_state: PlantStage = PlantStage.seed
    health: int
    sun: int
    water: int
    prune: int
    is_dead: bool
    last_interaction: datetime 
    sources_next_state: SourcesNextState

# Modelo para la respuesta del estado de la planta
class PlantStateResponse(PlantStateBase):
    id: int
    plant_id: UUID

    class Config:
        from_attributes = True

# Modelo base para la planta
class PlantBase (BaseModel):
    plant_name: str
    plant_type: PlantType

class PlantCreate(PlantBase):
    pass

class PlantResponse(PlantBase):
    id: UUID
    state:PlantStateResponse

    class Config:
        from_attributes = True