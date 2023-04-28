--                                                                            --
-- Author(s):                                                                 --
--   Miguel Angel Sagreras                                                    --
--                                                                            --
-- Copyright (C) 2015                                                         --
--    Miguel Angel Sagreras                                                   --
--                                                                            --
-- This source file may be used and distributed without restriction provided  --
-- that this copyright statement is not removed from the file and that any    --
-- derivative work contains  the original copyright notice and the associated --
-- disclaimer.                                                                --
--                                                                            --
-- This source file is free software; you can redistribute it and/or modify   --
-- it under the terms of the GNU General Public License as published by the   --
-- Free Software Foundation, either version 3 of the License, or (at your     --
-- option) any later version.                                                 --
--                                                                            --
-- This source is distributed in the hope that it will be useful, but WITHOUT --
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or      --
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for   --
-- more details at http://www.gnu.org/licenses/.                              --
--                                                                            --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.base.all;

entity serlzr is
	generic (
		lsdfirst : boolean := true);
	port (
		src_clk  : in  std_logic;
		src_frm  : in  std_logic := '1';
		src_data : in  std_logic_vector;
		dst_frm  : in  std_logic := '1';
		dst_clk  : in  std_logic;
		dst_data : out std_logic_vector);
end;

architecture def of serlzr  is

	function max_and_mask (
		constant src_size : natural;
		constant dst_size : natural)
		return natural_vector is

		constant debug_mask : boolean := false;
		constant debug_shft : boolean := false;
		constant debug_max  : boolean := false;

		function barrel_stage (
			constant mask   : natural;
			constant shft   : natural;
			constant mode   : bit := '0') 
			return natural is
			variable vmask  : natural;
			variable vshft  : natural;
			variable stage  : natural;
			variable retval : natural;
		begin
			vmask  := mask;
			vshft  := shft;
			stage  := 0;
			retval := mask;
			while vshft > 0 or vmask > 0 loop
				if mode='0' then
					if vmask mod 2 = 0 then
						if vshft mod 2 = 1 then
							retval := retval + 2**stage;
						end if;
					end if;
				else
					if vmask mod 2 = 1 then
						if vshft mod 2 = 0 then
							retval := retval - 2**stage;
						end if;
					end if;
				end if;
				vmask := vmask / 2;
				vshft := vshft / 2;
				stage := stage + 1;
			end loop;
			return retval;
		end;

		variable max   : natural;
		variable mask0 : natural;
		variable mask1 : natural;
		variable shft  : natural;

	begin
		max   := 0;
		mask0 := 0;
		mask1 := 2**unsigned_num_bits(src_size-1)-1;
		shft  := 0;
		for i in 0 to dst_size-1 loop
			shft := shft + src_size mod dst_size + (src_size/dst_size-1)*dst_size;
			if shft > max then
				max := shft;
			end if;

			assert not debug_max
			report "MAX SHIFT   : " & natural'image(max)
			severity note;

			assert not debug_shft
			report "SHIFT VALUE : " & natural'image(shft)
			severity note;

			mask0 := barrel_stage(mask0,shft, '0');
			-- mask1 := barrel_stage(mask1,shft, '1');
			assert not debug_mask
			report "UPDATED MASK0 : " & natural'image(mask0)
			severity note;
			assert not debug_mask
			report "UPDATED MASK1 : " & natural'image(mask1)
			severity note;

			while shft >= dst_size loop
				shft := shft - dst_size;
				mask0 := barrel_stage(mask0,shft, '0');
				-- mask1 := barrel_stage(mask1,shft, '1');

				assert not debug_shft
				report "SHIFT ALUE : " & natural'image(shft)
				severity note;

				assert not debug_mask
				report "UPDATED MASK0 : " & natural'image(mask0)
				severity note;
				assert not debug_mask
				report "UPDATED MASK1 : " & natural'image(mask1)
				severity note;

			end loop;
		end loop;
		return (max+dst_size, mask0, mask1);
	end;

	constant debug_mm : boolean := true;
	constant mm : natural_vector := max_and_mask(src_data'length, dst_data'length);

	signal shf  : std_logic_vector(unsigned_num_bits(src_data'length-1)-1 downto 0);
	signal rgtr : std_logic_vector(mm(0)-1 downto 0);
	signal shfd : std_logic_vector(rgtr'range);

begin 

	assert not debug_mm
	report "(MAX => " & natural'image(mm(0)) & ", MASK0 => " & to_string((to_unsigned(mm(1), shf'length))) & ", MASK1 => " & to_string((to_unsigned(mm(2), shf'length))) & ")"
	severity note;

	process (dst_clk)
		variable shr : unsigned(rgtr'range);
		variable acc : unsigned(shf'range) := (others => '0');
	begin 
		if rising_edge(dst_clk) then
			if dst_frm='0' then
				acc := (others => '0');
			elsif acc >= dst_data'length then 
				acc := acc - dst_data'length;
			else
				shr := shift_left(shr, src_data'length);
				shr(src_data'length-1 downto 0) := unsigned(setif(lsdfirst,reverse(src_data), src_data));
				acc := acc + abs(src_data'length - dst_data'length);
			end if;
			shf  <= std_logic_vector(acc and to_unsigned(mm(1), acc'length));
			rgtr <= std_logic_vector(shr);
		end if;
	end process;

	shl_i : entity hdl4fpga.barrel
	generic map (
		left => false)
	port map (
		shf => shf,
		di  => rgtr,
		do  => shfd);
	
	dst_data <= setif(lsdfirst,reverse(shfd(dst_data'length-1 downto 0)), shfd(dst_data'length-1 downto 0));
end;