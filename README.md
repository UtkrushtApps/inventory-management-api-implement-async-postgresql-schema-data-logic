# Inventory Management API – PostgreSQL Schema & Logic Implementation

## Task Overview
ShopBridge is expanding its inventory management system, built on FastAPI. While API routes to add and list products are already present, the core database schema and all persistence logic are missing. The business requires robust storage and retrieval for products categorized by type, plus efficient listing by category as the inventory grows. Your skill in crafting a good PostgreSQL design and integrating it asynchronously is central to business scalability and reliability.

## Guidance
- Implement your schema in `schema.sql` and relevant SQLAlchemy models in `app/models.py`.
- Write async database logic in `app/database.py` and `app/crud.py`. Do not alter main API route files.
- Use `run.sh` to build containers, set up the PostgreSQL DB, and start the API.

## Objectives
- Design and implement a normalized PostgreSQL schema for products with required fields (name, description, price, category, created_at) and appropriate constraints (primary key, not-null, unique, indexing). Include a structure for efficient category queries.
- Add basic seed data for testing the API once deployed.
- Develop SQLAlchemy models and async-compatible logic for adding products and fetching them by category.
- Ensure all DB logic is non-blocking (async), follows transaction best practices, and leverages proper indexing for product retrieval.
- Do not modify any API routers or endpoints; focus only on DB schema and data-access layer integration.

## How to Verify
- Use `run.sh` to build and launch the stack; confirm API is live at http://localhost:8000/docs.
- Using the API docs or curl, add new product records and verify insertion.
- Fetch products by category via API and confirm correct, ordered listings.
- Check that all database tables, constraints, and indexes exist as designed by connecting via a PostgreSQL client.
- Validate that all operations are performed asynchronously (non-blocking) by reviewing code and testing with concurrent API calls.