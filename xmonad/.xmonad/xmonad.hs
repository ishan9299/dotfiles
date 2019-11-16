import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


myBorderWidth    = 2
myTerminal = "kitty"
myModMask = mod4Mask 
 
main = do
  xmproc <- spawnPipe "xmobar ~/.xmobarrc"
  xmonad $ ewmh desktopConfig 
    { manageHook = manageDocks <+> manageHook desktopConfig
    , layoutHook = avoidStruts  $  layoutHook desktopConfig
    , modMask = myModMask
    , terminal = myTerminal
    , startupHook = myStartUpHook
    , borderWidth = myBorderWidth }
myStartUpHook = do
  spawnOnce "feh --bg-scale ~/Downloads/the-shadow-of-a-mountain-3440×1440.jpg"
  setWMName "LG3D"
  

