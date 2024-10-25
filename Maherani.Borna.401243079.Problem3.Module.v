
module operator0 (
    out , A , B
);
    input signed [5:0] A, B;
    output signed [5:0] out;
    assign out = (A<<<2) + (B>>>1);
endmodule

module operator1 (
    out , A , B
);
    input signed [5:0] A, B;
    output signed [5:0] out;
    assign out = A + B + B + B;
endmodule

module operator2 (
    out , A , B
);
    input signed [5:0] A, B;
    output signed [5:0] out;
    assign out = -B;
endmodule

module operator3 (
    out , A , B
);
    input signed [5:0] A, B;
    output signed [5:0] out;
    assign out = (A+A-B) < 0 ? (B-A-A) : (A+A-B);
endmodule


module ALU (
    out , A , B , opr
);
    input signed [5:0] A, B;
    input [1:0] opr;
    output signed [6:0] out ;
    wire signed [5:0] op0 , op1 , op2 , op3;

    if (opr == 2'b00) begin
        operator0 f0 (A, B, op0);
        assign out = op0; 
    end 
    else if (opr == 2'b01) begin     
        operator1 f1 (A, B, op1);
        assign out = op1;
    end
    else if (opr == 2'b10) begin
        operator2 f2 (A, B, op2);
        assign out = op2;
    end
    else begin
        operator3 f3 (A, B, op3);
        assign out = op3;
    end

endmodule

