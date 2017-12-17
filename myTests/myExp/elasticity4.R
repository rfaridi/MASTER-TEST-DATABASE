library(exams)

my.f <-'elasticity4.Rmd'
n.ver <- 1  # then it will create two versions
name.exam <- 'elasticity'
my.dir <- 'exam_output/'

my.exam <- exams2pdf(file = rep(my.f,5),
                     n = n.ver, 
                     dir = my.dir,
		     template="plain",
                     name = name.exam, 
                     verbose = TRUE)


