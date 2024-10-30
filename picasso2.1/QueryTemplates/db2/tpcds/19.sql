select 	i_brand_id as brand_id,
	i_brand as brand,
	i_manufact_id,
	i_manufact,
 	sum(ss_ext_sales_price) as ext_price
 from 	date_dim,
	store_sales,
	item,
	customer,
	customer_address,store
 where d_date_sk = ss_sold_date_sk
   and ss_item_sk = i_item_sk
   and d_moy=12
   and d_year=1999
   and ss_customer_sk = c_customer_sk 
   and c_current_addr_sk = ca_address_sk
   and substring(ca_zip,1,5) <> substring(s_zip,1,5) 
   and ss_store_sk = s_store_sk 
   and ss_list_price :varies
   and i_current_price :varies
 group by i_brand, i_brand_id,i_manufact_id, i_manufact
 order by ext_price desc, i_brand, i_brand_id,i_manufact_id, i_manufact;

