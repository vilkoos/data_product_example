
###########################################################
##                                                       ##
##         make the data file loans.csv                  ##
##                                                       ##
###########################################################

#--- get the data from internet------------------------------------
if (!file.exists("loansData.rda")) {
    url  = "https://spark-public.s3.amazonaws.com/dataanalysis/loansData.rda"
    dest = "loansData.rda"
    meth = "internal"
    quit = TRUE
    mode = "wb"
    download.file(url, dest, meth, quit, mode)
    # NOTE this works under windows 7, modify if nessesairy
} 

#--- put all valid data in dataframe dat -------------------------
load("loansData.rda")      # load data into memory
dat <- na.omit (loansData) # omit the two cases that have missing value

#--- keep needed colums only -------------------------------------
dat <- dat[,c(3,1,4,10)]
row.names(dat) <- NULL

#--- transform vaules ---------------------------------------------
dat[,1] <- as.numeric(sub('%','',dat$Interest.Rate))     # remove the %
dat[,3] <- as.numeric(sub(' months','',dat$Loan.Length)) # remove months
dat[,4] <- as.numeric(sub('-.*$','',dat$FICO.Range))     # keep upper FICO limit only

#-- rename columns ------------------------------------------------
names(dat)[1] <- "IR"   # interest rate amount requested
names(dat)[2] <- "AR"   # amount requested
names(dat)[3] <- "LEN"  # loan length in months 
names(dat)[4] <- "FICO" # FICO score

# #-- create scaled version of explanatory columns ------------
# # scaled: substract mean and divide by standard deviation
# dat[,5] <- scale(dat[,2]); names(dat)[5] <- "ARs"   # scaled version of AR
# dat[,6] <- scale(dat[,3]); names(dat)[6] <- "LENs"  # scaled version of LEN
# dat[,7] <- scale(dat[,4]); names(dat)[7] <- "FICOs" # scaled version of FICO
# 
# #--- add a column for recording the distance, set distance inital to 0
# dat[,8] <- 0; names(dat)[8] <- "dist"

#--- save the result to loans.csv ----------------
write.csv(dat, file='loans.csv', row.names=FALSE)




