# Backend Engineer Code Test

The purpose of this exercise is to give you a chance to demonstrate your
problem solving and coding skills. The exercise is split into two sections:
first you will complete the tasks below at home; if you are successful in the
first part, you will be invited in for an interview where we will discuss your
solution and try to add to it. This is primarily a refactoring exercise so we
can see how you deal with legacy code and changing requirements; bear that in
mind when completing the exercise.

## The tasks

This exercise is based on the [checkout kata][checkout-kata]. We have written
some code (lib/checkout.rb) with tests (spec/checkout_spec.rb) to model a few
common discount scenarios; the code is poorly written and new requirements have
come in.

Those new requirements are:

- Buy 3 get 1 free on Mangos
- Being able to dynamically specify discounts
  - From a database*, read out the type of discount and the item to which it applies
  - Refactor the current code to apply discounts from the database.

\* not a real database, a class wrapping a hash or array will be sufficient

The code we have provided uses `rspec` for testing, run it with `bundle exec rspec`

## What we are looking for

- A refactoring of the code into something more maintainable
- Deep understanding of OOP principles
- Good testing practices
- Bonus: A detailed git commit log to show the refactoring process you went through

## Notes

**AI tooling**
For this test, I used ChatGPT to assess my solutions and offer feedback for improvements.

**What I would add to this solution in the future**
* An alternative way of managing money, such as using the [money gem](https://github.com/RubyMoney/money) for money calculations and currency conversion. 
* A more elegant way to handle one-per-customer restrictions. The solution I implemented serves its purpose, but I can see potential for future improvements in this area. It might be better to use an integer for quantitative values (e.g., two per customer), but this would require further refactoring.
* Improved handling for edge cases. For instance, in a real-world scenario, the scan function should provide informative feedback to the front end of the application. Currently, it only logs a message if an item is not found.