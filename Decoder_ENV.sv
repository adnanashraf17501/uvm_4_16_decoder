class decoder_env extends uvm_env;

`uvm_component_utils(decoder_env)

decoder_agent1 ag1;
decoder_agent2 ag2;
decoder_sb sb;

function new(string name="decoder_env", uvm_component parent);
  super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  ag1=decoder_agent1::type_id::create("ag1", this);
  ag2=decoder_agent2::type_id::create("ag2", this);
  sb=decoder_sb::type_id::create("sb", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  ag1.mon1.MON12SB.connect(sb.ip_fifo.analysis_export);
  ag2.mon2.MON22SB.connect(sb.op_fifo.analysis_export);
endfunction

endclass

