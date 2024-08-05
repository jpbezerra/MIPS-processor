`timescale 1ns / 1ps

module ALUControlUnit_tb;
    reg [1:0] ALUOp;
    reg [5:0] Funct;
    
    wire [3:0] ALUControl;

    ALUControlUnit uut (
        .ALUOp(ALUOp),
        .Funct(Funct),
        .ALUControl(ALUControl)
    );

    initial begin
        #100;
        
        // Test ADD, LW, SW, ADDI, ADDIU
        ALUOp = 2'b00; Funct = 6'bxxxxxx; #10;
        if (ALUControl == 4'b0010) $display("Test Successful for: ADD, LW, SW, ADDI, ADDIU\n");

        // Test SUB, BEQ
        ALUOp = 2'b01; Funct = 6'bxxxxxx; #10;
        if (ALUControl == 4'b0110) $display("Test Successful for: SUB, BEQ\n");

        // Test R-type ADDU
        ALUOp = 2'b10; Funct = `ADDU; #10;
        if (ALUControl == 4'b0010) $display("Test Successful for: R-type ADDU\n");

        // Test R-type SUB
        ALUOp = 2'b10; Funct = `SUB; #10;
        if (ALUControl == 4'b0110) $display("Test Successful for: R-type SUB\n");

        // Test R-type JR
        ALUOp = 2'b10; Funct = `JR; #10;
        if (ALUControl == 4'b0000) $display("Test Successful for: R-type JR\n");

        // Test LUI
        ALUOp = 2'b11; Funct = `LUI; #10;
        if (ALUControl == 4'b0011) $display("Test Successful for: LUI\n");

        // Test ORI
        ALUOp = 2'b11; Funct = `ORI; #10;
        if (ALUControl == 4'b0001) $display("Test Successful for: ORI\n");

        // Test default cases
        ALUOp = 2'b10; Funct = 6'b000000; #10;
        if (ALUControl == 4'b0000) $display("Test Successful for: Default case for R-type (ALUOp = 2'b10)\n");

        ALUOp = 2'b11; Funct = 6'b000000; #10;
        if (ALUControl == 4'b0000) $display("Test Successful for: Default case for ALUOp = 2'b11\n");

        $finish;
    end

    initial begin
        $monitor("\nTime = %0t, ALUOp = %b, Funct = %b, ALUControl = %b", $time, ALUOp, Funct, ALUControl);
    end
endmodule