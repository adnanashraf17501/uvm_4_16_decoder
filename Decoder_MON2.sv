class decoder_MON2 extends uvm_monitor;

`uvm_component_utils(decoder_MON2)

decoder_seq_item pkt;
uvm_analysis_port #(decoder_seq_item) MON22SB;


virtual decoder_if intf;

function new(string name="decoder_MON2", uvm_component parent);
super.new(name, parent);
MON22SB=new("MON22SB",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual decoder_if)::get(this,"", "intf", intf);
endfunction

task run_phase(uvm_phase phase);
  
  pkt=decoder_seq_item::type_id::create("pkt");
  forever
  begin
    #5
    pkt.Y=intf.Y;
   
    
    `uvm_info("MON2", $sformatf("Y=%b", pkt.Y),UVM_NONE);
    MON22SB.write(pkt);
  end
endtask
endclass