from pydantic import BaseModel
from typing import Optional

class ProductCreate(BaseModel):
    name: str
    description: Optional[str]
    price: float
    category: str

class ProductRead(ProductCreate):
    id: int
    created_at: str
    class Config:
        orm_mode = True
