namespace Shop;

using { Shop.Users } from './Users';
using { Shop.ProductCart } from './Products';
using { cuid } from '@sap/cds/common';


entity Carts : cuid {

    quantity: Integer;
    price: Decimal (10, 4);
    totalPrice: Decimal (10,2); // calculated field

    User : Association to Users;
    Products : Composition of  many ProductCart on Products.cart = $self;
}
