import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)


main = do
     xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
     xmonad $ def
     	    {  modMask		 = mod4Mask
	     , terminal	 	 = "kitty"
	     , borderWidth	 = 2 }
	      

