`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2019 21:59:41
// Design Name: 
// Module Name: tff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tff(
    input T,
    input CLK,
    output Q
    );
    
    reg Q;
    reg data;
    
    always @ (posedge CLK)
    begin
    if (T==0)
        begin
        data<=data;
        end
    else if(T==1)
        begin
        data<=!data;
        end
    end
    Q<=data;
    
endmodule

