
--Load nyse_daily_file through pig
nydata = load '$input' as(name:chararray, symbol:chararray, date:datetime, start:float, high:float, low:float, medium:f
loat, val:long, sellingprice:float);

--filter based on year
filter_by_year = FILTER nydata by GetYear(date)==2009;

--groups based on symbol
group_by_symbol = GROUP filter_by_year by symbol;

--aggregate based on MAX
max_val = foreach group_by_symbol generate group, ROUND(MAX(filter_by_year.val)) as maxval;

--Descending Order 
order_val_desc = ORDER max_val BY maxval DESC;

--Get top 10 records
limit_val = LIMIT order_val_desc 10;

--store in any location
STORE limit_val INTO '$output';