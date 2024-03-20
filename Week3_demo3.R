manager_data<- read.csv("managers.csv")
View(manager_data)
str(manager_data)

manager_data$Date
converted_date<-as.Date(manager_data$Date,
                        format = c("%Y-%d-%m","%m/%d/%Y","%Y-%d-%m"))
converted_date
manager_data
manager_data$Date<-converted_date
manager_data$Date


#replace na remove entire row
#relace with similar values
#na.omit()

#complete.cases() function in R to remove missing values in a vector, 

manager_data[!complete.cases(manager_data)]
manager_data[complete.cases(manager_data),"Age"]
manager_data[complete.cases(manager_data),"Gender"]

#na.omit()

new_data<-na.omit(manager_data)
new_data


#not complete cases For eact line it check logical values and return True and false
complete_data<-complete.cases(manager_data)
complete_data

complete_data<-!complete.cases(manager_data)
complete_data

#sum of completed row
Sum_completerow<-sum(complete_data)
Sum_completerow

#list rows that do not have missing values

complete_data_list<-manager_data[complete.cases(manager_data),]
complete_data_list

#nrow  numbers row
nrow(complete_data_list)
nrow(manager_data)

#missing data
missing_values<-manager_data[!complete.cases(manager_data),]
missing_values

#find sum of all missing values of age colum
is.na(manager_data$Age)
sum(is.na(manager_data$Age))

mean(is.na(manager_data$Age))
mean(!is.na(manager_data$Age))

install.packages("mice")
library(mice)

#to see plot values in picture formate

md.pattern(manager_data)

install.packages("VIM")
library(VIM)


missing_values_agg<-aggr(manager_data, prop=FALSE,  numbers= TRUE)
summary(missing_values_agg)

missing_values_agg<-aggr(manager_data, prop=TRUE,  numbers= TRUE)
summary(missing_values_agg)
str(missing_values_agg)


matrixplot(manager_data)
manager_data

missing_values_mat<-as.data.frame(abs(is.na(manager_data)))
head(missing_values_mat)

correlation_Matrix<-missing_values_mat[(apply(missing_values_mat, 2,sum) > 0)]
correlation_Matrix


cor(correlation_Matrix)



#attach(manager_data)
#merge 
#cbind Rbind
#dimensions return shapes
