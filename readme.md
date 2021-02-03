# Save the princess Challenges

https://www.hackerrank.com/challenges/saveprincess
https://www.hackerrank.com/challenges/saveprincess2

# To run them on HackerRank:
Paste the functions in the website and click on submit. They have the same signature.

# To run their tests:
1. With a not-too-old version of Ruby(I wrote and run on two computers, with rubies 2.6.2 and 2.3.0), do
```
gem install bundler && bundle install 
```

2. On the terminal:
```
rspec spec
rspec spec/save_princess/save_princess_two_spec.rb
rspec spec/save_princess/save_princess_spec.rb
```

Rationale behind the solutions:

## save_the_princess1: 

If one interprets the grid as cartesian plane, it mathematically becomes reducing deltaX and deltaY coordinates, being deltaX and deltaY:
```
delta_x = princess_x_coordinate - player_x_coordinate
delta_y = princess_y_coordinate - player_y_coordinate
```
Following the HackerRank grid notation

Since the movements are always either vertical or horizontal, we always have to decrease 1 move at a time both deltaX and deltaY. Consequently the gameplay order is irrelevant. Looping through both axes is a good solution due to reduced number of decisions, although is certainly not the most fun one.

## save_the_princess2: 
Given the same grid referential from save_the_princess1, the problem is again iteravively decreasing deltaX and deltaY coordinates. To decide where the player has to go, we have three scenarios(i)we are in the same line as the princess, hence we don't need to think too much(ii) they are equistant, consequently choosing any direction that effectively takes you to the princess will do, and(iii)we should decrease the largest distances first, for us to get 'closer' to the princess. I could think of other options, but this one is simple and that's what I would do if I was playing this on real life.