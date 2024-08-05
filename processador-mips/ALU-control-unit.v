module ALUControlUnit (
    input [1:0] ALUOp,
    input [5:0] Funct,
    output reg [3:0] ALUControl
);
    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 4'b0010; // ADD, LW, SW, ADDI, ADDIU
            2'b01: ALUControl = 4'b0110; // SUB, BEQ
            2'b10: begin
                case (Funct)
                    `ADDU: ALUControl = 4'b0010;
                    `SUB: ALUControl = 4'b0110;
                    `JR: ALUControl = 4'b0000; // JR is a special case
                    default: ALUControl = 4'b0000;
                endcase
            end
            2'b11: begin
                case (Funct)
                    `LUI: ALUControl = 4'b0011; // Custom code for LUI (shift left 16 bits)
                    `ORI: ALUControl = 4'b0001; // Custom code for ORI
                    default: ALUControl = 4'b0000;
                endcase
            end
            default: ALUControl = 4'b0000;
        endcase
    end
endmodule