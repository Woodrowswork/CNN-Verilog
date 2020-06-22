module PE_tb;

    reg [15:0] input1;
    reg [15:0] input2;
    reg [30:0] initsum;
    reg clk;
    
    wire [30:0] result;
    
    PE uut (.input1(input1), .input2(input2), .initsum(initsum), .result(result));
    
    // System clock generation
        initial begin
            clk = 1'b0;
            forever
                #5 clk = ~clk;
        end
                
    
    initial begin 
    
    input1 = 16'h0002;
    input2 = 16'h0008;
    initsum = 31'h0000_0005;
    
    #50
    // -1 * -1
    input1 = 16'hffff;
    input2 = 16'hffff;
    initsum = 31'h0000_0000;
    
    #50
    //-1 * 1
    input1 = 16'hffff;
    input2 = 16'h0001;
    initsum = 31'h0000_0000;
    
    #50
    // multiplication overflow positive
    input1 = 16'h7fff;
    input2 = 16'h7fff;
    initsum = 31'h0000_0000;
    
    #50 
    // multiplication overflow negative
    input1 = 16'h8000;
    input2 = 16'h8000; 
    initsum = 31'h0000_0000; 
    
    #50
    // two max negative addition
    input1 = 16'h7fff;
    input2 = 16'h8000;
    initsum = 31'h4000_0000;
    
    #50
    // two max positive addition
    input1 = 16'h7fff;
    input2 = 16'h7fff;
    initsum = 31'h3fff_ffff;
	
	#50
    //fail test case
    input1 = 16'hfffc;
    input2 = 16'h0000;
    initsum = 31'h0000_0002;
    
    #50 $finish;
    end
    
endmodule