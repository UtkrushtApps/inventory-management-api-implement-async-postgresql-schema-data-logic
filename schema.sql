-- PostgreSQL schema for ShopBridge Inventory (Edit as needed)
drop table if exists products cascade;
create table products (
    id serial primary key,
    name varchar(100) not null,
    description text,
    price numeric(10,2) not null check (price >= 0),
    category varchar(50) not null,
    created_at timestamptz default now()
);
-- Example index for efficient category queries
create index idx_products_category on products(category);
-- Seed sample data
insert into products (name, description, price, category) values
 ('Red T-shirt', 'Cotton, Medium', 14.99, 'Apparel'),
 ('Bluetooth Speaker', 'Portable, Waterproof', 45.50, 'Electronics');
