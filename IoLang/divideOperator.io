originDiv := Number getSlot("/")

Number / := method(a, if(a != 0, originDiv(a), 0))

10 / 2 println
10 / 0 println