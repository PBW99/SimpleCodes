List myAverage := method( sum := 0     
                          self foreach(a,
                                    if(a type != "Number", Exception raise("No Number"), sum := sum + a)
                          )
                          if(0 == self size, 0, sum / (self size))
)
list(1,2,3,4) myAverage println
list() myAverage println
list(1,2,"aa",4) myAverage println
