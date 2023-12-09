rawdata <- read_csv("./data/complete.csv", 
    col_types = cols(.default="n", day = col_date(format = "%Y-%m-%d")))

rawdata <- rawdata[1:1200,] # excludes rows after gas price cap !!!

# sets NA gas prices to zero
rawdata['gas_price'][is.na( rawdata['gas_price'])] <- 0

# Removes weather related columns with NA values. 
last_day = nrow(rawdata)
data = rawdata[1:last_day , colSums(is.na(rawdata))==0]

# Normalize data, min_price and max_price will be used to denormalize prices later
min_price = getMin(data[2])
max_price = getMax(data[2])
data[2:143] = sapply(data[2:143], normalize)


