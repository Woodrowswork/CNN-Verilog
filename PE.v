module multiply (input1, input2, out);
    input [15:0] input1, input2;
    output [30:0] out;
    
    wire [30:0] out;
    wire [29:0] mul,cmpmul;
    wire [14:0] a,b;
    wire sign;
    
    assign a = (input1[15]==0) ? input1[14:0] : ~input1[14:0] + 1'b1;
    assign b = (input2[15]==0) ? input2[14:0] : ~input2[14:0] + 1'b1;
    assign sign = (input1 == 16'h0000 || input2 == 16'h0000) ? 1'b0 : input1[15] ^ input2[15];
    
    assign mul = a * b;
    assign cmpmul = ~mul + 1'b1;
    assign out = (sign==0) ? {1'b0,mul} : {1'b1,cmpmul};
    
    endmodule
    
module PE(
    input [15:0] input1,
    input [15:0] input2,
    input [30:0] initsum,
    output [30:0] result
    );
    
    wire [30:0] intermediate, almostresult;
    reg [30:0] result;
    
    multiply multiply1 (input1, input2, intermediate);
       
   assign almostresult = intermediate + initsum;
      
  always @(almostresult)begin
    if ((almostresult[30] == 1) && (initsum[30] == 0) && (intermediate[30] == 0))begin
        $error("Positive overflow");
        result <= 31'h3fff_ffff;
        end
    else if ((almostresult[30] == 0) && (initsum[30] == 1) && (intermediate[30] == 1))begin
        $error("negative underflow");
        result <= 31'h4000_0000;
        end
    else
        result <= almostresult;
    end
    
    
   
    
    
        
    
endmodule


