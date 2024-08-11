#Requires AutoHotkey v2.0.0 ; Tells the script that v2 is required

global Version := "1.0.0"
Global GyatKey := "F3"

PositionMap := Map( ; Literally copied from A Basement
  "MiniXTL", [1259, 232],
  "MiniXBR", [1313, 288],
  "MiniX", [1285, 262],
  "StupidCatBR", [903, 515],
  "StupidCatTL", [1001, 606]
)

Macros := Map(
    "DiceMerchantMacro", {
        Status:"New | Event | Stable?",
        StatusColor:"d500d5",
        RawLink:"https://raw.githubusercontent.com/SimplyJustBased/MacroShenanigans/main/Macros/DiceMerchantMacro.ahk",
        APILink:"https://api.github.com/repos/SimplyJustBased/MacroShenanigans/commits?path=Macros/DiceMerchantMacro.ahk&page=1&per_page=1",
        MacroFile:"DiceMerchantMacro.ahk",
        Existant:true
    },
    "TreeHouseMacroV2", {
        Status:"Stable | Maintained",
        StatusColor:"Green",
        RawLink:"https://raw.githubusercontent.com/SimplyJustBased/MacroShenanigans/main/Macros/TreeHouseMacroV2.ahk",
        APILink:"https://api.github.com/repos/SimplyJustBased/MacroShenanigans/commits?path=Macros/TreeHouseMacroV2.ahk&page=1&per_page=1",
        MacroFile:"TreeHouseMacroV2.ahk",
        Existant:true
    },
    "MultiMacroV4", {
        Status:"Stable | Maintained",
        StatusColor:"Green",
        RawLink:"https://raw.githubusercontent.com/SimplyJustBased/MacroShenanigans/main/Macros/MultiMacroV4.ahk",
        APILink:"https://api.github.com/repos/SimplyJustBased/MacroShenanigans/commits?path=Macros/MultiMacroV4.ahk&page=1&per_page=1",
        MacroFile:"MultiMacroV4.ahk",
        Existant:true
    },
)

MacroOrder := ["DiceMerchantMacro", "MultiMacroV4", "TreeHouseMacroV2"]

Xs := [40, 270, 500]
Ys := [60, 250, 440]

StupidCatCheck() { ; Literally copied from A Basement
  MiniX := PositionMap["MiniX"]
  MiniXBR := PositionMap["MiniXBR"]
  MiniXTL := PositionMap["MiniXTL"]

  if not PixelSearch(&u,&u, MiniXTL[1], MiniXTL[2], MiniXBR[1], MiniXBR[2], 0xFF0B4E, 5) {
    OutputDebug("`n StupidCat has NOT Been found X VER")
    return false
  }

  if PixelSearch(&u,&u, PositionMap["StupidCatTL"][1], PositionMap["StupidCatTL"][2], PositionMap["StupidCatBR"][1], PositionMap["StupidCatBR"][2], 0x95AACD, 10) {
    OutputDebug("`n StupidCat has Been found")
    return true
  }
  OutputDebug("`n StupidCat has NOT Been found")
  return false
}


GyatKey:: {
  Loop { ; Loops the code
    If WinActive("ahk_exe RobloxPlayerBeta.exe") { ; Checks for Roblox window to be active
      if PixelSearch(&MouseX, &MouseY, 470, 360, 1450, 750, 0x77F40A, 1) { ; Searches for green from buy button in the merchant menu
        Click MouseX, MouseY ; Clicks the location where it detected the color
      }
      if StupidCatCheck(){ ; Checks for error cat
        Click 950, 720 ; Clicks location a bit under middle bottom button incase error message
        SendEvent "{S Down}" ; Goes out of the circle for the shop
        Sleep(1000) ; Waits 1 second 
        SendEvent "{S Up}" ; Stops
        Sleep(200)
        SendEvent "{W Down}" ; Goes back into the circle
        Sleep(1000) ; Waits 1 second 
        SendEvent "{W Up}" ; Stops 
      }
    }
  } 
}

F6::Pause -1
F8::ExitApp