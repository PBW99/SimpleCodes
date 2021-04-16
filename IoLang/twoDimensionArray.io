twoDList := list(list(1,2),list(3,4))

twoDList reduce(a, b, (a sum) + (b sum)) println


TwoDList := List clone
TwoDList dim := method(a, b,
                        ret := TwoDList clone
                        ret setSize(a)
                        for(i, 0, a-1,
                                newList := List clone
                                newList setSize(b)
                                ret atPut(i, newList))
                        )
TwoDList set := method(x,y,value,
                                self at(x) atPut(y, value) 
                    )
TwoDList get := method(x,y,
                                self at(x) at(y) 
                    )
TwoDList transpose := method(
                            rowLen := self size
                            colLen := 0
                            if(0 <rowLen, colLen := self at(0) size)

                            newMatrix := self dim(colLen, rowLen)

                            for(i, 0, rowLen-1,
                                for(j, 0, colLen-1,
                                    newMatrix at(j) atPut(i, self at(i) at(j))
                                )
                            )
                            newMatrix
                        )
newDim := TwoDList dim(3,5)

"Create" println
newDim println
newDim set(2,4,10)
newDim set(1,2,5)
newDim set(1,1,1)
newDim set(0,0,2)
newDim set(0,1,3)
newDim set(0,2,4)

"Set" println
newDim println()

"Get" println
newDim get(2,4) println

"Transpose" println
newDimTrans := newDim clone transpose
newDimTrans println
newDim println
(newDim get(2,4) == newDimTrans get(4,2)) println
