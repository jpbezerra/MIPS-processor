`timescale 1ns / 1ps

module ControlUnit_tb;

    // Inputs
    reg [5:0] OpCode;

    // Outputs
    wire RegDst;
    wire ALUSrc;
    wire MemToReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire Jump;
    wire [1:0] ALUOp;

    // Instantiate the Unit Under Test (UUT)
    ControlUnit uut (
        .OpCode(OpCode), 
        .RegDst(RegDst), 
        .ALUSrc(ALUSrc), 
        .MemToReg(MemToReg), 
        .RegWrite(RegWrite), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .Branch(Branch), 
        .Jump(Jump), 
        .ALUOp(ALUOp)
    );

    initial begin
        // Test R-type instruction
        OpCode = 6'b000000; #10;
        $display("\nR_TYPE: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test LW instruction
        OpCode = 6'b100011; #10;
        $display("\nLW: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test SW instruction
        OpCode = 6'b101011; #10;
        $display("\nSW: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test BEQ instruction
        OpCode = 6'b000100; #10;
        $display("\nBEQ: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test JUMP instruction
        OpCode = 6'b000010; #10;
        $display("\nJUMP: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test JAL instruction
        OpCode = 6'b000011; #10;
        $display("\nJAL: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test LUI instruction
        OpCode = 6'b001111; #10;
        $display("\nLUI: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test ORI instruction
        OpCode = 6'b001101; #10;
        $display("\nORI: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test ADDI instruction
        OpCode = 6'b001000; #10;
        $display("\nADDI: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        // Test ADDIU instruction
        OpCode = 6'b001001; #10;
        $display("\nADDIU: RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, Jump = %b, ALUOp = %b\n", RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);

        $finish;
    end
endmodule