#==============================================================================
# ** Gif_replace_disposal_method
# >>> Created by: Lucas de Morais Siqueira (2015/05/04)
# >>> Contact: lucas.morais.siqueira@gmail.com
#-------------------------------------------------------------------------------
# Changes the disposal method to "Replace" (as in Gimp's frame disposal "One
# frame per layer (replace)") by # replacing the value of the current Disposal
# Method field (in the Graphic Control Extension of the binary gif file).
#==============================================================================
# Why would you do that?
# Sometimes when you make an animated gif with a transparent background (in my
# case via scripts using Rmagick # / ImageMagick), the disposal becomes weird
# and each frame is rendered upon the previous one (creating "ghosts").
# Most of the the gif processing tools only allow you to chose from 1 to 3
# or 7 disposal methods that do not include the replace method, so even if you
# try to change it (manually, via script, command line, etc.) you limited to a
# bunch of methods that creates the same buggy animated gif with ghots.
# Gimp, however, offers you the Replace method, so after changing it a single
# file at a time, I've decided to compare the files binary/hex data, found
# the value of the proper method and created this script to do it for me.
#==============================================================================

def bin_to_hex(s)
  s.unpack('H*').first
end

def hex_to_bin(s)
  s.scan(/../).map { |x| x.hex }.pack('c*')
end

def replace_hex(inputfile, find_s, replace_s, outputfile = inputfile)
  File.open(inputfile,'rb') do |f|
    p("Input file = #{inputfile}")
    text = bin_to_hex(f.read)
    #p(text)
    find_s.each {|string| text.gsub!(string, replace_s)}
    text = hex_to_bin(text)    
    IO.binwrite(outputfile, text)
  end
  p("Output file = #{outputfile}")
  #p(bin_to_hex(File.open(outputfile,'rb').read))
end # replace_hex

replaced_disposal_methods = ["21f90401", "21f90402", "21f90403", "21f90404", "21f90405", "21f90406", "21f90407", "21f90408"]
replace_hex('axe.gif', replaced_disposal_methods, "21f90409", 'axeb.gif')
