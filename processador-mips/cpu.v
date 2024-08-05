module CPU (
    input clk,
    input reset
);
    wire [31:0] pc, nextPC, instruction;
    wire [31:0] readData1, readData2, writeData, aluResult, readData, signExtended, aluSrcB, pcBranch, jumpAddr;
    wire [4:0] writeReg;
    wire [3:0] aluControl;
    wire [1:0] aluOp;
    wire zero, regDst, aluSrc, memToReg, regWrite, memRead, memWrite, branch, jump;

    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .nextPC(nextPC),
        .currentPC(pc)
    );

    InstructionMemory im (
        .address(pc),
        .instruction(instruction)
    );

    ControlUnit CU (
        .OpCode(instruction[31:26]),
        .RegDst(regDst),
        .ALUSrc(aluSrc),
        .MemToReg(memToReg),
        .RegWrite(regWrite),
        .MemRead(memRead),
        .MemWrite(memWrite),
        .Branch(branch),
        .Jump(jump),
        .ALUOp(aluOp)
    );

    MUX2to1 #(.WIDTH(5)) MuxRegDst (
        .in0(instruction[20:16]),
        .in1(instruction[15:11]),
        .sel(regDst),
        .out(writeReg)
    );

    RegisterFile RF (
        .clk(clk),
        .regWrite(regWrite),
        .readReg1(instruction[25:21]),
        .readReg2(instruction[20:16]),
        .writeReg(writeReg),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2)
    );

    SignExtend SE (
        .in(instruction[15:0]),
        .out(signExtended)
    );

    MUX2to1 MuxALUSrc (
        .in0(readData2),
        .in1(signExtended),
        .sel(aluSrc),
        .out(aluSrcB)
    );

    ALUControlUnit ALUCU (
        .ALUOp(aluOp),
        .Funct(instruction[5:0]),
        .ALUControl(aluControl)
    );

    ALU ALU (
        .A(readData1),
        .B(aluSrcB),
        .ALUControl(aluControl),
        .Result(aluResult),
        .Zero(zero)
    );

    DataMemory dm (
        .clk(clk),
        .memWrite(memWrite),
        .address(aluResult),
        .writeData(readData2),
        .readData(readData)
    );

    MUX2to1 MuxMemToReg (
        .in0(aluResult),
        .in1(readData),
        .sel(memToReg),
        .out(writeData)
    );

    assign pcBranch = pc + 4 + (signExtended << 2);
    assign jumpAddr = {pc[31:28], instruction[25:0], 2'b00};

    assign nextPC = (jump) ? jumpAddr :
                    (branch & zero) ? pcBranch : pc + 4;

endmodule