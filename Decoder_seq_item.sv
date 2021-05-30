class decoder_seq_item extends uvm_sequence_item;

`uvm_object_utils(decoder_seq_item)
rand bit [3:0]X;
rand bit [15:0]Y;
rand bit en;
     
  function new(string name="decoder_seq_item");
  super.new(name);
  endfunction

  endclass