#R script prototyping buzz prediction using library 'e1071' and svm()
#Inputs:
# df.train = data frame of attributes of person A and person B
# c.buzz = array of buzzes A:B
# df.in = data frame of new people for whom we predict buzz

GenBuzzProbs <- function(df.train, c.buzz, df.in){

	library('e1071')
	
	model <- svm(df.train, c.buzz, type = 'C',kernal = 'linear', probability = TRUE)

	c.buzz.predict <- predict(model, df.in, probability = TRUE)
	
	df.buzz.predict <- attr(c.buzz.predict, "prob")

	c.buzz.probs <- as.double(df.buzz.predict[,1])	

	return(c.buzz.probs)
}
