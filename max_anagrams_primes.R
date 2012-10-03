# Sieve of Eratosthenes
sieve <- function(n)
{
   n <- as.integer(n)
   if(n > 1e8) stop("n too large")
   primes <- rep(TRUE, n)
   primes[1] <- FALSE
   last.prime <- 2L
   fsqr <- floor(sqrt(n))
   while (last.prime <= fsqr)
   {
      primes[seq.int(2L*last.prime, n, last.prime)] <- FALSE
      sel <- which(primes[(last.prime+1):(fsqr+1)])
      if(any(sel)){
        last.prime <- last.prime + min(sel)
      }else last.prime <- fsqr+1
   }
   which(primes)
}
# Courtesy of Stack Overflow
# Thanks 'John'!
# hope you don't mind your code being used for a non-nerdy cause.

primes2use = sieve(101)
names(primes2use) = letters

words = readLines("words")

wordscode = sapply(strsplit(words,split=""),function(x,primes2use){
	return(prod(primes2use[x]))
	},primes2use=primes2use)

codeTab = table(wordscode)

bestLetters = as.numeric(names(codeTab[codeTab==max(codeTab)]))
lapply(bestLetters,function(bli,words,wordscode){return(words[wordscode==bli])},words=words,wordscode=wordscode)
