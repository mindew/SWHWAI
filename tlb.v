/*TLB (Translation Load Buffer)
Takes in virtual address and 'translate' it to the physical memory. 
All mappings are pre-loaded. In other word, TLB has a list of mapping in between memories.

Input: 20 bits of VPN + 12 bits of Offset
Output: 15 bits of PPN + 12 bits of Offset
*/
`include "equality.v"
`define OR or

module tlb
(
output[26:0] Physicaladdr,		// 27 bits (15 ppn + 12 offset)
output hit,						// 1 bit
input[31:0] Virtualaddr		// 32 bits (20 vpn + 12 offset)
);

	wire [19:0] vpn;
	wire [14:0] ppn;
	wire [34:0] temp;
 	wire [11:0] offset;
	reg tlbarray[34:0];			// 35 bits (20vpn + 15 ppn)

// read the hex file
initial begin
	$readmemh("tlbarray.hex", tlbarray);
end

assign vpn = Virtualaddr[31:12];
assign offset = Virtualaddr[11:0];
assign ppn = tlbarray[14:0];

// assign the extracted bits to physicaladdr 
assign Physicaladdr[26:12] = ppn;
assign Physicaladdr[11:0] = offset;

equality eq(vpn,tlbarray[34:15],hit);

endmodule

// start with an one entry tlb - one register, develop a hardware that either says a hit or a miss





