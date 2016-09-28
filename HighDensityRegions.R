find.hdr <- function(theta,dist,step,density){
	#Function to find the highest density regions in a distribution
	#Sort the distribution so we can iterate down it easily
	sorted <- sort(dist,decreasing = TRUE)
	n <-1
	line <-	sorted[n]
	n<-n+2
	index <- dist >= line
	area <- sum((step)*(dist[index]))
	while(area<density){
		line <- sorted[n]
		index <- dist >= line
		area <- sum((step)*(dist[index]))
		n<-n+2
	}
	#Use this to find switching points
	shifted.index<-c(0,index[1:(length(index)-1)])
	lower.bounds <- theta[index-shifted.index == 1]
	upper.bounds <- theta[index-shifted.index == -1]-step
	data.frame(lower.bounds,upper.bounds)
}
