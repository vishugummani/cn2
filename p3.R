# a
usn = as.character(c(1,2,3,4))
name = as.character(c("Artemis","BoJack","Cartera","Dan Brown"))
marks = as.integer(c(26,23,27,30))

table = data.frame(usn,name,marks)
table
#b
age = as.integer(c())
n =readline("Enter no of inputs :")
for(i in 1:n)
  {
    x = readline("enter age : ")
    age[i]=as.integer(x)
  }
# table=data.frame(usn,name,marks,age)
table=cbind(table,data.frame(age))
table
table1=data.frame(usn,name,marks,age)
table1[(table1$marks>25)&(table1$age<20),]

