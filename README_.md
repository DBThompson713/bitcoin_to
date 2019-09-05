<h1>1 Bitcoin</h1>
<p>Dale Thompson - September 2019</p>
  
<p>  <a href = "https://github.com/DBThompson713/bitcoin_to">1 Bitcoin on Github</a>
  
<br />
<strong><h2>Statement of Purpose and Scope</h2></strong>
  
<p>1 Bitcoin is a guessing game based on the current bitcoin price. The game is essentially designed to be as frustrating and confusing as the bitcoin market can be. 
  
<p>1 Bitcoin asks the user to guess how many of a given item can be purchased for 1 bitcoin. It then takes the current value of 1 bitcoin and determines how many items can be purchased. The game then retakes and recalculates that value every time the user guesses. This causes the number that the user is trying to guess to fluctuate depending on the current volatility of the bitcoin market. The more volatile the market, the harder the game is to win. A correct answer may only be correct in that instance and have changed in the next. The game also intentionally keeps the user’s proximity to the correct answer somewhat vague and unclear to increase the level of frustration. 
<p>To a person on the outside of the bitcoin scene, it can be quite daunting to understand how bitcoin value changes and what the real world implications of those changes are. Staring at a graph, it can be hard to visualise the real world purchasing power of a bitcoin and how much it can vary, however if the value differs in a few moments by several iphones or Nintendo switches, it becomes much easier to equate the value of one bitcoin to the world around us.
<p>The target audience for this game is fans of bitcoin, people curious about bitcoin, as well as masochists. One type of user will play this game when they want to flex on their knowledge of bitcoin and purchasing power. Another type of user will play this game as a way to sate their curiosity regarding the bitcoin market. The last type of user for this game is someone who like to look at 8-bit pictures and make wild guesses.
  
<div>
<br />
<strong><h2>Features</h2></strong>
<br />
<strong>Live Bitcoin values</strong>
   <p> •	Uses the current bitcoin value to determine how many items can be purchased. The current live bitcoin value is taken from blockchain, which is a reputable source. 
       <br /> o	This is accomplished by accessing the ticker located at https://blockchain.info/ticker and taking the last AUD value for bitcoin. This current value is updated whenever the ticker is accessed. 
       <br /> o	The ticker is accessed every time the user makes a guess, and the value may differ from the last read, meaning that the answer that the user is trying to guess may differ wildly from guess to guess, depending on the current bitcoin market volatility.
      <br />  o	But actual JSON access and parsing occurs in a method called blockchain, which is then called prior to each guess and used to calculate the actual number of items based on the per item value stored in index 1 of the questions array
<p><strong>8-bit graphics</strong>
<br />•	Each item, logo and meter is presented in beautiful 8-bit glory 
<br />o	1 bitcoin utilizes the catpix ruby gem to line by line convert images to their low-res 8-bit equivalent
<br />o	The image’s relative path is stored as a string located at index 2 of the questions array. That path is then dropped in as an argument to catpix.
<br />
  
<p><strong>User input</strong><br />
•	Takes the user input and compares it to the actual number of items purchasable with 1 bitcoin
<br />o	Upon taking in the user input, first the input is checked to ensure that it is a number and not a string or single letter. The primary error handling is done at this point.
<br />If the input is found to be a character other than a number, a grumpy faced emoji is displayed and the user is told that they have not entered a number and that they have wasted a guess.
o	If a number is entered, the game determines whether or not they have the correct number, if not it then makes the following determinations in this order
<br />1.	(guess+100) > answer  -- Way too high
<br />•	User told guess is way too high, and displays the corresponding image
<br />2.	guess> answer  -- Too high
<br />•	User told guess istoo high, and displays the corresponding image
<br />3.	(guess-100)answer – Way too low
•	User told guess is way too low, and displays the corresponding image
<br />4.	guess< answer – too low
<br />•	User told guess is too low, and displays the corresponding image
Session score
<br />•	Each correct answer gives one point which is then stored in an outside variable called $score
<br />•	Score is stored until the end of the game session
<br />•	When exiting the game, the final score is first displayed.
<p><strong>Hidden Canadian Flag</strong>
<br />•	Running the application from the command line with the argument Canada will display a Canadian flag.
<br />o	O Canada.
</div>
<br />
  
<strong><h2>User Interaction and Experience</h2></strong>
•	The user can find the basic instructions on how to play by running the application from the command line and passing in the argument help
•	If the user does not make use of the helpfile, the game is pretty easy to play. The questions are worded in a very straight forward way 
o	Ex. How many Harley Davidsons can you currently purchase with 1 bitcoin?
•	The user enters their response as an integer.
•	If the user enters something other than a number, the game will chastise the user, or ignore the answer and they will lose that guess. 
•	The user input is verified as a number before any calculations are done, and handles any potential “error” which may be introduced by the user.
  