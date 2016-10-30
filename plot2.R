source("loader.R")

# loading data
df <- loadIt()
sub <- subsetIt(df)
rm(df)

# converting to date and adding full time column
ready <- convertIt(sub)
rm(sub)

#
png(filename="plot2.png")
source("subplot2.R")
dev.off()

