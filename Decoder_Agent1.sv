class decoder_agent1 extends uvm_agent;

`uvm_component_utils(decoder_agent1)

decoder_seqr seqr;
decoder_driver drv;
decoder_MON1 mon1;

function new (string name="decoder_agent1", uvm_component parent);
super.new(name, parent);

endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seqr=decoder_seqr::type_id::create("seqr", this);
  drv=decoder_driver::type_id::create("drv", this);
  mon1=decoder_MON1::type_id::create("mon1", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  
  super.connect_phase(phase);
  
  drv.seq_item_port.connect(seqr.seq_item_export);
  
endfunction

endclass
  
  