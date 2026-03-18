from sqlmodel import SQLModel, Field, Relationship
from typing import Optional, TYPE_CHECKING
from datetime import datetime
from uuid import UUID, uuid4
from schemas.plant import PlantType, PlantStage

if TYPE_CHECKING:
    from models.user import User

class PlantState(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    plant_id: UUID = Field(foreign_key="plant.id")
    plant_state: PlantStage = PlantStage.SEED
    health: int = 100
    sun: int = 0
    water: int = 0
    prune: int = 0
    is_dead: bool = False
    last_interaction: datetime = Field(default_factory=datetime.now)
    sources_next_state: str = Field(
        default='{"sun": 50, "water": 30, "prune": 2}'
    )
    plant: Optional["Plant"] = Relationship(back_populates="state")

class Plant(SQLModel, table=True):
    id: UUID = Field(default_factory=uuid4, primary_key=True)
    user_id: UUID = Field(foreign_key="user.id")
    plant_name: str
    plant_type: PlantType
    user: Optional["User"] = Relationship(back_populates="plants")
    state: Optional[PlantState] = Relationship(back_populates="plant")