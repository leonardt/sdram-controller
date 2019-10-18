
module fsm(input [9:0] refresh_cnt, input rd_enable, input wr_enable, output [4:0] state, output [7:0] cmd, input CLK, input RESET);

reg [3:0] __curr;
reg [3:0] _;

reg [4:0] curr_state;
reg [4:0] next_state;
assign state = curr_state;

reg [7:0] curr_cmd;
reg [7:0] next_cmd;
assign cmd = curr_cmd;


always @(posedge CLK) begin
    if (~RESET) begin
        __curr <= 15;

        curr_state <= 5'b01000;
        curr_cmd <= 8'b10111000;

    end else begin
        curr_state <= next_state;
        curr_cmd <= next_cmd;
        __curr <= _;

    end
end
always @(*) begin
    _ = __curr;

    if (state == 5'b01000) begin
        if ((_ != 0)) begin
            next_state = 5'b01000;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b01001;
            next_cmd = 8'b10010001;
        end
    end else if (state == 5'b01001) begin
        begin
            next_state = 5'b00101;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b00101) begin
        begin
            next_state = 5'b01010;
            next_cmd = 8'b10001000;
        end
    end else if (state == 5'b01010) begin
        begin
            next_state = 5'b01011;
            next_cmd = 8'b10111000;
            _ = 7;
        end
    end else if (state == 5'b01011) begin
        if ((_ != 0)) begin
            next_state = 5'b01011;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b01100;
            next_cmd = 8'b10001000;
        end
    end else if (state == 5'b01100) begin
        begin
            next_state = 5'b01101;
            next_cmd = 8'b10111000;
            _ = 7;
        end
    end else if (state == 5'b01101) begin
        if ((_ != 0)) begin
            next_state = 5'b01101;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b01110;
            next_cmd = 8'b1000000x;
        end
    end else if (state == 5'b01110) begin
        begin
            next_state = 5'b01111;
            next_cmd = 8'b10111000;
            _ = 1;
        end
    end else if (state == 5'b01111) begin
        if ((_ != 0)) begin
            next_state = 5'b01111;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b00000;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b00000) begin
        if ((refresh_cnt >= 519)) begin
            next_state = 5'b00001;
            next_cmd = 8'b10010001;
        end else if (rd_enable && (refresh_cnt < 519)) begin
            next_state = 5'b10000;
            next_cmd = 8'b10011xxx;
        end else if (wr_enable && (refresh_cnt < 519) && (~ rd_enable)) begin
            next_state = 5'b11000;
            next_cmd = 8'b10011xxx;
        end
    end else if (state == 5'b00001) begin
        begin
            next_state = 5'b00010;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b00010) begin
        begin
            next_state = 5'b00011;
            next_cmd = 8'b10001000;
        end
    end else if (state == 5'b00011) begin
        begin
            next_state = 5'b00100;
            next_cmd = 8'b10111000;
            _ = 7;
        end
    end else if (state == 5'b00100) begin
        if ((_ != 0)) begin
            next_state = 5'b00100;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b00000;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b11000) begin
        begin
            next_state = 5'b11001;
            next_cmd = 8'b10111000;
            _ = 1;
        end
    end else if (state == 5'b11001) begin
        if ((_ != 0)) begin
            next_state = 5'b11001;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b11010;
            next_cmd = 8'b10100xx1;
        end
    end else if (state == 5'b11010) begin
        begin
            next_state = 5'b11011;
            next_cmd = 8'b10111000;
            _ = 1;
        end
    end else if (state == 5'b11011) begin
        if ((_ != 0)) begin
            next_state = 5'b11011;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b00000;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b10000) begin
        begin
            next_state = 5'b10001;
            next_cmd = 8'b10111000;
            _ = 1;
        end
    end else if (state == 5'b10001) begin
        if ((_ != 0)) begin
            next_state = 5'b10001;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b10010;
            next_cmd = 8'b10101xx1;
        end
    end else if (state == 5'b10010) begin
        begin
            next_state = 5'b10011;
            next_cmd = 8'b10111000;
            _ = 1;
        end
    end else if (state == 5'b10011) begin
        if ((_ != 0)) begin
            next_state = 5'b10011;
            next_cmd = 8'b10111000;
            _ = _ + -1;
        end else if ((_ == 0)) begin
            next_state = 5'b10100;
            next_cmd = 8'b10111000;
        end
    end else if (state == 5'b10100) begin
        begin
            next_state = 5'b00000;
            next_cmd = 8'b10111000;
        end
    end
end
endmodule
    
