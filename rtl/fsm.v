

module fsm
(
  output [5-1:0] state,
  output reg [8-1:0] cmd,
  input [10-1:0] refresh_cnt,
  input rd_enable,
  input wr_enable,
  input CLK,
  input RESET
);

  reg [8-1:0] cmd_next;
  reg [4-1:0] _;
  reg [4-1:0] __next;
  reg [5-1:0] yield_state;
  reg [5-1:0] yield_state_next;

  always @(cmd or _ or refresh_cnt or rd_enable or wr_enable or CLK or RESET or yield_state) begin
    __next = _;
    cmd_next = cmd;
    if(yield_state == 8) begin
      if(__next == 0) begin
        cmd_next = 145;
        yield_state_next = 9;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 8;
      end
    end else if(yield_state == 9) begin
      cmd_next = 184;
      yield_state_next = 5;
    end else if(yield_state == 5) begin
      cmd_next = 136;
      yield_state_next = 10;
    end else if(yield_state == 10) begin
      __next = 7;
      cmd_next = 184;
      yield_state_next = 11;
    end else if(yield_state == 11) begin
      if(__next == 0) begin
        cmd_next = 136;
        yield_state_next = 12;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 11;
      end
    end else if(yield_state == 12) begin
      __next = 7;
      cmd_next = 184;
      yield_state_next = 13;
    end else if(yield_state == 13) begin
      if(__next == 0) begin
        cmd_next = 128;
        yield_state_next = 14;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 13;
      end
    end else if(yield_state == 14) begin
      __next = 1;
      cmd_next = 184;
      yield_state_next = 15;
    end else if(yield_state == 15) begin
      if(__next == 0) begin
        cmd_next = 184;
        yield_state_next = 0;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 15;
      end
    end else if(yield_state == 0) begin
      if(refresh_cnt >= 519) begin
        cmd_next = 145;
        yield_state_next = 1;
      end else if(rd_enable) begin
        cmd_next = 152;
        yield_state_next = 16;
      end else if(wr_enable) begin
        cmd_next = 152;
        yield_state_next = 24;
      end else begin
        cmd_next = 184;
        yield_state_next = 0;
      end
    end else if(yield_state == 1) begin
      cmd_next = 184;
      yield_state_next = 2;
    end else if(yield_state == 2) begin
      cmd_next = 136;
      yield_state_next = 3;
    end else if(yield_state == 3) begin
      __next = 7;
      cmd_next = 184;
      yield_state_next = 4;
    end else if(yield_state == 4) begin
      if(__next == 0) begin
        cmd_next = 184;
        yield_state_next = 0;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 4;
      end
    end else if(yield_state == 16) begin
      __next = 1;
      cmd_next = 184;
      yield_state_next = 17;
    end else if(yield_state == 17) begin
      if(__next == 0) begin
        cmd_next = 169;
        yield_state_next = 18;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 17;
      end
    end else if(yield_state == 18) begin
      __next = 1;
      cmd_next = 184;
      yield_state_next = 19;
    end else if(yield_state == 19) begin
      if(__next == 0) begin
        cmd_next = 184;
        yield_state_next = 20;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 19;
      end
    end else if(yield_state == 20) begin
      cmd_next = 184;
      yield_state_next = 0;
    end else if(yield_state == 24) begin
      __next = 1;
      cmd_next = 184;
      yield_state_next = 25;
    end else if(yield_state == 25) begin
      if(__next == 0) begin
        cmd_next = 161;
        yield_state_next = 26;
      end else begin
        __next = __next - 1;
        cmd_next = 184;
        yield_state_next = 25;
      end
    end else if(yield_state == 26) begin
      __next = 1;
      cmd_next = 184;
      yield_state_next = 27;
    end else if(__next == 0) begin
      cmd_next = 184;
      yield_state_next = 0;
    end else begin
      __next = __next - 1;
      cmd_next = 184;
      yield_state_next = 27;
    end
  end


  always @(posedge CLK or negedge RESET) begin
    if(~RESET) begin
      _ <= 0;
      _ <= 15;
      cmd <= 184;
      yield_state <= 8;
    end else begin
      cmd <= cmd_next;
      _ <= __next;
      yield_state <= yield_state_next;
    end
  end

  assign state = yield_state;

endmodule

