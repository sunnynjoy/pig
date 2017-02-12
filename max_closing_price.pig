--Load data

yahoodata = load '/user/sunnyghosh268700/datasets/table.csv' using org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE
', 'UNIX', 'SKIP_INPUT_HEADER') as(Stocks:charArray,Symbol:charArray,date_f:datetime,Open:float,High:float,Low:float,close:double,Volume:long,Adjclose:float)

--filter by date

filter_by_year = Filter yahoodata By GetYear(date_f) == 2016

-- group by

group_by_symbol = Group filter_by_year By symbol;

-- aggregate
close_by_symbol = Foreach group_by_symbol Generate group, filter_by_year.close;

-- max function

max_close_by_symbol = FOREACH close_by_symbol Generate group, MAX(filter_by_year.close);

-- limit records

limit10 = Limit max_close_by_symbol 10;

-- dump

dump limit10;

--store

STORE max_close_by_symbol INTO 'output/pig/max_closing_price';