from fastapi import FastAPI, Depends, HTTPException, Query
from typing import List
from app.crud import add_product, get_products_by_category
from app.schemas import ProductCreate, ProductRead

app = FastAPI()

@app.post("/products", response_model=ProductRead)
async def api_add_product(product: ProductCreate):
    prod = await add_product(product)
    if not prod:
        raise HTTPException(status_code=400, detail="Failed to add product")
    return prod

@app.get("/products", response_model=List[ProductRead])
async def api_get_products_by_category(category: str = Query(...)):
    products = await get_products_by_category(category)
    return products
