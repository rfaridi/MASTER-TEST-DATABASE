library(exams)
#my.f="introRtest_1q.Rmd"
my.f <- list(c(
	       "introRtest_table1.Rmd",
	       "introRtest_vec_x.Rmd",
	       "introRtest_vec_x_avg.Rmd", 
	       "introRtest_1q.Rmd"))
n.ver=1
nfiles=length(my.f[[1]])
name.ver="finalQuiz1_v"

#getID <- function(i) {  
#  paste("Version",i)
#}

getID <- function(i) {
    paste("myexam", gsub(" ", "0", format(i, width = 2)), sep ="")
}

my.exam <- exams2pdf(file=my.f,
			  n=n.ver,
			  nsamp=nfiles,
			  name=name.ver,
			  template=c("plain-horiz"),
			  dir=".",
			  verbose=TRUE) 

# creating a solution

rf.answer.key <- data.frame()
n.q <- 3 # number of questions
for (i.ver in seq(n.ver)){
  exam.now <- my.exam[[i.ver]]  # this step is selecting each element whcich is essentially each version of question
  for (i.q in seq(n.q)){
    sol.now <- letters[which(exam.now[[i.q]]$metainfo$solution)] # i.q is the question number and here solution for each queston has been stored
    temp <- data.frame(i.ver = i.ver, i.q = i.q, solution = sol.now)
    df.answer.key <- rbind(df.answer.key, temp)  
  }
}

df.answer.key.wide <- tidyr::spread(df.answer.key, key = i.q, value = solution)

