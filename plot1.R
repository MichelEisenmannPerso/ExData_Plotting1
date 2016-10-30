source("loader.R")

# loading data
df <- loadIt()
sub <- subsetIt(df)
rm(df)

# converting to date and adding full time column
ready <- convertIt(sub)
rm(sub)

#
png(filename="plot1.png")
source("subplot1.R")
dev.off()


