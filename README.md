# CNN-Verilog

This is a processing element of a CNN. It accepts as input a 16 bit integer (the value at the point), a 16 bit integer (the weight of that point), and a 31 bit integer (the initial value. the PE will be part of a 3 x 3 group moving over a 7 x 7 image in the final project). The integers are two's complement. The overflow logic works in simulation, but did not synthesize later in the project. 
