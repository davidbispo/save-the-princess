# Save the princess Challenges

https://www.hackerrank.com/challenges/saveprincess
https://www.hackerrank.com/challenges/saveprincess2

# To run them on HackerRank:
Paste the functions in the website and click on submit. They have the same signature.

# To run the specs:
1. With a not-too-old version of Ruby(I wrote and run on two computers, with rubies 2.6.2 and 2.3.0) on a bash terminal and **on the project folder** do:
```
gem install bundler && bundle install 
```

2. On the same terminal:
```
rspec spec
rspec spec/save_princess/save_princess_two_spec.rb
rspec spec/save_princess/save_princess_spec.rb
```

# Rationale behind the solutions:

## save_the_princess1: 

If one interprets the grid as Cartesian plane, the problem can be interpreted mathematically as reducing deltaX and deltaY coordinates, being deltaX and deltaY:

```
delta_x = princess_x_coordinate - player_x_coordinate
delta_y = princess_y_coordinate - player_y_coordinate
```
Following the HackerRank grid notation

Since the movements are always either vertical or horizontal, we always have to decrease 1 move at a time both deltaX and deltaY. Consequently the gameplay order is irrelevant. Looping through both axes is a good solution due to reduced number of decisions, although is certainly not the most fun one.

## save_the_princess2: 
Given the same grid referential from save_the_princess1, the problem is again iteratively decreasing deltaX and deltaY coordinates. To decide where the player has to go, we have three scenarios(i)we are in the same line as the princess, hence we don't need to think too much(ii) they are equidistant, consequently randomly choosing any direction that will effectively takes player to the princess will do, and(iii)we should decrease the largest distances first, for us to get 'closer' to the princess. I could think of other options, but this one is simple and that's what I would do if I was playing this on real life.