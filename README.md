# CNN-Verilog

This is a processing element of a CNN. It accepts as input a 16 bit integer (the value at the point), a 16 bit integer (the weight of that point), and a 31 bit integer (the initial value. the PE will be part of a 3 x 3 group moving over a 7 x 7 image in the final project). The integers are two's complement. The overflow logic works in simulation, but did not synthesize later in the project. 

In the later 3 x 3 group this implementation forces each PE to wait for the previous one to deliver the initial sum. It is possibly faster to have each PE just perform the multiplication independently and then sum up all the results in a seperate step. So this is jsut two steps. All multiply at once, then all add at once. Instead of multiply, then add, multiply, then add . . . nine times. 
