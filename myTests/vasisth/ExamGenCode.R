
## Load library:
library("exams")

## exam questions:
myexamlist<-list("pnorm1","sesamplesizemchoice")

## output directory
## create new test dir if one does not exist:
files.list<-system("ls",intern=TRUE)

if(length(unique(files.list=="ExampleExamSU2015"))==1){
system("mkdir ExampleExamSU2015")
}
odir <- paste(getwd(),"/ExampleExamSU2015",sep="")

## ID generator function;
## labels each test version (for easier grading):
## only the last digit tells you what version it is, 
## the rest of the numbers are distractors, to make
## it difficult for students to figure out which version
## they have. Change this as you please to mask your version no.
getID <- function(i) {  
  paste("Example Exam SU 2015, date: ",date(), 
        gsub(" ",abs(round(rnorm(1,mean=20000,sd=20),digits=0)), 
             format(i, width = 2)),sep="")
}

## testing:
getID(1) ## version 1
getID(2) ## version 2

## generate exams
#set.seed(1090) ## uncomment only if you want deterministic behavior
## how many different versions of exams?
num.versions<-5
sol <- exams2pdf(sample(myexamlist), n = num.versions, 
             dir = ".", 
	     template="plain2",
             header = list(ID = getID, Date = Sys.Date()))

## generated files
list.files(odir)

## meta-information
print(sol, 1)
print(sol, "test1")

## customize printed meta-information
#mycontrol <- list(mchoice.print = list(True = LETTERS[1:5], False = "_"))

