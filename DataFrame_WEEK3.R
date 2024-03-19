#Data frame
Subject<-c(1:7)
Subject
Gender<-c("male","male","male",NA,"female","female","female")
Gender
Age<-c(23,34,32,54,65,45,35)
Age
Weight<-c(67.5,NA,63.7,56.8,89.9,87.5,77.5)
Weight
Trial<-data.frame(Subject,Gender,Age,Weight)
View(Trial)

#indexing it starts with "1".
Trial[4,5]
Trial[,3]

#Rename
install.packages("data.table")
install.packages("data.table")

library(data.table)
library(data.table)

        
setnames(Trial,'Subject','Participant')

help("setNames()")
#Missing Values
Trial[!complete.cases(Trial)]

Trial[complete.cases(Trial),3]
Trial[complete.cases(Trial),"Age"]

Trial$Age [Trial$Subject==6]<-55.0
View(Trial)

Trial$Gender [Trial$Subject==4]
Trial$Weight [Trial$Subject==2]




#Data Frame 2

Manager<-c(1:5)
Manager
Date<-c("10/15/18","01/11/18","10/21/18","10/28/18","05/01/18")
Date
country<-c('US','US','IRL','IRL','IRL')
country
Gender<-c('M','F','F','M','F')
Gender
Age<-c(32,45,25,39,99)
Age
q1<-c(5,3,3,3,2)
q1
q2<-c(4,5,5,3,2)
q2
q3<-c(5,2,5,4,1)
q3
q4<-c(5,5,5,NA,2)
q4
q5<-c(5,5,2,NA,1)
q5

Manager_data<-data.frame(Manager,Date,country,Gender,Age,q1,q2,q3,q4,q5)
View(Manager_data)

#record
Manager_data$Age[Manager_data$Age]==99
Manager_data



#Create a new 
Manager_data$Agecat<-c(10,22,33,44,55)
Manager_data

#drop

Manager_data_1<-subset(Manager_data, select = -Manager)
Manager_data_1

Manager_data_2<-subset(Manager_data, select = -1)
Manager_data_2

Manager_data<-Manager_data[,c(2:10)]
Manager_data


Manager_data[1:5,3]

Manager_data[1:5,1:5]

Manager_data[c(1,5),1:3]

Manager_data[c(1,3,5),2:4]

Manager_data4<-Manager_data[c(1,3,5),c(2,4)]
Manager_data4

#5 obj rows/ 10 variables col
str(Manager_data)

Manager_data_5<-subset(Manager_data, select = -AgeCat )
Manager_data_5

Manager_data$AgeCat[Manager_data$Age>=45]<-"Elder"
Manager_data$AgeCat[Manager_data$Age<=25]<-"Young"
Manager_data$AgeCat[Manager_data$Age>26&Manager_data$Age<44 ]<-"Middle age"
Manager_data$AgeCat[is.na(Manager_data$Age)]<-"Elder"
Manager_data
str(Manager_data)


AgeCat<- factor(Manager_data$AgeCat,
                order=TRUE,
               levels = c("Young","Middle age","Elder") )
AgeCat
str(AgeCat)



Summary_col<-Manager_data$q1+Manager_data$q2+Manager_data$q3+Manager_data$q4+
Manager_data$q5
Summary_col

Manager_data$Summary_col<-Summary_col
Manager_data


Manager_data<-data.frame(Manager_data,Summary_col)
Manager_data

Manager_data$AgeCat<-AgeCat
Manager_data

Manager_data
mean_value<-rowMeans(Manager_data[5:9])

mean_value<- data.frame(Manager_data,mean_value)

mean_value

#rename col name
names(Manager_data)[12]<-"mean value"
names(Manager_data)[11]<-"Answer total"
Manager_data

colSummary<- colSums(Manager_data[,c(4:9,11:12)],na.rm=TRUE)
colSummary