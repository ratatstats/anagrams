anagrams
========

I used nerdome for something non-nerdy: fashion. I’m ashamed, yet proud. I will likely be judged for this by nerds and non-nerds alike.

When I came across alphabet stackable rings, I felt a need... but what would I spell? I would want the word in the English dictionary with the most anagrams to get the most bang for my buck. Obviously.

And instead of trusting Yahoo Answers, I’m going to write a script to check for myself, of course.

Here are the solutions:

Set 1: “carets” “caster” “caters” “crates” “reacts” “recast” “traces”
Set 2: “pares” “parse” “pears” “rapes” “reaps” “spare” “spear”

I picked #2 because of “parse”… despite “rapes”. And also because five rings are cheaper than six. I wanted the most bang for my buck, remember?

This project directory contains my code. Now, I may be a bit strange, but I’m not a masochist. So I used R. This means that true nerds might not appreciate all of the following, as it isn’t going to be incredibly, extraordinarily efficient, but it works.

First, to utilize what Ubuntu has provided:

grep -P ‘^[a-z]+$’ /usr/share/dict/words > words

This line excludes proper nouns and words containing symbols.

Now for the R scripts. I’m going to try two different methods.

1: Primes. I can’t fully take advantage of its beauty in R, because the code I write will be likely less efficient than built-in R functions. But I love this solution, so I’m going to try it out anyway. And we’ll test the run times just for fun. In theory, because multiplication is technically constant time, each word should only take O(w) to process, where w is the length of the word.

2: Just sort the letters then tabulate. This code will take literally 1 minute to write. So I’ll do this as well. In theory, this should be less efficient, since sort is, at best, nlogn, so each word will take O(wlogw) to process. But again, I don’t know if this will hold in R, but let’s try it and see.

Results:

Option 1 Run time:
real    0m5.960s
user    0m5.828s
sys    0m0.108s

Option 2 Run time:
real    0m16.395s
user    0m16.229s
sys    0m0.096s

What do you know? Primes is still much faster!