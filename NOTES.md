Description:
  A CLI that provides the weather in your local area.

Note: Users typically don't want to change their units of measurement. Once set, user should not be asked for it again. However, they should always be provided the option to change it.

Program Experience:
  User - inputs the command: todays-weather

  CLI - prompts user for their preferred measurement
  "Please select your preferred unit of measurement from the below list. Or type 'exit'"
    1. Standard
    2. Metric
    3. Imperial
  
  CLI - prompts user
  

  CLI - If user ever ente

  CLI prompts user for zipcode and to select their preferred measurement
    "Please enter a 5-digit zipcode."
    .gets()
    "Please select your preferred unit of measurement from list."
      1. Standard
      2. Metric
      3. Imperial

  Program uses the user's selected info to pull info from the weather API.
  Returns the following information to the user

  CLI prompts user to check the weather again with a zipcode.
    "Please enter a 5-digit zipcode or type 'exit'."

  Program continues on a loop until user exits.



Problems
