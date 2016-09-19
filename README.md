Welcome to TweetClient!
===================


Hey! This is just a for-fun project I did to dive into the changes in Swift 3.0.
There are many syntax changes as well as with the closures needing to be explicitly written as escaping. NSCache is also being replaced by Cache soon? I have also noticed the changes in guard-let syntax, if-lets error handling, as well as having minor syntax changes in completion handlers/blocks. I also really enjoy the shortening of many verbose methods prior to Swift 3.0.

I am mostly just experimenting with the Social Framework and Twitter API. Also to change things up a bit, This project I am using NSOperationQueues, since before I have mostly only used GCD queues in my other projects.
Furthermore, I am also starting to write my datasource and delegates using class extensions for better code readability.
Based off this article: 
https://www.natashatherobot.com/swift-how-to-name-your-extensions/ )

----------

TweetClient
-------------
![enter image description here](http://i558.photobucket.com/albums/ss26/vincent_chau1/twitclient_zpskachkoao.jpg)

> **Note:**

> - User must have at least one Twitter account linked to their Settings on the iPhone
> - This is because of the using the social framework to login requires an ACAccount to be stored into the phones. 


#### <i class="icon-file"></i> Limitations
This is just a fun project for me, so this is not a full-on twitter client with every feature of this API implemented. However, I tried to structure the code to be adaptable to changes in the future. The code is more modularized, but of course I can refactor more. 

Overall, this was a quick and fun project.


----------



