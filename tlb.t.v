`include "tlb.v"

module tlbtester();

	reg vaddr;
	// add reset to be trigerring the initial set up
	wire paddr, hit;

	tlb translbuff (paddr, hit, vaddr);

  //initial begin
  // 	Memoryfile = $fopen("Memory.txt");
  // 	if (!Memoryfile)
  //   $display("Could not open \"Memory.txt\"");
  // 	else begin
  //   $display(Memoryfile, "Result is: %4b", A);
  //   $fclose(File);
  // end
  //end

	initial begin 

	

	$display(" hit | vaddr |  paddr | expected paddr | tlbarray");
    vaddr=35'h1;  #1000 
    $display("%b |  %b  |  %b  | 0000000000000000 | %b ", hit, vaddr, paddr);
    vaddr=35'h2;  #1000 
    $display("%b |  %b  |  %b  | 0000000000000001 ", hit, vaddr, paddr);
    vaddr=35'h3;  #1000 
    $display("%b |  %b  |  %b  | 0000000000000010 ", hit, vaddr, paddr);
    vaddr=35'h4;  #1000 
    $display("%b |  %b  |  %b  | 0000000000000011 ", hit, vaddr, paddr);
    vaddr=35'h5;  #1000 
    $display("%b |  %b  |  %b  | 0000000000000100 ", hit, vaddr, paddr);
    $finish();
    end

endmodule 
