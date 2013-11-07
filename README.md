inet_aton
=========

Implementations of inet_ntoa() and inet_aton() in various languages.

Funny thing about Internet addresses; they're actually rather more flexible than we give them credit for.

Don't believe me?  Pull up a command line in Windows, Linux, or Mac OS and type:

`ping 0x7f.1`

Betcha didn't know that IP addresses were that flexible, eh?  As a result, I've tried to incorporate as many features of a "real" `inet_ntoa`/`inet_aton` implementation as I easily could.  In particular, addresses like "127.1" will work, since they are perfectly valid.  Some of the more esoteric forms (like the 0x7f.1 example, above) may not, but I encourage forks, patches and improvements.

As to why I put this up?  It was one thing when I had to develop the JavaScript ones.  Once I found myself doing it in Bash, I said, "To hell with it, someone else probably faced this same issue, and I can save them some time."  So hopefully I've saved you some time.  Then again, the likelihood of anyone casually browsing Github stumbling across this and needing it, I freely admit, is damn near zero.  So: hi, Google!  inet_ntoa, inet_aton, IP address translation, etc., etc.  INDEX MEEEEEEEEEEE!  ;)

Oh, also worth pointing out that this provides a simple way to verify IP addresses are sane and canonical: `if (inet_ntoa(inet_aton(provided_address)) != provided_address) { ...`.
