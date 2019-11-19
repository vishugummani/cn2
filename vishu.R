//1st program
rep(c(4,6,3),times=10)
paste("fn",1:30,sep="",collapse = ',')

//2nd program
x <- factor(c("ear removal", "fake ear removal", "control", "control","control","fake ear removal","fake ear removal","fake ear removal","ear removal","ear removal","ear removal"))
levels(x)
nlevels(x)
table(x)


vct<-c(rep("a",25),rep("b",15),rep("c",35))
length(vct)
table(vct)

//3rd program
e<-data.frame(usn=(1:4),name=factor(c("bob","b","c","d")),marks=c(15,30,19,20))
print(e)
age<-c(11,12,13,14)
e=cbind(e,age)
print(e)

print(summary(e))
subset(e.marks>25&age<20)
print(e)

//4th program
n<-as.integer(readline(prompt = "enter a employee"))
empid<-vector(mode = "character",length =50)
> empname<-vector(mode = "character",length =50)
> doj<-vector(mode = "character",length =50)
> empcode<-vector(mode = "character",length =50)
> desig<-vector(mode = "character",length =50)
> dept<-vector(mode = "character",length =50)
> print("enter a empid")
for (i in 1:50) {empname[i]<-(readline())
for (i in 1:50) {empid[i]<-as.integer(readline())