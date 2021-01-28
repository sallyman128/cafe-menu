Description:
  A CLI that provides the menu of a local Frederick cafe: Frederick Coffee Co. & Cafe
  http://fredcoffeeco.com/index.php/menu/

Program Experience:
  User inputs frederick-coffee-cafe-menu

  Program scrapes the cafe's menu website.

  CLI shows a list of menu categories from their website:
    1. Breakfast
    2. Sandwiches
    3. Paninis
    4. Lunch wraps
    5. Salads
    6. Combos and Soups
    7. For the kids
    8. Classic favorites
    9. Espresso drinks
    10. Specialty lattes

  CLI prompts user for action
    Which menu category would you like to explore?
    If you'd like to exit, type "exit"
  
  User inputs a menu number (i.e. 2 - for Sandwiches)

  CLI shows a list of menu items from that user's desired menu category.
    1. East street chicken salad
    2. Key city reuben
    3. Black bean burger
    4. Church street sandwich

  CLI prompts user for action
    Which menu item would like to receive the price and description of?
    If you'd like to go back one level, type "back"
    If you'd like to exit, type "exit"

  User inputs a menu item number (i.e. 1 - for East street chicken salad)
  
  CLI shows the menu item price and description
    Item: East Street Chicken Salad
    Price: $6.99
    Description: Our famous house-made chicken salad topped with swiss cheese, artisan leaf lettuce, & tomato served on a croissant

  CLI prompts user if they'd like to go "back" a level or "exit"
    If you'd like to go back one level, type "back"
    If you'd like to exit, type "exit"

  If User ever types "exit", output "Thanks! Seeya again soon!"

Ways to build out further
  1. Provide user with info on events at the cafe.
        Viewing the website's event calendar through the "list" view will permit scraping. The "month" view has too much javascript to permit scraping.
  2. 