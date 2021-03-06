library(getopt)
library(data.table)

spec = matrix(c('ifile','i',1,"character",'pfile','p',1,"character",'ofile','o',1,"character"),byrow=TRUE,ncol=4)

opt=getopt(spec)
input1 <- opt$ifile
input2 <- opt$pfile
outputfile <- opt$ofile

df1 <- read.csv(input1,sep = '\t', header = F)
df2 <- read.csv(input2,sep = '\t', header = F)

colnames(df2)[2] <- "uniq"
colnames(df1)[2] <- "uniq"

unique <- setDT(df2)[uniq %chin% df1$uniq]

write.table(unique, file = outputfile,quote = F, col.names = F,row.names = F, sep='\t')
