interface decoder_if();

logic [3:0]X;
logic [15:0]Y;
logic en;

modport DUT(input X,en, output Y);
endinterface