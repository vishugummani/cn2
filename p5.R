data()

data("mtcars")
sapply(mtcars,class)
head(mtcars,2)
nrow(mtcars)
ncol(mtcars)
sum(mtcars$am==0)
sum(mtcars$am==1)
mtcars$high=ifelse(mtcars$am > mtcars$gear, "h",ifelse(mtcars$am<mtcars$gear,"g","a"))
head(mtcars,2)
x=mtcars$hp
y=mtcars$wt
plot(x,y,main="ScatterPlot MTCARS",xlab="Horsepower",ylab="weight",pch=19,frame=FALSE)
newmtc <- transform(mtcars,am=as.integer(am),vs=as.integer(vs),cyl=as.integer(cyl))
sapply(newmtc,class)
newmtc[(newmtc$cyl<5),]
