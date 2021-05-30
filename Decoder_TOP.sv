import uvm_pkg::*;
`include "uvm_macros.svh"
`include "Decoder_Interface.sv"
`include "Decoder_DUT.sv"
`include "Decoder_Seq_Item.sv"
`include "Decoder_Seq.sv"
`include "Decoder_Seqr.sv"
`include "Decoder_Driver.sv"
`include "Decoder_MON1.sv"
`include "Decoder_MON2.sv"
`include "Decoder_Agent1.sv"
`include "Decoder_Agent2.sv"
`include "Decoder_SB.sv"
`include "Decoder_ENV.sv"
`include "Decoder_Test.sv"

module decoder_top();

decoder_if intf();
decoder_DUT V_code(intf);

initial
begin
  uvm_config_db #(virtual decoder_if)::set(uvm_root::get(),"*","intf",intf);
run_test("decoder_test");
end
endmodule