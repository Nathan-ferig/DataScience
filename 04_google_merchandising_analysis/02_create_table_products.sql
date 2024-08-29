create table google_merchandising.products (
	fullVisitorId text null,
	hitNumber integer null,	
	isClick	boolean null,
	isImpression boolean null,	
	localProductPrice numeric null,
	localProductRevenue	numeric null,
	productBrand text null,
	productCouponCode text null,
	productListName	text null,
	productListPosition	integer null,
	productPrice numeric null,
	productQuantity	integer null,
	productRevenue numeric null,
	productSKU text null,
	productVariant text null,
	v2ProductCategory text null,
	v2ProductName text null,
	visitId text null
);

-- Copy data from .csv file to the table created above
copy google_merchandising.products
from 'path\products.csv'
with csv header;

-- Preview table
select * from google_merchandising.products
limit 10;