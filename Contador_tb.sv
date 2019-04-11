
module Contador_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 8 `endif;

   //=============
   // local regs
   //=============
   reg clk;
   reg en;
   reg rst;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   Contador #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else 8            `endif),
      .COUNT_FROM   (`ifdef COUNT_FROM   `COUNT_FROM   `else 0            `endif),
      .COUNT_TO     (`ifdef COUNT_TO     `COUNT_TO     `else 95           `endif),
      .STEP         (`ifdef STEP         `STEP         `else 1            `endif)
   ) dut (
      .clk (clk), 
      .en  (en), 
      .rst (rst), 
      .out (out)
   );

   //=============
   // initialize
   //=============
   initial
   begin
      $dumpvars;
      clk = 0;
      en  = 1;
      rst = 0;

      #50
      en = 0;
      #10
      en = 1;
     
   end

   //====================
   // simulate the clock
   //====================
   always #1
   begin
      clk = ~clk;
   end

   //===============
   // print output
   //===============
   always @(posedge clk) $display(out);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #100 $finish;
   
endmodule
