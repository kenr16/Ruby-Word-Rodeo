# Dictionary Friday Project

#### _Ken Rutan's Dictionary Page, April 28th, 2017_

#### By _**Ken Rutan**_

## Overview

This website will allow a user to enter a word into a database.  From there, the user can navigate to a page dedicated specifically to that word and input multiple definitions for that word.  The user can also upload links to images that have to do with that word, by submitting the image link.  From there, the image will be resized and displayed on the page.  The user is also awarded points based on how many words, definitions and images that they have submitted.

## Objective

The objective here was to create a child-friendly website for children to occupy themselves by learning about dictionary definitions by submitting information that will dynamically update the content of the webpage that they are on.

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|Input a word and return that word|"test"|"test"|
|Input pair of words and return all words|"random", "test"|"random", "test"|
|Create a definition with a string|"A car is a motorized vehicle"|"A car is a motorized vehicle"|
|Finds a word from a list of words based on its ID|[word ID]|"Mouse"|
|Create both a word and a definition and add the definition to the word|"Dog" "A 4 legged mammal"|"Dog: A 4 legged mammal"|
|Allow the user to enter more definitions for a word|"A common canine house pet"|"Dog: A 4 legged mammal, A common canine house pet"|

## Installation

* In order to run this app:
  - Locate the git repository of this project.
  - Clone or download the git repository onto your desktop.
  - Locate home folder of the app "ie:/childrens_dictionary/"
  - Once you have navigated into this folder, run "ruby app.rb" which should open Sinatra.
  - It should open when you navigate to localhost:4567

## Usage

Input a string and click the "Submit" button to see the results!

## Known Bugs
There are currently no known bugs in these HTML, CSS, Bootstrap, Ruby, Sinatra or Heroku files.

## Support and contact details

For further support, please contact Ken Rutan through his Github account. E-mail will not be listed here as this README is publicly displayed.

##Technologies Used

This website was constructed using HTML, CSS and Ruby as well as Sinatra and Heroku elements.

## License

Copyright (c) 2017 Ken Rutan.  This software is licensed under the MIT License.
