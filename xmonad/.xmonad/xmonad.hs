import XMonad.Config.Desktop
import System.IO
import System.Exit(exitSuccess)
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad
-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
-- Util
import XMonad.Util.Run(spawnPipe , safeSpawn)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.EZConfig
-- Layout
import XMonad.Layout.Grid
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Gaps
-- Actions
import XMonad.Actions.DynamicWorkspaces()
import System.IO (hPutStrLn)
import XMonad.Actions.CopyWindow(kill1)
import XMonad.Actions.WithAll(sinkAll, killAll)

myWorkspaces = ["www","editor","sys","music","vedio"] 
myBorderWidth = 2
myTerminal = "kitty"
myModMask = mod4Mask 
 
main = do
  xmproc <- spawnPipe "xmobar ~/.xmobarrc"
  xmonad $ ewmh $ desktopConfig
    { manageHook = manageDocks <+> manageHook desktopConfig
    , layoutHook = avoidStruts  $  layoutHook desktopConfig

    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = \x -> hPutStrLn xmproc x
      , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" -- Current workspace in xmobar
      , ppVisible = xmobarColor "#c3e88d" ""                -- Visible but not current workspace
      , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   -- Hidden workspaces in xmobar
      , ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
      , ppTitle = xmobarColor "#d0d0d0" "" . shorten 80     -- Title of active window in xmobar
      , ppSep =  "<fc=#9AEDFE> : </fc>"                     -- Separators in xmobar
      , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
      , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t] }
  
    , normalBorderColor  = "#1f2022"
    , focusedBorderColor = "#a3a3a3"
    , modMask = myModMask
    , terminal = myTerminal
    , startupHook = myStartUpHook
    , workspaces = myWorkspaces
    , borderWidth = myBorderWidth } `additionalKeysP`         myKeys 

myStartUpHook = do
  spawnOnce "feh --bg-scale ~/Pictures/Wallpapers/anime/910251.jpg"
  setWMName "LG3D"
  spawnOnce "xsetroot -cursor_name Bibata_Amber &"
  spawnOnce "emacs --daemon"
  spawn "xrdb -merge ~/.Xresources"
  spawnOnce "xmodmap ~/.xmodmaprc"


myKeys =
    --- Xmonad
        [ ("M-C-r", spawn "xmonad --recompile")      -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart")        -- Restarts xmonad
        , ("M-S-q", io exitSuccess)                  -- Quits xmonad
    
    --- Windows
        , ("M-p", spawn "~/.local/bin/dmenu_wal.sh")
        , ("M-w", kill1)                           -- Kill the currently focused client
        , ("M-C-w", killAll)                         -- Kill all the windows on current workspace
        , ("M-e", spawn "emacs")

    --- Floating windows
        , ("M-<Delete>", withFocused $ windows . W.sink)  -- Push floating window back to tile.
        , ("M-S-<Delete>", sinkAll)                  -- Push ALL floating windows back to tile.
    --- Terminal
        , ("M-<Return>", spawn myTerminal)

    --- Multimedia Keys
        , ("<XF86AudioPlay>", spawn "cmus toggle")
        , ("<XF86AudioPrev>", spawn "cmus prev")
        , ("<XF86AudioNext>", spawn "cmus next")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86Search>", safeSpawn "firefox" ["https://www.google.com/"])
        ]
