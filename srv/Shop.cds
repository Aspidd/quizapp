

using  { Shop } from '../db/Schema';

service ShopService {
    entity Cart as projection on Shop.Carts;
    entity Order as projection on Shop.Orders;
    entity User as projection on Shop.Users;
    entity Category as projection on Shop.Categories;
    entity Product as projection on Shop.Products;

    action Login( email: String(100), password: String(200));
}