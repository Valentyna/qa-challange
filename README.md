# qa-challenge
ruby

You can see that tests for first two questions have different format. Generally, that's not what I would usually do - it's better to keep test consistent within one project or at least test suit, so it won't take much time figuring out how it works when maintaining.

Trying different approaches in my solutions I wanted to demonstrate benefits of each of them:
  - it's nice to manage test data in separate file when multiple/massive data needed for checking same condition. It allows keeping test clearer, avoiding code repetition and eliminates the need of editing test when more/different data has to be checked
  - on other hand, having separate test for each data set as in finder example, giveы immediate insight about issue allocation when test fails
