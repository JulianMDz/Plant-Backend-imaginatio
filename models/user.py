from sqlmodel import SQLModel, Field, Relationship
from typing import Optional, List
from uuid import UUID, uuid4
from datetime import datetime
from models.plant import Plant

class Resource(SQLModel, table=True):
    id: Optional[int]= Field(default=None, primary_key=True)
    user_id: UUID = Field(foreign_key="user.id")
    sun_amount: int = 0
    water_amount: int = 0  
    prune_amount: int = 0
    last_sun_collected: Optional[datetime] = None
    last_water_collected: Optional[datetime] = None 
    last_prune_collected: Optional[datetime] = None
    user: Optional["User"] = Relationship(back_populates="resources")

class User(SQLModel, table=True):
    id: UUID = Field(default_factory=uuid4, primary_key=True)
    username: str
    email: str
    hashed_password: str
    plants: List[Plant] = Relationship(back_populates="user")
    resources: Optional[Resource] = Relationship(back_populates="user")