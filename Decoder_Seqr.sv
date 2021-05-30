class decoder_seqr extends uvm_sequencer #(decoder_seq_item);

`uvm_component_utils(decoder_seqr)

function new(string name="decoder_seqr", uvm_component parent);
  super.new(name, parent);
endfunction

endclass