## NOTE: always leave space before and after <-, -, +, * and /
## At the very least use the automatic prettifier that comes with R-Studio. Select all lines (e.g. with Ctrl-A)
## and select Code => Reformat Code

# a)
xmin <- c(23.0, 20.5, 28.2, 20.3, 22.4, 17.2, 18.2)
xmax <- c(25.0, 22.8, 31.2, 27.3, 28.4, 20.2, 24.1)

# b)
TempDifference <- xmax-xmin

# c)
avgMin <- mean(xmin)
avgMax <- mean(xmax)

# d)
xmin [xmin<avgMin]

# e)
xmax [xmax>avgMax]

# f)
# Nice

dateNames <- c('03Mon18','04Tue18', '05Wed18', '04Thu18', '05Fri18', '06Sat18', '07Sun18')
names(xmin) <- dateNames
names(xmax) <- dateNames

# g)
temperatures <- data.frame(
  df.dateNames = dateNames,
  df.xmin = xmin,
  df.xmax = xmax,
  df.TempDifference = TempDifference
)

temperatures

## Note length(some_data_frame) returns the number of _columns_.
length(temperatures)

# h)
## NOTE: improve readability

temperatures <- within(temperatures, {
	xminFahrenheit <- (9/5)*df.xmin + 32
})
temperatures

# i)

xmaxFahrenheit <- (9/5)*xmax + 32
xminFahrenheit <- (9/5)*xmin + 32

## Better:

temperatures <- within(temperatures, {
  xminFahrenheit <- xmin * (9/5) + 32
  xmaxFahrenheit <- xmax * (9/5) + 32
})

temperaturesFahrenheit <- temeratures[, c('xminFahrenheit', 'xmaxFahrenheit)]

TempDifferenceF <- xmaxFahrenheit - xminFahrenheit
temperaturesF <- data.frame(
  df.dateNames = dateNames,
  df.xmin = xminFahrenheit,
  df.xmax = xmaxFahrenheit,
  df.TempDifference=TempDifferenceF)
temperaturesF

# j)

Fahrenheit[1:5, ]
Fahrenheit[-(6:7), ]

temperaturesF[c(1, 2, 3 ,4, 5),c('df.dateNames', 'df.xmin', 'df.xmax', 'df.TempDifference')]
temperaturesF[c(-6,-7),c('df.dateNames', 'df.xmin', 'df.xmax', 'df.TempDifference')]

