namespace Shop;

using { Shop.Orders } from './Orders';
using { Shop.Carts } from './Carts';
using { cuid } from '@sap/cds/common';



entity Categories : cuid {
    name : String(100);
    Products : Composition of many ProductCategory on Products.category = $self;
}

entity Products : cuid {
    product_name   : String (256) not null;
    description     : String(256);
    price           : String(100);
    quantity : Integer;
    product_img : String(200);


    Categories : Composition of many ProductCategory on Categories.product = $self;
    Carts : Composition of many ProductCart on Carts.product = $self;
    Orders : Composition of many ProductOrder on Orders.product = $self;
}

entity ProductCategory {
    key category : Association to Categories;
    key product  : Association to Products;
}

entity ProductCart {
    key product : Association to Products;
    key cart: Association to Carts;
}

entity ProductOrder {
    key product : Association to Products;
    key order : Association to Orders;
}



