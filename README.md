# ** Gif_replace_disposal_method
_Created by: Lucas de Morais Siqueira (2015/05/04)_  
_Contact: lucas.morais.siqueira@gmail.com_  

What does this script do?
It changes the disposal method to "Replace" (as in Gimp's frame disposal "One frame per layer (replace)"). That is done by  replacing the value of the current Disposal Method field (in the Graphic Control Extension block of the binary gif file).

Why would you do that?
Sometimes when you make an animated gif with a transparent background (in my  case via scripts using Rmagick  / ImageMagick), the disposal is not done as it should be (as it's done for animations with non-transparent background) and each frame is rendered upon the previous one (creating "ghosts", overlapping).  
Most of the the gif processing tools only allow you to chose from a reduced number of disposal methods that do not include the "Replace" method, thus creating the same buggy animated gifs.  
Gimp, however, offers you the "Replace" method, so after changing it a single  file at a time, I've decided to compare the files binary/hex data. Having found the value of the proper method, and decided to create this script to do it for me.
