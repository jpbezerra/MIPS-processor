module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    // testar mudar para [7:0] de [1023:0]
    reg [7:0] memory [1023:0];

    // testar fazer a instrução assim
    assign instruction = {memory[address], memory[address + 1], memory[address + 2], memory[address + 3]};

endmodule