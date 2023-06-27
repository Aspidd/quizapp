namespace Shop;

using { Shop.Carts } from './Carts';
using { Shop.Orders } from './Orders';
using { cuid } from '@sap/cds/common';


entity Users : cuid {
    surname: String(100);
    email: String(100) not null;
    name    : String(100);
    password: String(200) not null;
    isAdmin: Boolean;
    isGuest: Boolean;
    isUser: Boolean;

    Cart : Association to one Carts;
    Orders : Association to many Orders on Orders.User = $self;

}

