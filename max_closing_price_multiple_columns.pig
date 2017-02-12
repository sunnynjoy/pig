-- load
yahoodata = load '/user/sunnyghosh268700/datasets/table.csv' using org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') as(Stocks:charArray,Symbol:charArray,date_f:datetime,Open:float,High:float,Low:float,close:double,Volume:long,Adjclose:float);

-- group by more than 1 columns
group_by_symbol_and_year = Group yahoodata By (Symbol,GetYear(date_f));

--max
max_closing_price = Foreach group_by_symbol_and_year Generate group, MAX(yahoodata.close);

--store the results

STORE max_closing_price INTO 'output/pig/max_closing_price_year_and_symbol';
