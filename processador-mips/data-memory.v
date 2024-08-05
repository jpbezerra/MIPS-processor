module DataMemory (
    input clk,
    input memWrite,
    input [31:0] address,
    input [31:0] writeData,
    output [31:0] readData
);
    // colocar 1023:0
    reg [31:0] memory [1023:0];

    // ler de 4 em 4
    assign read_data = {memory[address], memory[address+1], memory[address+2], memory[address+3]};

    always @(posedge clk) begin
        if (memWrite) begin
            memory[address  ] <= writeData[31:24];
            memory[address+1] <= writeData[23:16];
            memory[address+2] <= writeData[15:8];
            memory[address+3] <= writeData[7:0];

            $display("posição: %d, valor: %d", address, memory[address+3]);
        end
    end

endmodule