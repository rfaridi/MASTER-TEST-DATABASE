library(exams)

my.f <-'sampleTest.Rmd'
n.ver <- 1  # then it will create two versions
name.exam <- 'exam_sample'
my.dir <- 'exam_output/'

my.exam <- exams2pdf(file = rep(my.f,5),
                     n = n.ver, 
                     dir = my.dir,
		     header=list(ID="myID"),
                     name = name.exam, 
		     template="exam",
                     verbose = TRUE)


# in the above my.exam is a list where two components has two different version
# of the question and two different pdf have been printed

# my.exam is a list of which each element has 5 questions each


df.answer.key <- data.frame()
n.q <- 5 # number of questions
for (i.ver in seq(n.ver)){
  exam.now <- my.exam[[i.ver]]  # this step is selecting each element whcich is essentially each version of question
  for (i.q in seq(n.q)){
    sol.now <- letters[which(exam.now[[i.q]]$metainfo$solution)] # i.q is the question number and here solution for each queston has been stored
    temp <- data.frame(i.ver = i.ver, i.q = i.q, solution = sol.now)
    df.answer.key <- rbind(df.answer.key, temp)  
  }
}

df.answer.key.wide <- tidyr::spread(df.answer.key, key = i.q, value = solution)
