module booth (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);
    reg     [15:0]  x_neg; //[x]补
    reg     [15:0]  x_reg_neg; //[-x]补
    reg     [5:0]   i;  //i为计数器
    reg             k;  //k为y[i+1]初值为0
    reg             my_busy;
    assign busy = my_busy;
    
    always @(posedge clk or negedge rst_n) begin
        if(start==1'b1)begin
            x_neg[15:0] <= x[15:0];
            x_reg_neg[15:0] <= (~x[15:0])+1'b1;
            z[31:16] <=16'b0;
            z[15:0] <= y[15:0];
            k <=1'b0;
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(i>=5'd0 && i<=5'd16)my_busy<=1'b1;
        else my_busy=1'b0;
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(start)i<=1'b0;
        else if(i<=5'd16)   i<=i+1;
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(i<5'd16)begin
            //检测z[0]，k 并进行booth操作
            case({z[0],k})
                2'b00:;
                2'b01:  z[31:16] = z[31:16]+x_neg[15:0];
                2'b10:  z[31:16] = z[31:16]+x_reg_neg[15:0];
                2'b11:;
            endcase
            k=z[0];
            if(k<5'd15) z[31:0] = {z[31],z[31:1]};
        end
    end
endmodule