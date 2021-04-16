randomNumber := (Random value( 99 ) + 1) floor;

standardIO := File standardInput;

previousGuess := nil;

10 repeat(
	"Guess number (1..100): " println;

	guess := standardIO readLine asNumber;

	if(guess == randomNumber,break;);

	if(previousGuess,
		if(
			((randomNumber - guess) abs) >= ((randomNumber - previousGuess) abs),
			"Getting colder :(" println,
			"Getting warmer :)" println
		);
	);
	previousGuess = guess;
);

if(guess == randomNumber,
		"Awesome! Excellent guess!" println,
		"Sorry, better luck next time." println
);