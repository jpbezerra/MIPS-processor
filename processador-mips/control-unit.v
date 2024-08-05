module ControlUnit (
    input [5:0] OpCode,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg Jump,
    output reg [1:0] ALUOp
);
    always @(*) begin
        case (OpCode)
            `R_TYPE: begin
                RegDst = 1;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b10;
            end
            `LW: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            `SW: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            `BEQ: begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                Jump = 0;
                ALUOp = 2'b01;
            end
            `JUMP: begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 1;
                ALUOp = 2'b00;
            end
            `JAL: begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 1;
                ALUOp = 2'b00;
            end
            `LUI: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b11;
            end
            `ORI: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b11;
            end
            `ADDI: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            `ADDIU: begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            default: begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
        endcase
    end
endmodule