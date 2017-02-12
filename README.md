# Pig Script

~~~~
We can run below command without getting into pig shell


pig -param input=inputfile -param output=outputfolder max_val_nyse_stock_file.pig


~~~~

# Ex:-

~~~~
pig -param input=/data/NYSE_daily_File -param output=output/pig/max_val_paramter_script max_val_nyse_stock_file.pig

~~~~

# We can execute the pig script with out hdfs, but we must be sure that the dataset exists in the local file system.

~~~~

pig -x local -param input=local-file-system-location -param output=output-folder max_val_nyse_stock_file.pig

~~~~