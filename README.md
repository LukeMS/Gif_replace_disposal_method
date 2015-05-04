==============================================================================  
** Gif_replace_disposal_method
>>> Created by: Lucas de Morais Siqueira (2015/05/04)
>>> Contact: lucas.morais.siqueira@gmail.com
-------------------------------------------------------------------------------
Changes the disposal method to "Replace" (as in Gimp's frame disposal "One
frame per layer (replace)") by  replacing the value of the current Disposal
Method field (in the Graphic Control Extension of the binary gif file).
==============================================================================
Why would you do that?
Sometimes when you make an animated gif with a transparent background (in my
case via scripts using Rmagick  / ImageMagick), the disposal becomes weird
and each frame is rendered upon the previous one (creating "ghosts").
Most of the the gif processing tools only allow you to chose from 1 to 3
or 7 disposal methods that do not include the replace method, so even if you
try to change it (manually, via script, command line, etc.) you limited to a
bunch of methods that creates the same buggy animated gif with ghots.
Gimp, however, offers you the Replace method, so after changing it a single
file at a time, I've decided to compare the files binary/hex data, found
the value of the proper method and created this script to do it for me.
==============================================================================
