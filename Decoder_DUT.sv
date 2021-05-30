module decoder_DUT(decoder_if.DUT intf);

assign intf.Y=2**(intf.X);
endmodule