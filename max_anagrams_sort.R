words = readLines("words")

splitwords = strsplit(words,split="")
splitwords = sapply(splitwords,sort)
swords = sapply(splitwords,paste,collapse="")

swordsTab = table(swords)

bestLetters = names(swordsTab[swordsTab==max(swordsTab)])
lapply(bestLetters,function(bli,words,swords){return(words[swords==bli])},words=words,swords=swords)
