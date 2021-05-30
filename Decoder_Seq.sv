class decoder_seq extends uvm_sequence #(decoder_seq_item);
`uvm_object_utils(decoder_seq)

decoder_seq_item pkt;
function new(string name="decoder_seq");
  super.new(name);
  
endfunction

task body();
  
  pkt=decoder_seq_item::type_id::create("pkt");
  repeat(10)
  begin
    start_item(pkt);
    
    assert(pkt.randomize());
    finish_item(pkt);
    `uvm_info("DECODER Seq",$sformatf("X=%b, Y=%b", pkt.X, pkt.Y), UVM_NONE);
  end
endtask
endclass