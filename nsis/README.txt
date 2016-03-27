
    _                ___       _.--.                                  
    \`.|\..----...-'`   `-._.-'_.-'`                                  
    /  ' `         ,       __.--'                                     
    )/' _/     \   `-_,   /        WE'VE MADE MAJOR STRIDES SINCE THEN
    `-'" `"\_  ,_.-;_.-\_ ',                                          
        _.-'_./   {_.'   ; /   MAJOR STRIDES (Yes really)                          
       {_.-``-'         {_/                              



----------------------------------------------------------------------------
 STEAM CUSTOMIZER SKIN INSTALLER
----------------------------------------------------------------------------

Basically I'm tired of copy pasting into the steam program files folder each time I want to change a Skin. Most apps have this figured out years ago! Anyway, so I present you with a STSKIN file handler.

If you aren't planning on creating Steam Skins, all you need to know is that you can just double click stskin files to install them into Steam. 

Most of the stskin skins can be downloaded from http://steamcustomizer.com (you can also create your own skins with the editor). We'll be working on bringing more Steam Skins into this new convenient format :)

----------------------------------------------------------------------------
 STSKIN FILE FORMAT
----------------------------------------------------------------------------

If you want to convert your existing Steam skin or make a new one, here's how the new file format is structured:

----------------------------------------------------------------------------

- Skin.stskin
  - Skin
  - metadata.ini
  - thumb.jpg

----------------------------------------------------------------------------

SEE ALSO: Example.stskin
Use 7-zip to open up Example.stskin and edit its contents!

----------------------------------------------------------------------------

Create a zip file that has your Skin folder (the one with resources, graphics, etc). Inside of that ZIP file your Skin folder MUST be named "Skin". 

Next, create a text file called metadata.ini with Notepad (Save as * All files and name it metadata.ini) that has this:

[SteamSkin]
Name=Name of the Skin
Author=Your Name
Version=1.0
SkinURL=http://google.com/
AuthorURL=http://google.com/
Description=The quick brown fox jumps over the lazy dog
Thumbnail=thumb.jpg
Rating=лллл
BGColor=0xFFFFFF
TextColor=0x000000


-----------------------------------------------------------------------------

Most of these are self explanatory. The only ones need mentioning are Rating, please use the symbol л as it's converted into Winddings and shown as a star. Also don't go nuts with the stars. I'll be watching.

The Name will be exactly as shown in the Steam settings window.

BGColor and TextColor - You can make the installer preview of your skin look cooler by changing its background and text colors to match the ones of your skin. 

The colors are in HEX, you can pick them with Photoshop or Paint.net, or go here: http://www.color-hex.com/

Make sure to remove the # but keep the 0x in the original file. For example, the color white is #FFFFFF, in our metadata file it needs to be 0xFFFFFF, don't mess with the 0x or it will break something. 

-----------------------------------------------------------------------------

Next step is to include a thumb.jpg. Make sure it's a small JPG file with these dimensions:

300 x 200 pixels at 72dpi. 


-----------------------------------------------------------------------------

That's it, now that you have all these 3 items in your zip folder, you can rename your ZIP folder to stskin.
If you can't see the zip file extension, search for Folder Options in your startmenu, go to View tab and uncheck "Hide extensions for known file types" then click OK.

Now you can see it's named Skin.zip, Rename it to Skin.stskin and double click it. If you've done everything correctly it will show your metadata and install it if you click Install. 

-----------------------------------------------------------------------------

Don't forget to submit your neat skin to the SteamCustomizer.com gallery!

-----------------------------------------------------------------------------
 CREDITS
-----------------------------------------------------------------------------

Project is done by fediaFedia and Lexuzieel

Software is provided as is without any warranties of any kind. Use at your own risk!
