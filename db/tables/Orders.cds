namespace Shop;

using { Shop.ProductOrder } from './Products';
using { Shop.Users } from './Users';
using { cuid } from '@sap/cds/common';


entity Orders : cuid {
    quantity: Integer;
    price: Decimal (10, 4);
    totalPrice: Decimal (10,2); // calculated field

    User : Association to Users;
    Products : Composition of many ProductOrder on Products.order = $self;
}