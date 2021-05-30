class decoder_MON1 extends uvm_monitor;

`uvm_component_utils(decoder_MON1)

decoder_seq_item pkt;

virtual decoder_if intf;


uvm_analysis_port #(decoder_seq_item) MON12SB;

function new(string name="decoder_MON1", uvm_component parent);
super.new(name, parent);
MON12SB=new("MON12SB",this);
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
    pkt.X=intf.X;
    `uvm_info("MON1", $sformatf(" X=%b", pkt.X),UVM_NONE);
    MON12SB.write(pkt);
  end
endtask
endclass
    