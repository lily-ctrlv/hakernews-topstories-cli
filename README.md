# hakernews-topstories-cli
CLI to retrive n top stories from hakernews

How to run:

 1. Make sure you have Ruby istalled:

 Ruby versions 2.0 and above are included by default in macOS releases since at least El Capitan (10.11).

  Homebrew is a commonly used package manager on macOS. Installing Ruby using Homebrew is easy:

On your terminal: $ brew install ruby

If you you have a different OS, please follow specific instructions on the link below:

https://www.ruby-lang.org/en/documentation/installation/

2. Copy this repo to your local machine and run terminal within its context

  2. a) On Mac, you can run the command below to make the CLI easier to run in the future.

   $ chmod 755 hackernews.rb

3. Application takes the arguments:

--posts / -p how many posts to print -> (A positive integer <= 100)
--help / -h -> brings up a list of commands and their purpose

*Example Input:*

$ ruby hackernews.rb -p 5

or

$ ./hackernews.rb -p 5 (if you ran command 2. a))

*Example output:*

 _  _         _             _  _
| || |__ _ __| |_____ _ _  | \| |_____ __ _____
| __ / _` / _| / / -_) '_| | .` / -_) V  V (_-<
|_||_\__,_\__|_\_\___|_|   |_|\_\___|\_/\_//__/
Here's today's top stories:
[
  {
    "title": "Sweden Drops Julian Assange Rape Investigation",
    "uri": "https://www.bbc.com/news/world-europe-50473792",
    "author": "schappim",
    "points": 367,
    "comments": 286,
    "rank": 1
  },
  {
    "title": "Fitbit users are getting rid of the devices because they don’t trust Google",
    "uri": "https://www.cnbc.com/2019/11/17/people-getting-rid-of-fitbits-after-google.html",
    "author": "Classicaldj34",
    "points": 205,
    "comments": 84,
    "rank": 2
  },
  {
    "title": "List of all tools we used to create a hit HTML5 game on Steam",
    "uri": "https://www.codecks.io/blog/2019/creating-a-hit-steam-game-in-html5/",
    "author": "riadd",
    "points": 45,
    "comments": 6,
    "rank": 3
  },
  {
    "title": "We ‘may’ have discovered a potential remedy for tinnitus – by accident",
    "uri": "https://www.linkedin.com/content-guest/article/we-may-have-discovered-potential-remedy-tinnitus-spencer",
    "author": "DanielBMarkham",
    "points": 151,
    "comments": 47,
    "rank": 4
  },
  {
    "title": "Algebraic Data Types: Things I wish someone explained on functional programming",
    "uri": "https://jrsinclair.com/articles/2019/algebraic-data-types-what-i-wish-someone-had-explained-about-functional-programming",
    "author": "jrsinclair",
    "points": 106,
    "comments": 17,
    "rank": 5
  }
]

Libraries Used:

OptionParse - CLI Argument management
JSON  - for API data
NET/HTTP - for API call




