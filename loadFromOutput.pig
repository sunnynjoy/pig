loadFromOutput = LOAD '/output/pig/group_by_year_symbol' as (grp:tuple(sym:chararray,year:int) , stock_out:{stock_in:(Stocks:charArray,
Symbol:charArray,date:datetime,Open:float,High:float,Low:float,close:double,Volume:long,Adjclose:float)});

dump loadFromOutput;