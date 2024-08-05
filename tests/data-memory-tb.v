`timescale 1ns / 1ps

module DataMemory_tb;
    reg clk;
    reg memWrite;
    reg [31:0] address;
    reg [31:0] writeData;

    wire [31:0] readData;

    DataMemory uut (
        .clk(clk),
        .memWrite(memWrite),
        .address(address),
        .writeData(writeData),
        .readData(readData)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        memWrite = 0;
        address = 0;
        writeData = 0;

        // Write data to memory
        memWrite = 1;
        address = 4;
        writeData = 32'hDEADBEEF;
        #20;

        memWrite = 1;
        address = 8;
        writeData = 32'hCAFEBABE;
        #20;

        // Read data from memory
        memWrite = 0;
        address = 4;
        #20;
        $display("Read data from address %d: %h", address, readData);

        memWrite = 0;
        address = 8;
        #20;
        $display("Read data from address %d: %h", address, readData);

        $finish;
    end

    always #10 clk = ~clk;

endmodule