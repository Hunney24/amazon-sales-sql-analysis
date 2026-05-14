select * from newschema.amazon;
select count(distinct city) 
from newschema.amazon;
select branch,city 
from newschema.amazon
group by branch,city ;
select count(distinct `Product Line`)
from newschema.amazon;
select payment,count(*) as frequency
from newschema.amazon
group by payment
order by frequency desc
limit 1 ;
select `Product line`,sum(total) as total_sales
from newschema.amazon
group by `Product line`
order by total_sales desc
limit 1;
select monthname(`Date`) as month,
sum(total) as monthly_revenue
from newschema.amazon
group by monthname(`Date`)
order by min(`Date`);
select monthname(`Date`) as month,
sum(cogs) as total_cogs
from newschema.amazon
group by monthname(`Date`)
order by (total_cogs) desc
limit 1;
select city,sum(total) as total_sales
from newschema.amazon
group by city
order by total_sales
limit 1;
select `Product Line`,sum(`Tax 5%`) as VAT
from newschema.amazon
group by`Product Line`
order by VAT desc
limit 1;
select `Product Line`, sum(`Total`)as total_sales,
case 
when sum(`Total`)>(select avg(product_sales) from
(select sum(`Total`) as product_sales
from newschema.amazon 
group by`Product Line`) as avg_table)
then 'Good'
else'Bad'
end as sales_status 
from newschema.amazon
group by`Product Line`;
select `Branch`,sum(`Quantity`) as total_products
from newschema.amazon
group by `Branch`
having sum(`Quantity`)>(select avg(total_per_branch) 
from(select sum(`Quantity`)as total_per_branch
from newschema.amazon
group by`Branch`) 
as avg_table) ;
 select `Product Line`,`Gender`, count(1) as frequency
 from newschema.amazon
 group by`Product Line`,`Gender`
 order by`Product Line`,frequency desc;
 --
 select`Product Line`, avg(`Rating`) as avg_rating
 from newschema.amazon
group by `Product Line`;
--
select dayname(`Date`) as weekday,
`Time`, count(*) as sales_count
from newschema.amazon
group by dayname(`Date`),`Time`
order by field(weekday,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
`Time`;
--
select `Customer type`, sum(`Total`) as total_revenue 
from newschema.amazon
group by `Customer type`
order by total_revenue desc
limit 1;
--
select `City`,avg(`Tax 5%`) as avg_VAT
from newschema.amazon
group by `City`
order by avg_VAT desc
limit 1;
--
select `Customer type`, sum(`Tax 5%`) as total_VAT
from newschema.amazon
group by `Customer type`
order by total_VAT desc
limit 1;
--
select count(distinct `Customer type`)
from newschema.amazon;
--
select count(distinct`Payment`) as payment_types
from newschema.amazon;
--
select `Customer type`, count(*) as customer_type_frequency
from newschema.amazon
group by `Customer type`
order by customer_type_frequency desc
limit 1;
--
select `Gender`, count(*) as frequency
from newschema.amazon
group by `Gender`
order by frequency desc
limit 1;
--
select `Customer type`, count(*) as purchase_frequency
from newschema.amazon
group by `Customer type`
order by purchase_frequency desc
limit 1;
--
select `Branch`, `Gender`, count(*) as gender_prospects
from newschema.amazon
group by `Branch`, `Gender`
order by  gender_prospects desc;
--
select `Time`, count(`Rating`) as ratings_count
from newschema.amazon
group by `Time`
order by ratings_count desc
limit 1;
--
select `Time`,`Branch`, max(`Rating`) as max_ratings
from newschema.amazon
group by `Time`,`Branch`
order by max_ratings desc;
--
select dayname(`Date`) as weekday,avg(`Rating`) as avg_rating
from newschema.amazon
group by weekday
order by avg_rating desc
limit 1;
--
select `Branch`,dayname(`Date`) as weekday, avg(`Rating`) as avg_rating
from newschema.amazon
group by`Branch`, dayname(`Date`)
order by `Branch`, avg_rating desc;
--
