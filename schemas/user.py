from pydantic import BaseModel, EmailStr
from schemas.plant import PlantResponse

#Registro de usuaruio
class UserCreate(BaseModel):
    username: str
    email: EmailStr
    password: str

# login de usuario
class UserLogin(BaseModel):
    email: EmailStr
    password: str

#respuesta del servidor 
class UserRespose(BaseModel):
    id: int
    username: str
    email: EmailStr
    plants: list[PlantResponse] = []

    class config:
        from_atributes = True

#toquen JWT que devuelve el Login

class Token(BaseModel):
    access_token: str
    token_type: str = "bearer"
