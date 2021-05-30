class decoder_driver extends uvm_driver #(decoder_seq_item);
`uvm_component_utils(decoder_driver)

decoder_seq_item pkt;
virtual decoder_if intf;

function new(string name="decoder_driver", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual decoder_if)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
   
  pkt=decoder_seq_item::type_id::create("pkt");
 forever
   begin
  seq_item_port.get_next_item(pkt);
  #5
  intf.X=pkt.X;
  intf.en=1'b1;
  `uvm_info("DRV Transaction", $sformatf("X=%b", intf.X),UVM_NONE);
  seq_item_port.item_done();
end
endtask
endclass