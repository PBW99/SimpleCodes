
matrix := list(
	list( "A", 0, 0 ),
	list( "0", "B", "0" ),
	list( "0", "0", "C" )
);

filePath := "./serialized.txt";

dataFile := File open( filePath );
dataFile write( matrix serialized() );
dataFile close();

doMatrix := doFile( filePath );
("Matrix (size: " .. matrix size() .. ")") println();
matrix println();

("doFile Matrix (size: " .. doMatrix size() .. ")") println();
doMatrix println();

File remove(filePath)