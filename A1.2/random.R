# nums <- nums[ , !names(nums) %in% c("Id")]

# char2num<-function(x){
# groups = unique(x)
# as.numeric(factor(x, levels=groups))
# }
# newNonNums <- nonNums
# nonNumsEncode <- nonNums[FALSE,]
#  for(i in names(newNonNums)){
#    empty <- nonNums[FALSE,]
#    print(newNonNums$i)
#    empty <- as.numeric(newNonNums$i)
#    empty
#    nonNumsEncode <- cbind(nonNumsEncode, empty)
#    }

# temp <- nonNums[,1]
#   temp

# for(i in ncol(nonNums)){
#   # print(i)
#   table(nonNums[,i], nums$SalePrice)
#   # temp <- nonNums[,1]
#   # temp
#   chisq.test(nonNums[,i], nums$SalePrice)
# }
table(nonNums[,1], nums$SalePrice)
chisq.test(nonNums[,1], nums$SalePrice)

encodedNonAndSale <- one_hot(as.data.table(nonAndSale))


nonNumsEncode <- as.numeric(newNonNums$i)
nonNumsEncode
nonNumsEncode <- char2num(nonNums$MSZoning)
newNonNums$MSZoning[nonNumsEncode]

nonAndSale <- cbind(nums$SalePrice, nonNumsEncode)
colnames(nonAndSale)[1] <- "SalePrice"

aov1 <- aov(SalePrice ~ MSZoning , data = nonAndSale)


summary(aov(SalePrice~ , data=nonAndSale[ , 2:41] ))
nonNumCor <- cor(nonAndSale$SalePrice , nonAndSale[,2:41])
encodedNonAndSale <- one_hot(as.data.table(nonAndSale))

# this line finds the correlation betwen all values and the sales price
nonNumCorr <- cor(nonAndSale$SalePrice, nonAndSale[,2:41])

# nonAndSale[is.na(nonAndSale)] <- "0"

#this section sorts the highest correlation values and prints them


# add the salesprice column and one hot encode the non numeric data
nonAndSale <- cbind(nums$SalePrice, nonNums)
colnames(nonAndSale)[1] <- "SalePrice"
encodedNonAndSale <- one_hot(as.data.table(nonAndSale))

#this line finds the correlation betwen all values and the sales price
nonNumCorrs <- cor(encodedNonAndSale, encodedNonAndSale[,2:241])

#this section sorts the highest correlation values and prints them
sortedCorrs <- order(abs(nonNumCorrs))
sortedCorrs
# topCorrs <- correlations[,c(7 , 6, 23, 19, 13, 12, 27, 26, 16,  4)]
# topCorrs