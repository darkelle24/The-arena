#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <File.au3>
#include <GuiEdit.au3>
#include <EditConstants.au3>
#include <Array.au3>
#include <ProgressConstants.au3>
#include <ColorConstants.au3>
#include <ComboConstants.au3>
#include <Timers.au3>
#include <String.au3>
#include <GDIPlus.au3>
;~ #Include <Icons.au3>
#include <GUICtrlOnHover.au3>
#include <ScrollBarsConstants.au3>
#include <Crypt.au3>
#include <GuiRichEdit.au3>
#include <ListViewConstants.au3>
#include <GuiListView.au3>
#include <StaticConstants.au3>
#include <Sound.au3>
#include <AutoItConstants.au3>
;~ Global Const $tagRECT = "struct; long 275;long 705;long 339;long 1238; endstruct"
;~ 275, 64, 705, 533
;~ &"|"&
AutoItSetOption("GUICloseOnESC", 0)
Global $Competences[12][8]

$Competences[0][0] = "Charge"
$Competences[0][1] = 50
$Competences[0][2] = 2
$Competences[0][3] = 2
$Competences[0][4] = 1 & "|" & 8 & "|" & 1 & "|" & 0 & "|" & 3 & "|" & 0
$Competences[0][5] = 0
$Competences[0][6] = 0
$Competences[0][7] = "Move/Attack" & 100 & "|" & 0.11 & "*AD"

$Competences[1][0] = "ArmorUp"
$Competences[1][1] = 250
$Competences[1][2] = 0
$Competences[1][3] = 3
$Competences[1][4] = 2 & "|" & 0 & "|" & 3 & "|" & 1 & "|" & 2 & "|" & 0
$Competences[1][5] = 0
$Competences[1][6] = 0
$Competences[1][7] = 100 & "+MR" & "|" & 100 & "+Armor"

$Competences[2][0] = "Beyblade"
$Competences[2][1] = 100
$Competences[2][2] = 1
$Competences[2][3] = 3
$Competences[2][4] = 2 & "|" & 2 & "|" & 4 & "|" & 0 & "|" & 1 & "|" & 2.1
$Competences[2][5] = 250 & "|" & 0.5 & "*AD"
$Competences[2][6] = 0 & "|" & 1 & "*AP"
$Competences[2][7] = 120 & "Healself" & "*nbrCible"

$Competences[3][0] = "Dunk"
$Competences[3][1] = 300
$Competences[3][2] = 2
$Competences[3][3] = 4
$Competences[3][4] = 2 & "|" & 2 & "|" & 2 & "|" & 0 & "|" & 1 & "|" & 0
$Competences[3][5] = 400 & "|" & 0.6 & "*AD" & "|" & 0.4 & "*Healthlefttarget"
$Competences[3][6] = 0
$Competences[3][7] = "Reset" & 150.1

$Competences[4][0] = "Smite"
$Competences[4][1] = 250
$Competences[4][2] = 0
$Competences[4][3] = 1
$Competences[4][4] = 2 & "|" & 4 & "|" & 2 & "|" & 0 & "|" & 1 & "|" & 0
$Competences[4][5] = 0
$Competences[4][6] = 200 & "|" & 0.55 & "*AP"


$Competences[5][0] = "Heal"
$Competences[5][1] = 300
$Competences[5][2] = 0
$Competences[5][3] = 2
$Competences[5][4] = 2 & "|" & 5 & "|" & 3 & "|" & 1 & "|" & 2 & "|" & 0
$Competences[5][5] = 0
$Competences[5][6] = 0
$Competences[5][7] = "Heal" & 500 & "|" & 0.3 & "*AP" & "|" & 20 & "*-nbrdecase"

$Competences[6][0] = "Boost"
$Competences[6][1] = 600
$Competences[6][2] = 0
$Competences[6][3] = 4
$Competences[6][4] = 2 & "|" & 3 & "|" & 3 & "|" & 1 & "|" & 2 & "|" & 0
$Competences[6][5] = 0
$Competences[6][6] = 0
$Competences[6][7] = 150 & "Heal" & "|" & 0.4 & "*AP" & "|" & 150 & "Mana" & "|" & 0.45 & "*AP" & "|" & 2 & "+Stam"

$Competences[7][0] = "FireBall"
$Competences[7][1] = 700
$Competences[7][2] = 0
$Competences[7][3] = 3
$Competences[7][4] = 2 & "|" & 4 & "|" & 2 & "|" & 0 & "|" & 1 & "|" & 0
$Competences[7][5] = 0
$Competences[7][6] = 400 & "|" & 0.65 & "*AP"

$Competences[8][0] = "MultiShot"
$Competences[8][1] = 150
$Competences[8][2] = 1
$Competences[8][3] = 2
$Competences[8][4] = 2 & "|" & 4 & "|" & 2 & "|" & 0 & "|" & 1 & "|" & 0
$Competences[8][5] = 200 & "|" & 0.65 & "*AD"
$Competences[8][6] = 200 & "|" & 0.6 & "*AP"

$Competences[9][0] = "DamageUp"
$Competences[9][1] = 400
$Competences[9][2] = 2
$Competences[9][3] = 5
$Competences[9][4] = 2 & "|" & 3 & "|" & 3 & "|" & 1 & "|" & 2 & "|" & 0
$Competences[9][5] = 0
$Competences[9][6] = 0
$Competences[9][7] = 30 & "+AD" & "|" & 0.6 & "*AD" & "|" & 30 & "+AP" & "|" & 0.75 & "*AP"

$Competences[10][0] = "Rewind"
$Competences[10][1] = 500
$Competences[10][2] = 1
$Competences[10][3] = 4
$Competences[10][4] = 2 & "|" & 3 & "|" & 3 & "|" & 1 & "|" & 2 & "|" & 0
$Competences[10][5] = 0
$Competences[10][6] = 0
$Competences[10][7] = "ResetCooldown"

$Competences[11][0] = "JusticeRain"
$Competences[11][1] = 300
$Competences[11][2] = 0
$Competences[11][3] = 2
$Competences[11][4] = 2 & "|" & 4 & "|" & 1 & "|" & 0 & "|" & 1 & "|" & 0
$Competences[11][5] = 350 & "|" & 0.5 & "*AD"
$Competences[11][6] = 350 & "|" & 0.5 & "*AP"

Global $Redteams[3]
Global $Blueteams[3]

Dim $XS_n ;je sias a quoi sa sert ses pour la fonction xpstyle par contre je saurait pas expliqué comment ca marche
If FileExists(@ScriptDir & "\Data") = 0 Then ;Creation de dossiers si data n existe pas
	DirCreate(@ScriptDir & "\Data")
	DirCreate(@ScriptDir & "\Data\Perso")
	DirCreate(@ScriptDir & "\Data\Town")
EndIf
If FileExists(@ScriptDir & "\Data\Perso") = 0 Then ;Creation de perso si data existe mais pas perso
	DirCreate(@ScriptDir & "\Data\Perso")
EndIf

If FileExists(@ScriptDir & "\Data\Town") = 0 Then ;Creation de perso si data existe mais pas Town
	DirCreate(@ScriptDir & "\Data\Town")
EndIf
Global $Sound = 100
;~ 	Global $refrechpng = 100
Global $activatiedview = True
Global $Withoutskin = False
Global $Withoutspaceview = False
Global $touchecompt1 = "41"
Global $touchecompt2 = "5A"
Global $touchecompt3 = "45"
Global $touchecompt4 = "52"
Global $touchenext = "0D"
Global $touchemove = "4D"
If FileExists(@ScriptDir & "\Data\Parametre.ini") = 0 Then

	_FileCreate(@ScriptDir & "\Data\Parametre.ini")
	$paraparaparametre = FileOpen(@ScriptDir & "\Data\Parametre.ini", 2)
	FileWrite($paraparaparametre, "Volume : 100" & @CRLF)
;~ 	FileWrite($paraparaparametre, "Refreshpng : 100" & @CRLF)
	FileWrite($paraparaparametre, "Activer la gestion du sens du regard des perso : True" & @CRLF)
	FileWrite($paraparaparametre, "Sans skin : False" & @CRLF)
	FileWrite($paraparaparametre, "1 competence : 41" & @CRLF)
	FileWrite($paraparaparametre, "2 competence : 5A" & @CRLF)
	FileWrite($paraparaparametre, "3 competence : 45" & @CRLF)
	FileWrite($paraparaparametre, "4 competence : 52" & @CRLF)
	FileWrite($paraparaparametre, "Next : 0D" & @CRLF)
	FileWrite($paraparaparametre, "Move : 4D" & @CRLF)
	FileClose($paraparaparametre)

Else
	$paraparaparametre = FileOpen(@ScriptDir & "\Data\Parametre.ini")
	$texte = FileReadLine($paraparaparametre, 1)
	$Sound1 = StringReplace($texte, "Volume : ", "")
	Global $Sound = Number($Sound1)
;~ 	$texte = FileReadLine($paraparaparametre, 2)
;~ 	Global $refrechpng1 = StringReplace($texte, "Refreshpng : ", "")
;~ 	Global $refrechpng = Number($refrechpng1)
	$texte = FileReadLine($paraparaparametre, 2)
	Global $activatiedview = StringReplace($texte, "Activer la gestion du sens du regard des perso : ", "")
	$texte = FileReadLine($paraparaparametre, 3)
	Global $Withoutskin = StringReplace($texte, "Sans skin : ", "")
	$texte = FileReadLine($paraparaparametre, 4)
	Global $Withoutspaceview = StringReplace($texte, "Sans effet visuel : ", "")
	$texte = FileReadLine($paraparaparametre, 5)
	Global $touchecompt1 = StringReplace($texte, "1 competence : ", "")
	$texte = FileReadLine($paraparaparametre, 6)
	Global $touchecompt2 = StringReplace($texte, "2 competence : ", "")
	$texte = FileReadLine($paraparaparametre, 7)
	Global $touchecompt3 = StringReplace($texte, "3 competence : ", "")
	$texte = FileReadLine($paraparaparametre, 8)
	Global $touchecompt4 = StringReplace($texte, "4 competence : ", "")
	$texte = FileReadLine($paraparaparametre, 9)
	Global $touchenext = StringReplace($texte, "Next : ", "")
	$texte = FileReadLine($paraparaparametre, 10)
	Global $touchemove = StringReplace($texte, "Move : ", "")

	FileClose($paraparaparametre)
EndIf
Global $commande[1][2]
_FileReadToArray(@ScriptDir & "\Data\Commande.txt", $commande, $FRTA_NOCOUNT, "|")
;~ _ArrayDisplay($commande)
SoundSetWaveVolume($Sound)
;~ #Region ### START Koda GUI section ### Form=Q:\MMMMMMM\ISN\Projet isn\Koda\First menu.kxf
Global $Form1 = GUICreate("JEU", 1255, 760, 0, 0)
$Label1 = GUICtrlCreateLabel("ENTER IN THE TOWN", 343, 342, 568, 77)
GUICtrlSetFont(-1, 61, 400, 0, "Microsoft Uighur")
$background = GUICtrlCreatePic("", 0, 0, 1255, 760) ;BitOR($WS_GROUP, $WS_CLIPSIBLINGS)


GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###
$dll = DllOpen("user32.dll")
While 1
	$nMsg = GUIGetMsg()

	If _IsPressed("01", $dll) Then ;detecte le clic gauche
		;ConsoleWrite($nMsg&@CRLF)
		GUICtrlDelete($Label1) ;supprime la gui $label1
		GUICtrlDelete($background)
		ExitLoop(1) ;quitte la boucle while 1
	EndIf
	If $nMsg <> 0 Then ;si aucun bouton n est cliqué
		Switch $nMsg
			Case $GUI_EVENT_CLOSE ;id de la petite croi fermée
				Exit ;quitte le programme

		EndSwitch
	EndIf

WEnd
While _IsPressed("01", $dll) ;04 is Middle Click;permet d emp echer que l info du clique activer reste
	Sleep(10)
WEnd
Sleep(100)
Town()

Func Town()

	#Region ### START Koda GUI section ### Form=Q:\MMMMMMM\ISN\Projet isn\Koda\Town.kxf

	$PlayLocal = GUICtrlCreateButton("Play", 635, 712, 145, 33)
	Global $firstgui1 = $PlayLocal
	$Multi = GUICtrlCreateButton("Multi", 459, 712, 145, 33)
	GUICtrlSetState(-1, $GUI_DISABLE)
	$Option = GUICtrlCreateButton("Option", 1103, 712, 105, 33)
	$Exit = GUICtrlCreateButton("Exit", 47, 720, 105, 33)
	Global $3 = GUICtrlCreatePic(@ScriptDir & "\Image\compliquer\porte 3 Fermée.jpg", 453, 372, 119, 204)
	_GUICtrl_OnHoverRegister(-1, "porteouvert", "portefermee", "porteclique") ;permet que la gui creer precedament si la souris survole cette gui ca va a la fonction "porteouvert" si elle part de la position de la gui elle va a "portefermée" et si on clique ca va a "porteclique"
	GUICtrlSetTip(-1, "New player")
	Global $4 = GUICtrlCreatePic(@ScriptDir & "\Image\compliquer\porte 4 fermée.jpg", 575, 361, 168, 105)
	_GUICtrl_OnHoverRegister(-1, "porteouvert", "portefermee", "porteclique")
	GUICtrlSetTip(-1, "Character View")
	Global $1 = GUICtrlCreatePic(@ScriptDir & "\Image\compliquer\porte une Fermée.jpg", 771, 455, 142, 240)
	_GUICtrl_OnHoverRegister(-1, "porteouvert", "portefermee", "porteclique")
	GUICtrlSetTip(-1, "Shop (Pas encore intégrer)")
	Global $ClickDummy1 = GUICtrlCreateDummy()
	Global $ClickDummy3 = GUICtrlCreateDummy()
	Global $ClickDummy4 = GUICtrlCreateDummy()
	$Pic2 = GUICtrlCreatePic(@ScriptDir & "\Image\maxresdefault.jpg", 0, 695, 1255, 65, BitOR($WS_GROUP, $WS_CLIPSIBLINGS))
	$background = GUICtrlCreatePic(@ScriptDir & "\Image\village jeu 2.jpg", 0, 0, 1255, 695, BitOR($WS_GROUP, $WS_CLIPSIBLINGS))
	GUISetState(@SW_SHOW)
;~  Global $Town[3][5]
;~ $Town[0][0]=456
;~ $Town[0][1]=$Town[0][0]+113
;~ $Town[0][2]=368
;~ $Town[0][3]=$Town[0][2]+177
;~ $Town[0][4]=$Pic4

;~ $Town[1][0]=584
;~ $Town[1][1]=$Town[0][0]+217
;~ $Town[1][2]=320
;~ $Town[1][3]=$Town[0][2]+145
;~ $Town[1][4]=$Pic3

;~ $Town[2][0]=808
;~ $Town[2][1]=$Town[0][0]+113
;~ $Town[2][2]=400
;~ $Town[2][3]=$Town[0][2]+273
;~ $Town[2][4]=$Pic5
	Global $lastgui1 = $background
	$activer = 0
	#EndRegion ### END Koda GUI section ###
	$nMsg = GUIGetMsg()
	While $nMsg <> 0 ;04 is Middle Click;permet d emp echer que l info du clique activer reste
		Sleep(10)
		$nMsg = GUIGetMsg()
	WEnd
	While 1
;~ 	   If BitAND(WinGetState($Form1), 8) Then
;~ 	  $Array = MouseGetPos()
;~ 			For $i = 0 To 2
;~ 				If $Array[0] > $Town[$i][0] And $Array[0] < $Town[$i][1] And $Array[1] > $Town[$i][2] And $Array[1] < $Town[$i][3] And $activer=0 Then
;~ 				   GUICtrlSetState($Town[$i][4],$GUI_SHOW)
;~ 				   $activer=$i
;~ 				    $mmmmd=0
;~ 				Else
;~ 				   $mmmmd=1
;~ 			   EndIf
;~ 			Next
;~ 			If $activer <> 0 And $mmmmd=1 Then
;~ 						 GUICtrlSetState($Town[$activer][4],$GUI_HIDE)
;~ 						 $activer=0
;~ 						 EndIf
;~ 		  EndIf
;~ 		  Sleep(10)
;~ $test = _IsPressed("01", $dll)
;~ 		If $test And BitAND(WinGetState($Form1), 8) Then
;~ 			For $i = 0 To 2
;~ 				If $Array[0] > $Town[$i][0] And $Array[0] < $Town[$i][1] And $Array[1] > $Town[$i][2] And $Array[1] < $Town[$i][3] Then
;~
;~ 					If $i = 0 Then

;~ 					   EndIf
;~ 							While _IsPressed("01", $dll) ;04 is Middle Click
;~ 								Sleep(10)
;~ 							WEnd
;~ 				EndIf
;~ 			Next
;~ 		EndIf
		$nMsg = GUIGetMsg()
		If $nMsg <> 0 Then
			Switch $nMsg
				Case $ClickDummy4
					For $o = $firstgui1 To $lastgui1
						GUICtrlDelete($o)
					Next
					$md = 1
					CHARACTERVIEW($md)
				Case $ClickDummy1
;~ 	temporaire
;~ 	GUICtrlSetImage($iCtrlID,@ScriptDir&"\Image\compliquer\porte une Fermée.jpg",)
				Case $GUI_EVENT_CLOSE
					Exit
				Case $PlayLocal

					Global $gamemode = "local"
					For $o = $firstgui1 To $lastgui1
						GUICtrlDelete($o)
					Next
					$ok = SELECTIONNEPERSO()
					If $ok = 1 Then
						Game()
					Else
						Town()
					EndIf
				Case $Multi

				Case $Option
					For $o = $firstgui1 To $lastgui1
						GUICtrlDelete($o)
					Next
					OPTION()
					Town()
				Case $ClickDummy3
					For $o = $firstgui1 To $lastgui1
						GUICtrlDelete($o)
					Next
					ClassCompt()

				Case $Exit
					Exit
			EndSwitch
		EndIf


	WEnd

EndFunc   ;==>Town
Func porteouvert($iCtrlID)
	Switch $iCtrlID
		Case $1
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte une ouverte.jpg")

		Case $3
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte 3 Ouvert.jpg")

		Case $4
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte 4 ouverte.jpg")

	EndSwitch

EndFunc   ;==>porteouvert

Func portefermee($iCtrlID)
	Switch $iCtrlID
		Case $1
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte une Fermée.jpg")

		Case $3
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte 3 Fermée.jpg")

		Case $4
			GUICtrlSetImage($iCtrlID, @ScriptDir & "\Image\compliquer\porte 4 fermée.jpg")

	EndSwitch

EndFunc   ;==>portefermee
Func porteclique($iCtrlID)
	Switch $iCtrlID
		Case $1
			GUICtrlSendToDummy($ClickDummy1)
		Case $3
			GUICtrlSendToDummy($ClickDummy3)
		Case $4
			GUICtrlSendToDummy($ClickDummy4)
	EndSwitch
EndFunc   ;==>porteclique
;avant ca va etre la partie menu
;si je termine le jeu il y aura normalement 3 different type de combats une premiere contre une ia debile un autre en local et un autre un multi
;prochaine etapes les menus plus creations perso mais pas encore gestion projet ville

Func Game()
	Global $png[100][2]
	Global $i = 0
	Global $hGraphic = 0
	Global $hImage = 0
	Global $Player[8][43]

	Global $J1[1][6] ;Temporaire
	$J1[0][0] = "J1"
	$J1[0][1] = ""
	$J1[0][2] = 3000
	$PVMAX = $J1[0][2]
	$J1[0][3] = 3000
	$MANAMAX = $J1[0][3]
	$J1[0][4] = 3
	$STAMMAX = $J1[0][4]
	$J1[0][5] = 600
	$VITESSE = $J1[0][5]

	If $gamemode = "local" Then ;je vais commencer par la local je vais faire un if pour separer les types
		_GDIPlus_Startup()
		#Region ### START Koda GUI section ### Form=
		Global $Case[100][7]
		$Case[0][0] = 300
		$Case[0][1] = 380
		$Case[0][2] = 108
		$Case[0][3] = 186
		$ha = 65
		$hb = 159
		$i = 0
		For $y = 1 To 6
			$ba = 202
			$bb = 287
;~ Chaque case fait maintenant 83/83
			For $n = 0 To 7
				$Case[$n + $i][0] = $y & $n + 1
				$Case[$n + $i][1] = $ba + 85
				$ba = $Case[$n + $i][1]
				$Case[$n + $i][2] = $bb + 85
				$bb = $Case[$n + $i][2]
				$Case[$n + $i][3] = $ha
				$Case[$n + $i][4] = $hb
			Next
			$p = $i
			$i = $p + 8
			$ha = 2 + $hb
			$hb = $ha + 83
		Next
		Global $CASECALCUL[100][7]
		For $o = 0 To 99
			If $Case[$o][0] = "" Then
				ExitLoop(1)
			EndIf
			For $y = 0 To 4
				$CASECALCUL[$o][$y] = $Case[$o][$y]
			Next
		Next



		Global $joueur = 0
		$n = 0
;~ 	$pionx = 284
;~ 	$pionxa = 84
;~ 	$piony = 74
;~ 	$pionya = 84
		If $Blueteams[0] = 2 Then
			$Case[0][5] = $Blueteams[1]
			$Case[40][5] = $Blueteams[2]
		Else
			$Case[0][5] = $Blueteams[1]
		EndIf
		If $Redteams[0] = 2 Then
			$Case[7][5] = $Redteams[1]
			$Case[47][5] = $Redteams[2]
		Else
			$Case[47][5] = $Redteams[1]
		EndIf
;~ _ArrayDisplay($Case)
;~ 	$Case[0][5] = "J1" ;Pour l instant 1 joueur placer manuellement a faire apres a plusieurs
;~ 	$o =
		$md = 0
		For $i = 0 To 47
			$case2 = $Case[$i][5]
			If $case2 <> "" Then

				Global $champ[1][17]
				$file = FileOpen(@ScriptDir & "\Data\Perso\" & $Case[$i][5] & ".txt") ;ouvre un fichier texte
				$adecrypter = FileRead($file) ;lis le fichier texte
				FileClose($file) ;ferme le fichier texte
				$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4) ;decrypte le texte grace au mdp darkelle24 et renvoie un code binaire
				$leeel = BinaryToString($leel) ;permet de convertir du binaire en texte
				_FileCreate(@ScriptDir & "\Data\Perso\temp.txt") ;creer un fichier texte
				$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2) ;ouvre un fichier texte en mode ecriture et suppression de ce qu il y avait avant
				FileWrite($file, $leeel) ;erit le texte dechiffrer dans le nouveau fichier texte
				$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|") ;permet de convertir le texte du fichier texte en tableau grace au marqueur |
				FileClose($file)
				FileDelete(@ScriptDir & "\Data\Perso\temp.txt")
				For $o = 0 To 16
					$Player[$md][$o] = $champ[0][$o]
				Next
				$Player[$md][17] = $champ[0][2]
				$Player[$md][18] = $champ[0][3]
				$Player[$md][19] = $champ[0][8]
				$Player[$md][29] = 0
				$Player[$md][30] = 0
				$Player[$md][31] = 0
				$Player[$md][32] = 0
;~ 	 _ArrayDisplay($Player)
;~ 			$Player[$o][0] = $J1[0][0] ;Je sais pas encore ou recup le nom
;~ 	  $Player[$o][1]=$Profil ;je sais encore ou recup leur donnée
;~ 			$Player[$o][2] = $PVMAX
;~ 			$Player[$o][3] = $MANAMAX
;~ 			$Player[$o][4] = $STAMMAX
;~ 			$Player[$o][5] = $VITESSE

;~ 		Juste dans le start apres valeur des pv
;~ 			$Player[$o][11] = $PVMAX
;~ 			$Player[$o][12] = $MANAMAX
;~ 			$Player[$o][13] = $STAMMAX

;~ 			$Pic12 = GUICtrlCreatePic("", 16, 48, 41, 41)
;~ 			$Player[$o][7] = $Pic12
;~ 				XPStyle(1)
;~ 				$Progress4 = GUICtrlCreateProgress(64, 54, 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
;~ 				GUICtrlSetData(-1, 100)
;~ 				GUICtrlSetColor(-1, 0x00FF00)
;~ 				GUICtrlSetBkColor(-1, 0x800000)
;~ 				GUICtrlSetTip(-1, "HP: " & $Player[$md][17] & "/" & $Player[$md][17])
;~ 				$Player[$md][20] = $Progress4

;~ 				$Progress5 = GUICtrlCreateProgress(64, 68, 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
;~ 				GUICtrlSetData(-1, 100)
;~ 				GUICtrlSetColor(-1, 0x00FFFF)
;~ 				GUICtrlSetBkColor(-1, 0x000080)
;~ 				GUICtrlSetTip(-1, "MANA: " & $Player[$md][18] & "/" & $Player[$md][18])
;~ 				$Player[$md][21] = $Progress5

;~ 				$Progress6 = GUICtrlCreateProgress(64, 80, 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
;~ 				GUICtrlSetData(-1, 100)
;~ 				GUICtrlSetColor(-1, 0xFFFF00)
;~ 				GUICtrlSetBkColor(-1, 0x808000)
;~ 				GUICtrlSetTip(-1, "STAM: " & $Player[$md][19] & "/" & $Player[$md][19])
;~ 				$Player[$md][22] = $Progress6
;~ 				XPStyle(0)
;~ 				$Pic4 = GUICtrlCreatePic(@ScriptDir & "\Image\maxresdefault.jpg", 8, 40 + ($o * 72), 233, 57, BitOR($WS_GROUP, $WS_CLIPSIBLINGS))
;~ 			$Player[$o][6] = $Pic4

				$md += 1
			EndIf
		Next


		PERSO()
		;met les coordonnée de depart
		If $Blueteams[0] = 2 Then
			For $o = 0 To 3
				If $Blueteams[1] = $Player[$o][0] Then
					$Player[$o][24] = 284
					$Player[$o][25] = 84
					$Player[$o][26] = 74
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "droite"
				ElseIf $Blueteams[2] = $Player[$o][0] Then
					$Player[$o][24] = 284
					$Player[$o][25] = 84
					$Player[$o][26] = 510
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "droite"
				EndIf
			Next
		Else
			For $o = 0 To 3
				If $Blueteams[1] = $Player[$o][0] Then
					$Player[$o][24] = 284
					$Player[$o][25] = 84
					$Player[$o][26] = 74
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "droite"
				EndIf
			Next
		EndIf
		If $Redteams[0] = 2 Then
			For $o = 0 To 3
				If $Redteams[1] = $Player[$o][0] Then
					$Player[$o][24] = 882
					$Player[$o][25] = 84
					$Player[$o][26] = 74
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "gauche"
				ElseIf $Redteams[2] = $Player[$o][0] Then
					$Player[$o][24] = 882
					$Player[$o][25] = 84
					$Player[$o][26] = 510
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "gauche"
				EndIf
			Next
		Else
			For $o = 0 To 3
				If $Redteams[1] = $Player[$o][0] Then
					$Player[$o][24] = 882
					$Player[$o][25] = 84
					$Player[$o][26] = 510
					$Player[$o][27] = 84
					$Player[$o][39] = "vivant"
					$Player[$o][40] = "gauche"
				EndIf
			Next
		EndIf
		Global $ingenieurdroite = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\ingenieurdroite.png") ;load une image
		Global $ingenieurgauche = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\ingenieurgauche.png")
		Global $guerrierdroite = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\guerrierdroite.png")
		Global $guerriergauche = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\guerriergauche.png")
		Global $magiciendroite = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\magiciendroite.png")
		Global $magiciengauche = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\magiciengauche.png")
		Global $sansskin = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\contact-1293388_960_720.png")
		Global $hImage2 = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\quadrillage.png")
		Global $qdpkqojk = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\fleche_rouge.png")
		Global $moche = _GDIPlus_ImageLoadFromFile(@ScriptDir & "\Image\Burp.png")
;~ 	Global $Afficherpng[5][6]
;~ 	$Afficherpng[0][0]=@ScriptDir & "\Image\quadrillage.png"
;~ 	$Afficherpng[0][1]= 275
;~ 	$Afficherpng[0][2]=64
;~ 	$Afficherpng[0][3]= 705
;~ 	$Afficherpng[0][4]= 533
;~ 	$Afficherpng[0][5]  = _GDIPlus_ImageLoadFromFile($Afficherpng[0][0])
;~ 	For $o=0 To 3
;~ 		$Afficherpng[$o+1][0]=@ScriptDir & "\Image\contact-1293388_960_720.png"
;~ 	$Afficherpng[$o+1][1]=$Player[$o][24]
;~ 	$Afficherpng[$o+1][2]=$Player[$o][25]
;~ 	$Afficherpng[$o+1][3]= $Player[$o][26]
;~ 	$Afficherpng[$o+1][4]= $Player[$o][27]
;~ 	$Afficherpng[$o+1][5]  = _GDIPlus_ImageLoadFromFile($Afficherpng[0][0])
;~ 			Next

		Global $hGraphic = _GDIPlus_GraphicsCreateFromHWND($Form1)
		Global $tour = 0
		Global $TETEDUPERSO = GUICtrlCreatePic("", 8, 630, 120, 120)
		$firstgui = $TETEDUPERSO
		XPStyle(1)
		Global $Progress1 = GUICtrlCreateProgress(201, 632, 425, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
		; penser a mettre les pv max une fois fiches perso terminer
		GUICtrlSetData(-1, 100)
		GUICtrlSetColor(-1, 0x00FF00)
		GUICtrlSetBkColor(-1, 0x800000)
		Global $Progress2 = GUICtrlCreateProgress(201, 677, 425, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
		; penser a mettre les mana max une fois fiches perso terminer
		GUICtrlSetData(-1, 100)
		GUICtrlSetColor(-1, 0x00FFFF)
		GUICtrlSetBkColor(-1, 0x000080)
		Global $Progress3 = GUICtrlCreateProgress(201, 724, 425, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
		;penser a mettre les stam max une fois fiches perso terminer
		GUICtrlSetData(-1, 100)
		$test = GUICtrlSetColor($Progress3, 0xFFFF00)

		GUICtrlSetBkColor(-1, 0x808000)
		XPStyle(0)
;~ $Label1 = GUICtrlCreateLabel("Label1", 394, 636, 36, 17, BitOR($WS_GROUP, $WS_CLIPSIBLINGS ,$SS_CENTER))
		Global $Label1 = GUICtrlCreateLabel("Text", 340, 636, 120, 17, $SS_CENTER, $WS_EX_TOPMOST)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetData(-1, "HP: " & $Player[0][2] & "/" & $Player[0][2])
		Global $Label2 = GUICtrlCreateLabel("Label1", 340, 681, 120, 17, $SS_CENTER, $WS_EX_TOPMOST)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetData(-1, "MANA: " & $Player[0][3] & "/" & $Player[0][3])

		Global $Label3 = GUICtrlCreateLabel("Label1", 340, 728, 120, 17, $SS_CENTER, $WS_EX_TOPMOST)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetData(-1, "STAM: " & Int($Player[0][8] / 100) & "/" & Int($Player[0][8] / 100))
		Global $aPos = WinGetPos("JEU")

		Global $desactiver1 = 0
		Global $desactiver2 = 0
		Global $desactiver3 = 0
		Global $desactiver4 = 0

		Global $Compt1 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][9] & ".jpg", 680, 680, 73, 73)

		Global $Compt2 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][10] & ".jpg", 784, 680, 73, 73)
		Global $Compt3 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][11] & ".jpg", 880, 680, 73, 73)
		Global $Compt4 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][12] & ".jpg", 976, 680, 73, 73)
		Global $Stam1 = GUICtrlCreateLabel("", 680, 736, 32, 17)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		Global $Mana1 = GUICtrlCreateLabel("", 718, 736, 32, 17, $SS_RIGHT)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		Global $Stam2 = GUICtrlCreateLabel("", 784, 736, 32, 17)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $Mana2 = GUICtrlCreateLabel("", 824, 736, 32, 17, $SS_RIGHT)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $Mana3 = GUICtrlCreateLabel("", 920, 736, 32, 17, $SS_RIGHT)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $Stam3 = GUICtrlCreateLabel("", 880, 736, 32, 17)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $Mana4 = GUICtrlCreateLabel("", 1016, 736, 32, 17, $SS_RIGHT)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $Stam4 = GUICtrlCreateLabel("", 976, 736, 32, 17)
		GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xC8C8C8)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		For $o = 0 To 11
			For $y = 9 To 12

				If $Player[$tour][$y] = $Competences[$o][0] Then
					Switch $y
						Case 9
							GUICtrlSetData($Stam1, $Competences[$o][2])
							GUICtrlSetData($Mana1, $Competences[$o][1])
						Case 10
							GUICtrlSetData($Stam2, $Competences[$o][2])
							GUICtrlSetData($Mana2, $Competences[$o][1])
						Case 11
							GUICtrlSetData($Stam3, $Competences[$o][2])
							GUICtrlSetData($Mana3, $Competences[$o][1])
						Case 12
							GUICtrlSetData($Stam4, $Competences[$o][2])
							GUICtrlSetData($Mana4, $Competences[$o][1])

					EndSwitch
				EndIf
			Next
		Next
		$Pic666 = GUICtrlCreatePic(@ScriptDir & "\Image\maxresdefault.jpg", 0, 616, 1281, 145, BitOR($WS_GROUP, $WS_CLIPSIBLINGS))

		Global $toursuivant = GUICtrlCreateButton("Next", 1080, 640, 169, 41)
;~ 	$ghssgf = GUICtrlCreateButton("DEAL DAMAGE", 1032, 136, 161, 49)
		Global $historique = _GUICtrlRichEdit_Create($Form1, "", 992, 48, 249, 401, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $ES_WANTRETURN, $WS_VSCROLL, $ES_MULTILINE))
;~ 	ConsoleWrite(@error & @CRLF)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xF8F8FF)

		Global $Label17 = GUICtrlCreateLabel("Historique :", 992, 16, 84, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label45 = GUICtrlCreateLabel("Position actuelle : ", 1080, 728, 175, 24, Default, $WS_EX_TOPMOST)
		GUICtrlSetFont(-1, 13, 800, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0x3399FF)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $mode = GUICtrlCreateLabel("En cours :", 1080, 704, 202, 24)
		GUICtrlSetFont(-1, 6, 800, 0, "MS Sans Serif")

		GUICtrlSetColor(-1, 0x3399FF)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		Global $modeactived = 0




		For $i = 0 To 47
			If $Case[$i][5] = $Player[$tour][0] Then
				$LOL = Floor($Case[$i][0] / 10)
				If $LOL = 1 Then
					$lettre = "A"
				ElseIf $LOL = 2 Then
					$lettre = "B"
				ElseIf $LOL = 3 Then
					$lettre = "C"
				ElseIf $LOL = 4 Then
					$lettre = "D"
				ElseIf $LOL = 5 Then
					$lettre = "E"
				ElseIf $LOL = 6 Then
					$lettre = "F"
				EndIf
				GUICtrlSetData($Label45, "Position actuelle : " & $lettre & ($Case[$i][0] - $LOL * 10))
				ExitLoop(1)
			EndIf
		Next
		Global $Label55 = GUICtrlCreateLabel("Label5", 696, 624, 346, 28, $SS_CENTER, $WS_EX_TOPMOST)
		GUICtrlSetFont(-1, 15, 800, 0, "MS Sans Serif")
		GUICtrlSetData($Label55, $Player[$tour][0])
		GUICtrlSetColor(-1, 0xFF0000)
		$LOL = GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		Global $compteur1 = 0
		Global $compteur2 = 0
		Global $compteur3 = 0
		Global $compteur4 = 0
		Global $Label6 = 0
		Global $Label7 = 0
		Global $Label8 = 0
		Global $Label9 = 0
;~ 	Global $actived1 = 0
;~ 	Global $actived2 = 0
;~ 	Global $actived3 = 0
;~ 	Global $actived4 = 0
		GUISetState(@SW_SHOW)
		#EndRegion ### END Koda GUI section ###
;~ 		GUIRegisterMsg($WM_ACTIVATE,"WM_PAINT")
;~ 		$sdd=GUISetOnEvent($GUI_EVENT_RESTORE,"WM_PAINT")
;~ 		ConsoleWrite($sdd&@CRLF)
		GUIRegisterMsg($WM_MOVE, "CALCUL")
;~ 		GUIRegisterMsg($WM_SETFOCUS,"WM_PAINT")
		$oldtext = ""
		_GUICtrlRichEdit_AppendText($historique, "[" & @HOUR & ":" & @MIN & "]" & " : " & "Au tours de ' " & $Player[$tour][0] & " '")
		$firstchar = _GUICtrlRichEdit_GetFirstCharPosOnLine($historique)
		$mot = _GUICtrlRichEdit_FindTextInRange($historique, $Player[$tour][0], $firstchar)
		_GUICtrlRichEdit_SetSel($historique, $mot[0], $mot[1], True)
		_GUICtrlRichEdit_SetCharColor($historique, 0xEB139B)
		_GUICtrlRichEdit_ScrollToCaret($historique)
		_GUICtrlRichEdit_Deselect($historique)
		If $Player[$tour][13] = "Guerrier" Then
			GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\guerrier.jpg")
		ElseIf $Player[$tour][13] = "Magicien" Then
			GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\magicien.jpg")
		ElseIf $Player[$tour][13] = "Ingénieur" Then
			GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\ingenieur.jpg")
		EndIf
;~ 		 $Button2 = GUICtrlCreateButton("Menu", 1200, 8, 33, 33)
		Global $tourscomplet = 0
;~ 		Global $tourbloquer = 0
		WM_PAINT()
		Global $active = 1
		While 1
			If $modeactived = 0 Then
				GUICtrlSetData($mode, "En cours :Attente du joueur")

				$modeactived = 1
			EndIf
;~ 			$tourbloquer += 1
;~ 			If $tourbloquer = $refrechpng Then
;~ 				WM_PAINT()

;~ 				$tourbloquer = 0
;~ 			EndIf
			If BitAND(WinGetState($Form1), 16) And $active = 1 Then
;~ 				ConsoleWrite("ok1" & @CRLF)
				$active = 0
			EndIf
			If BitAND(WinGetState($Form1), 8) And $active = 0 Then
;~ 				ConsoleWrite("ok2" & @CRLF)
				WM_PAINT()
				$active = 1
			EndIf
			If BitAND(WinGetState($Form1), 8) Then
				If _IsPressed("01", $dll) Then

					$Array = MouseGetPos()
					Global $aPos = WinGetPos("JEU")
					GUICtrlSetData($mode, "En cours :Chargement déplacement")
					$modeactived = 0

					For $i = 0 To 47
						If $Array[0] > $CASECALCUL[$i][1] And $Array[0] < $CASECALCUL[$i][2] And $Array[1] > $CASECALCUL[$i][3] And $Array[1] < $CASECALCUL[$i][4] Then
;~             MsgBox(0,"",$Case[$i][0])
							If $Case[$i][5] = $Player[$tour][0] Then
								If Int($Player[$tour][19] / 100) <> 0 Then
									GUICtrlSetData($mode, "En cours :Creation des cases de deplacement")
									SHOWCASEMOVE($i)
									While _IsPressed("01", $dll) ;04 is Middle Click
										Sleep(10)
									WEnd

								EndIf
								ExitLoop(1)


							EndIf

						ElseIf $Array[0] > 680 + $aPos[0] And $Array[0] < 680 + 73 + $aPos[0] And $Array[1] > 680 + $aPos[1] And $Array[1] < 680 + 73 + $aPos[1] Then
							If $desactiver1 = 0 Then
								COMPETENCE(1)
							EndIf
							ExitLoop(1)
						ElseIf $Array[0] > 784 + $aPos[0] And $Array[0] < 784 + 73 + $aPos[0] And $Array[1] > 680 + $aPos[1] And $Array[1] < 680 + 73 + $aPos[1] Then
							If $desactiver2 = 0 Then
								COMPETENCE(2)

							EndIf
							ExitLoop(1)
						ElseIf $Array[0] > 880 + $aPos[0] And $Array[0] < 880 + 73 + $aPos[0] And $Array[1] > 680 + $aPos[1] And $Array[1] < 680 + 73 + $aPos[1] Then
							If $desactiver3 = 0 Then
								COMPETENCE(3)

							EndIf
							ExitLoop(1)
						ElseIf $Array[0] > 976 + $aPos[0] And $Array[0] < 976 + 73 + $aPos[0] And $Array[1] > 680 + $aPos[1] And $Array[1] < 680 + 73 + $aPos[1] Then
							If $desactiver4 = 0 Then
								COMPETENCE(4)

							EndIf
							ExitLoop(1)
						EndIf
					Next

				ElseIf _IsPressed("1B", $dll) Then
					While _IsPressed("1B", $dll)
						Sleep(10)
					WEnd
					Menu()
				ElseIf _IsPressed($touchemove, $dll) Then
					For $i = 0 To 47
						If $Case[$i][5] = $Player[$tour][0] Then
							If Int($Player[$tour][19] / 100) <> 0 Then
								GUICtrlSetData($mode, "En cours :Creation des cases de deplacement")
								SHOWCASEMOVE($i)
								While _IsPressed("01", $dll) ;04 is Middle Click
									Sleep(10)
								WEnd

							EndIf
							ExitLoop(1)
						EndIf
					Next
				ElseIf _IsPressed($touchecompt1, $dll) Then
					If $desactiver1 = 0 Then
						While _IsPressed($touchecompt1, $dll)
							Sleep(10)
						WEnd
						While 1 ;probleme resout en attendant de trouver une soluce
							COMPETENCE(1)
						WEnd
					EndIf
				ElseIf _IsPressed($touchecompt2, $dll) Then
					If $desactiver2 = 0 Then
						While _IsPressed($touchecompt2, $dll)
							Sleep(10)
						WEnd
						While 1 ;probleme resout en attendant de trouver une soluce
							COMPETENCE(2)
						WEnd
					EndIf
				ElseIf _IsPressed($touchecompt3, $dll) Then
					If $desactiver3 = 0 Then
						While _IsPressed($touchecompt3, $dll)
							Sleep(10)
						WEnd
						While 1 ;probleme resout en attendant de trouver une soluce
							COMPETENCE(3)
						WEnd
					EndIf
				ElseIf _IsPressed($touchecompt4, $dll) Then
					If $desactiver4 = 0 Then
						While _IsPressed($touchecompt4, $dll)
							Sleep(10)
						WEnd
						While 1 ;probleme resout en attendant de trouver une soluce
							COMPETENCE(4)
						WEnd
					EndIf
				ElseIf _IsPressed($touchenext, $dll) Then
					ControlClick($Form1, "", $toursuivant)
					While _IsPressed($touchenext, $dll)
						Sleep(10)
					WEnd
				EndIf
			EndIf

			$nMsg = GUIGetMsg()
			If $nMsg <> 0 Then
				Switch $nMsg
					Case $GUI_EVENT_CLOSE
;~ 	   _GDIPlus_Shutdown()
						Exit
;~ 				Case $ghssgf ;darkelle24
;~ 					$brah = $Player[$tour][17]
;~ 					$brah -= Random(10, 2000, 1)
;~ 					$Player[$tour][17] = $brah
;~ 					$brah = $Player[$tour][18]
;~ 					$brah -= Random(10, 2000, 1)
;~ 					$Player[$tour][18] = $brah

;~ 					PERSO(0)
					Case $toursuivant

						GUICtrlSetData($mode, "En cours :Tour suivant")
						$modeactived = 0
						$Pic6676 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", 200, $tour * 72 + 48, 33, 41)

						GUICtrlDelete($Pic6676)

						If $compteur1 = 1 Then
							GUICtrlDelete($Player[$tour][35])
							$compteur1 = 0
						EndIf
						If $compteur2 = 1 Then
							GUICtrlDelete($Player[$tour][36])
							$compteur2 = 0
						EndIf
						If $compteur3 = 1 Then
							GUICtrlDelete($Player[$tour][37])
							$compteur3 = 0
						EndIf
						If $compteur4 = 1 Then
							GUICtrlDelete($Player[$tour][38])
							$compteur4 = 0
						EndIf

						$tour += 1
						If $Player[$tour][6] = "" Or $tour = 4 Then
							$tour = 0
							$tourscomplet += 1
							phrasehisto(@CRLF & @CRLF & "[" & @HOUR & ":" & @MIN & "]" & " : " & "Tours " & $tourscomplet, 8)


							For $o = 0 To 3
;~ 							$Player[$o][19]+=200
								If $Player[$o][39] = "vivant" Then
									$LOL = Int($Player[$o][8] / 200)
									$intothejungle = Int($Player[$o][2] / 20)
									$chepakichui = Int($Player[$o][3] / 10)
									If $Player[$o][29] <> 0 Then
										$Player[$o][29] -= 1
									EndIf
									If $Player[$o][30] <> 0 Then
										$Player[$o][30] -= 1
									EndIf
									If $Player[$o][31] <> 0 Then
										$Player[$o][31] -= 1
									EndIf
									If $Player[$o][32] <> 0 Then
										$Player[$o][32] -= 1
									EndIf
									If $LOL + Int($Player[$o][19] / 100) > Int($Player[$o][8] / 100) Then
										$Player[$o][19] = $Player[$o][8]
									Else
										$Player[$o][19] += $LOL * 100
									EndIf
									If $intothejungle + $Player[$o][17] > $Player[$o][2] Then
										$Player[$o][17] = $Player[$o][2]
									Else
										$Player[$o][17] += $intothejungle
									EndIf
									If $chepakichui + $Player[$o][18] > $Player[$o][3] Then
										$Player[$o][18] = $Player[$o][3]
									Else
										$Player[$o][18] += $chepakichui
									EndIf
								EndIf
							Next
						EndIf
						If $Player[$tour][39] = "Au valhala" Then
							ControlClick($Form1, "", $toursuivant)

						Else
							WM_PAINT()
							phrasehisto(@CRLF & @CRLF & "[" & @HOUR & ":" & @MIN & "]" & " : " & "Au tours de ' " & $Player[$tour][0] & " '", 8, $Player[$tour][0], 0xEB139B)


							$me = $Player[$tour][0]
							GUICtrlSetData($Label55, $Player[$tour][0])
							If $Player[$tour][29] <> 0 Then

								GUICtrlSetImage($Compt1, @ScriptDir & "\Image\Compétences\desactiver\" & $Player[$tour][9] & ".jpg")
								$Player[$tour][35] = GUICtrlCreateLabel("", 708, 698, 28, 56)
								GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
								GUICtrlSetColor(-1, 0xFF0000)
								GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
								$compteur1 = 1
								GUICtrlSetData($Player[$tour][35], $Player[$tour][29])
								Global $desactiver1 = 1

							Else
								GUICtrlSetImage($Compt1, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][9] & ".jpg")
								Global $desactiver1 = 0
							EndIf
							If $Player[$tour][30] <> 0 Then


								GUICtrlSetImage($Compt2, @ScriptDir & "\Image\Compétences\desactiver\" & $Player[$tour][10] & ".jpg")
								$Player[$tour][36] = GUICtrlCreateLabel("", 812, 698, 28, 56)
								GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
								GUICtrlSetColor(-1, 0xFF0000)
								GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
								$compteur2 = 1
								GUICtrlSetData($Player[$tour][36], $Player[$tour][30])
								Global $desactiver2 = 1

							Else
								GUICtrlSetImage($Compt2, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][10] & ".jpg")
								Global $desactiver2 = 0
							EndIf
							If $Player[$tour][31] <> 0 Then


								GUICtrlSetImage($Compt3, @ScriptDir & "\Image\Compétences\desactiver\" & $Player[$tour][11] & ".jpg")
								$Player[$tour][37] = GUICtrlCreateLabel("", 907, 698, 28, 56)
								GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
								GUICtrlSetColor(-1, 0xFF0000)
								GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
								$compteur3 = 1
								GUICtrlSetData($Player[$tour][37], $Player[$tour][31])
								Global $desactiver3 = 1

							Else
								GUICtrlSetImage($Compt3, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][11] & ".jpg")
								Global $desactiver3 = 0
							EndIf
							If $Player[$tour][32] <> 0 Then

								GUICtrlSetImage($Compt4, @ScriptDir & "\Image\Compétences\desactiver\" & $Player[$tour][12] & ".jpg")
								$Player[$tour][38] = GUICtrlCreateLabel("", 1005, 698, 28, 56)
								GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
								GUICtrlSetColor(-1, 0xFF0000)
								GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
								$compteur4 = 1
								GUICtrlSetData($Player[$tour][38], $Player[$tour][32])
								Global $desactiver4 = 1

							Else
								GUICtrlSetImage($Compt4, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][12] & ".jpg")
								Global $desactiver4 = 0
							EndIf
							If $Player[$tour][13] = "Guerrier" Then
								GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\guerrier.jpg")
							ElseIf $Player[$tour][13] = "Magicien" Then
								GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\magicien.jpg")
							ElseIf $Player[$tour][13] = "Ingénieur" Then
								GUICtrlSetImage($TETEDUPERSO, @ScriptDir & "\Image\ingenieur.jpg")
							EndIf
;~ 					 _ArrayDisplay($Player)
							For $o = 0 To 11
								For $y = 9 To 12

									If $Player[$tour][$y] = $Competences[$o][0] Then
										Switch $y
											Case 9
												GUICtrlSetData($Stam1, $Competences[$o][2])
												GUICtrlSetData($Mana1, $Competences[$o][1])
											Case 10
												GUICtrlSetData($Stam2, $Competences[$o][2])
												GUICtrlSetData($Mana2, $Competences[$o][1])
											Case 11
												GUICtrlSetData($Stam3, $Competences[$o][2])
												GUICtrlSetData($Mana3, $Competences[$o][1])
											Case 12
												GUICtrlSetData($Stam4, $Competences[$o][2])
												GUICtrlSetData($Mana4, $Competences[$o][1])

										EndSwitch
									EndIf
								Next
							Next
							For $o = $Stam1 To $Stam4
								GUICtrlSetColor($o, 0xC8C8C8)
							Next
							WM_PAINT()
							PERSO(0)
						EndIf
				EndSwitch
			EndIf

		WEnd
	ElseIf $gamemode = "multijoueur" Then


	ElseIf $gamemode = "bot" Then



	EndIf
EndFunc   ;==>Game
;~ Func WM_PAINT($hWnd = "",$msg= "",$testlol= "",$lol="")
Func WM_PAINT($hWnd = "")
;~ 	If $testlol<>"0x00000000" Then
;~ ConsoleWrite("AHHHHHHHHHHH = "&$lol&@CRLF)
;~ 		ConsoleWrite("fait des truc chelou = "&$testlol&@CRLF)
;~ 		ConsoleWrite("ID = "&$msg&@CRLF)


;~     _WinAPI_RedrawWindow($Form1,  "struct;long 275;long 705;long 339;long 1238; endstruct", "", BitOR($RDW_VALIDATE , $RDW_UPDATENOW, $RDW_FRAME, $RDW_NOINTERNALPAINT));
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 275, 64, 705, 533)
	For $o = 0 To 3
		If $Player[$o][39] <> "Au valhala" Then
			$pionx = $Player[$o][24]
			$pionxa = $Player[$o][25]
			$piony = $Player[$o][26]
			$pionya = $Player[$o][27]
			If $Withoutskin = "True" Then
				_GDIPlus_GraphicsDrawImageRect($hGraphic, $sansskin, $pionx, $piony, $pionxa, $pionya)
			Else
				If $Player[$o][13] = "Guerrier" Then
					If $Player[$o][40] = "droite" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $guerrierdroite, $pionx, $piony, $pionxa, $pionya)
					ElseIf $Player[$o][40] = "gauche" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $guerriergauche, $pionx, $piony, $pionxa, $pionya)
					EndIf
				ElseIf $Player[$o][13] = "Magicien" Then
					If $Player[$o][40] = "droite" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $magiciendroite, $pionx, $piony, $pionxa, $pionya)
					ElseIf $Player[$o][40] = "gauche" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $magiciengauche, $pionx, $piony, $pionxa, $pionya)
					EndIf
				ElseIf $Player[$o][13] = "Ingénieur" Then
					If $Player[$o][40] = "droite" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $ingenieurdroite, $pionx, $piony, $pionxa, $pionya)
					ElseIf $Player[$o][40] = "gauche" Then
						_GDIPlus_GraphicsDrawImageRect($hGraphic, $ingenieurgauche, $pionx, $piony, $pionxa, $pionya)
					EndIf
				EndIf
			EndIf
		EndIf


;~ 				$Pic13 = GUICtrlCreatePic("", 240, 48, 33, 41)
;~ $Pic14 = GUICtrlCreatePic("", 240, 120, 33, 41)
;~ $Pic15 = GUICtrlCreatePic("", 240, 192, 33, 41)
;~ $Pic16 = GUICtrlCreatePic("", 240, 264, 33, 41)
;~ 			PNG(@ScriptDir & "\Image\contact-1293388_960_720.png", $pionx, $piony, $pionxa, $pionya)
	Next
;~ 			Consolewrite($hWnd&@CRLF)

	$burp = $tour * 72 + 48
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $qdpkqojk, 200, $burp, 33, 41)
;~ EndIf
;~     Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_PAINT
;~

Func CALCUL()
	Global $aPos = WinGetPos("JEU")
	For $o = 0 To 99
		If $Case[$o][0] = "" Then
			ExitLoop(1)
		EndIf
		For $y = 1 To 2
			$CASECALCUL[$o][$y] = $Case[$o][$y] + $aPos[0]
		Next
		For $y = 3 To 4
			$CASECALCUL[$o][$y] = $Case[$o][$y] + $aPos[1]
		Next
	Next

	Return $GUI_RUNDEFMSG
EndFunc   ;==>CALCUL
;~ Func PNG($image, $nX, $nY, $nW, $nH)
;~ 	$mm = 0
;~ 	_GDIPlus_Startup()

;~ 	Global $hImage = _GDIPlus_ImageLoadFromFile($image)


;~ 	Global $hGraphic = _GDIPlus_GraphicsCreateFromHWND($Form1)

;~ 	$test = _GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage, $nX, $nY, $nW, $nH)

;~ 	$png[0][$i]=$hImage
;~ 	$png[1][$i]=$hGraphic
;~ 	$mm=$i
;~ 	Global $i=$mm+1


;~ EndFunc   ;==>PNG
;~ Func Casedeplacement()

;~ EndFunc   ;==>Casedeplacement
;~ Func CLOSEPNG()
;~ 	_GDIPlus_GraphicsDispose($hGraphic)
;~ 	_GDIPlus_ImageDispose($hImage)
;~ 	_GDIPlus_Shutdown()


;~ EndFunc   ;==>CLOSEPNG

;~ Func TRANSMUTATION(ByRef $tableau, $a, $b, $tableaub = $tableau, $c = 0, $d = 0)
;~ 	$temp = $tableau[$a][$c]
;~ 	$tableau[$a][$c] = $tableaub[$b][$d]
;~ 	$tableaub[$b][$d] = $temp
;~ EndFunc   ;==>TRANSMUTATION

Func SHOWCASEMOVE($i) ;faire apres avec les stat perso
	$MMMM = $i
	$Stamina = Int($Player[$tour][19] / 100)
	$o = 0
	Global $Casejaune[47]
	$placeoriginal = $Case[$i][0]
;~ je calcul les lignes droite a partir du bohomme celle de gauche a droite

	$oka = 0
	$okb = 0
	For $rigtandleft = 1 To $Stamina
		$temp = $rigtandleft + $placeoriginal
		$lol45 = Abs((Int($temp / 10)) * 10 - $temp)
		If $lol45 < 9 And $oka <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$oka = 1
		EndIf
		$temp = Abs($rigtandleft - $placeoriginal)
		$lol45 = Abs((Int($temp / 10)) * 10 - $temp)
		If $lol45 > 0 And $okb <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$okb = 1
		EndIf

		If $okb = 1 And $oka = 1 Then
			ExitLoop(1)
		EndIf

	Next


	$compteur = 1



	$oka = 0
	$okb = 0

;~ 		Je commence a tracer la ligne droite de haut en bas en partant du perso
	For $upanddown = 1 To $Stamina
		$temp = $upanddown * 10 + $placeoriginal
		If $temp < 69 And $oka <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$oka = 1
		EndIf

		If $oka = 0 Then
;~ puis celle sur le cote les plus  qui restrecissent de la partie inferieur si il es possible de tracer le bas
			$okaa = 0
			$okbb = 0
			For $rigtandleft = 1 To $Stamina - $compteur
				$temp2 = $rigtandleft + $temp
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)

				If $lol45 < 9 And $okaa <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1
				Else
					$okaa = 1
				EndIf
				$temp2 = Abs($rigtandleft - $temp)
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)
				If $lol45 > 0 And $okbb <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1

				Else
					$okbb = 1
				EndIf
				If $okbb = 1 And $okaa = 1 Then
					ExitLoop(1)
				EndIf
			Next
		EndIf


		$temp = Abs($upanddown * 10 - $placeoriginal)

		If $temp > 10 And $okb <> 1 Then
			$Casejaune[$o] = $temp
;~ 			   ConsoleWrite("1:"&$o&@CRLF)
			$o += 1
		Else
			$okb = 1
		EndIf

		If $okb = 0 Then
;~ puis celle sur le cote les plus  qui restrecissent de la partie supérier si il es possible de tracer le haut
			$okaa = 0
			$okbb = 0
			For $rigtandleft = 1 To $Stamina - $compteur
				$temp2 = $rigtandleft + $temp
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)

				If $lol45 < 9 And $lol45 > 0 And $okaa <> 1 Then
					$Casejaune[$o] = $temp2
;~ 				ConsoleWrite("3:"&$o&"  "&$lol45&"  "&$temp2&@CRLF)
					$o += 1

				Else
					$okaa = 1
				EndIf
				$temp2 = Abs($rigtandleft - $temp)
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)
				If $lol45 > 0 And $lol45 < 9 And $okbb <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1

				Else
					$okbb = 1
				EndIf
				If $okbb = 1 And $okaa = 1 Then
					ExitLoop(1)
				EndIf
			Next
		EndIf

		If $okb = 1 And $oka = 1 Then
			ExitLoop(1)
		EndIf
		$compteur += 1
	Next


	Global $LOL[47][2]
;~ 	_ArrayDisplay($Casejaune)
	$e = 0
	For $o = 0 To 47
		For $a = 0 To 40
			If $Case[$o][0] = $Casejaune[$a] Then
				If $Case[$o][5] = "" Then
					$picrandom = GUICtrlCreatePic(@ScriptDir & "\Image\lol.jpg", $Case[$o][1], $Case[$o][3], $Case[$o][2] - $Case[$o][1], $Case[$o][4] - $Case[$o][3])

					$LOL[$e][0] = $o
					$LOL[$e][1] = $picrandom

					$e += 1
				EndIf
			EndIf
		Next
	Next

;~ 	For $o=0 To 3
;~ 				$pionx=$Player[$o][24]
;~ 				$pionxa=$Player[$o][25]
;~ 				$piony=$Player[$o][26]
;~ 				$pionya=$Player[$o][27]
;~ 			PNG(@ScriptDir & "\Image\contact-1293388_960_720.png", $pionx, $piony, $pionxa, $pionya)
;~ 			Next
	While _IsPressed("01", $dll) ;04 is Middle Click
		Sleep(10)
	WEnd

;~ _Arraydisplay($Casejaune)
	Tadarronnelachauve($LOL, $MMMM)

EndFunc   ;==>SHOWCASEMOVE
Func ARRAYCLEAN(ByRef $Array)
	$lil = UBound($Array, 1)
	$LOL = UBound($Array, 2)
	For $e = 0 To $lil - 1
		For $a = 0 To $LOL
			$Array[$e][$a] = ""

		Next
	Next
EndFunc   ;==>ARRAYCLEAN
Func Tadarronnelachauve(ByRef $LOL, $MMMM)
;~ 	$tourbloquer = 0
	WM_PAINT()
	While 1
;~ 		If $n = 0 Or BitAND(WinGetState($Form1), 2) Then ;Permet de actualiser le png quand la fentre est visible
;~ 			CLOSEPNG()
;~ 			PNG(@ScriptDir & "\Image\quadrillage.png", 275, 64, 705, 533)
;~ 			For $o=0 To 3
;~ 				$pionx=$Player[$o][24]
;~ 				$pionxa=$Player[$o][25]
;~ 				$piony=$Player[$o][26]
;~ 				$pionya=$Player[$o][27]
;~ 			PNG(@ScriptDir & "\Image\contact-1293388_960_720.png", $pionx, $piony, $pionxa, $pionya)
;~ 			Next
;~ 			$n = 1
;~ 		EndIf
;~ 		$tourbloquer += 1
;~ 		If $tourbloquer = $refrechpng Then
;~ 			WM_PAINT()

;~ 			$tourbloquer = 0
;~ 		EndIf
		If $modeactived = 0 Then
			GUICtrlSetData($mode, "En cours :Attente du joueur")
			$modeactived = 1
		EndIf
;~ 		ConsoleWrite(1&@CRLF)
		If BitAND(WinGetState($Form1), 16) And $active = 1 Then

			$active = 0
		EndIf
		If BitAND(WinGetState($Form1), 8) And $active = 0 Then

			WM_PAINT()
			$active = 1
		EndIf
		If BitAND(WinGetState($Form1), 8) Then
			$dll = DllOpen("user32.dll")

			If _IsPressed("01", $dll) Then
				GUICtrlSetData($mode, "En cours :Chargement")
				$modeactived = 0
				$Array = MouseGetPos()
				For $n = 0 To 46
					$i = $LOL[$n][0]
					If $Array[0] > $CASECALCUL[$i][1] And $Array[0] < $CASECALCUL[$i][2] And $Array[1] > $CASECALCUL[$i][3] And $Array[1] < $CASECALCUL[$i][4] Then
						$oldtext = GUICtrlRead($historique)
						$LOL1 = Floor($Case[$MMMM][0] / 10)
						If $LOL1 = 1 Then
							$lettre1 = "A"
						ElseIf $LOL1 = 2 Then
							$lettre1 = "B"
						ElseIf $LOL1 = 3 Then
							$lettre1 = "C"
						ElseIf $LOL1 = 4 Then
							$lettre1 = "D"
						ElseIf $LOL1 = 5 Then
							$lettre1 = "E"
						ElseIf $LOL1 = 6 Then
							$lettre1 = "F"
						EndIf

						$LOL2 = Floor($Case[$i][0] / 10)
						If $LOL2 = 1 Then
							$lettre2 = "A"
						ElseIf $LOL2 = 2 Then
							$lettre2 = "B"
						ElseIf $LOL2 = 3 Then
							$lettre2 = "C"
						ElseIf $LOL2 = 4 Then
							$lettre2 = "D"
						ElseIf $LOL2 = 5 Then
							$lettre2 = "E"
						ElseIf $LOL2 = 6 Then
							$lettre2 = "F"
						EndIf
						direction($MMMM, $i)


;~ MsgBox(0,"",$Case[$i][0])
						$Case[$MMMM][5] = ""
						$Case[$i][5] = $Player[$tour][0]
						For $m = 0 To 46
							GUICtrlDelete($LOL[$m][1])
						Next

						$verticale = Abs(Floor($Case[$MMMM][0] / 10) - Floor($Case[$i][0] / 10))
						$horizontale = Abs(($Case[$MMMM][0] - Floor($Case[$MMMM][0] / 10) * 10) - ($Case[$i][0] - Floor($Case[$i][0] / 10) * 10))
						$lol3 = $Player[$tour][19] - ($verticale + $horizontale) * 100
						$Player[$tour][19] = $lol3
						phrasehisto(@CRLF & @CRLF & "[" & @HOUR & ":" & @MIN & "]" & " : " & "Le joueur ' " & $Player[$tour][0] & " ' c'est deplacé de la case " & $lettre1 & ($Case[$MMMM][0] - $LOL1 * 10) & " jusqu'a la case " & $lettre2 & ($Case[$i][0] - $LOL2 * 10) & " et a utilisé " & ($verticale + $horizontale) & " de stamina", 8, $Player[$tour][0], 0xEB139B)

						PERSO(0)



						$pionx = $Player[$tour][24]
						$pionxa = $Player[$tour][25]
						$piony = $Player[$tour][26]
						$pionya = $Player[$tour][27]

						$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", $pionx, $piony, $pionxa, $pionya)
						GUICtrlDelete($Pic667)
						$Player[$tour][24] = $Case[$i][1]
						$Player[$tour][26] = $Case[$i][3] - 1
						$Player[$tour][25] = $Case[$i][2] - $Case[$i][1] - 3
						$Player[$tour][27] = $Case[$i][4] - $Case[$i][3] + 3.5
						WM_PAINT()
;~ 						$pionx=$Player[$o][24]
;~ 				$pionxa=$Player[$o][25]
;~ 				$piony=$Player[$o][26]
;~ 				$pionya=$Player[$o][27]
;~ 			PNG(@ScriptDir & "\Image\contact-1293388_960_720.png", $pionx, $piony, $pionxa, $pionya)

						ExitLoop(2)
					EndIf
				Next
			ElseIf _IsPressed("02", $dll) Then
				For $m = 0 To 46
					GUICtrlDelete($LOL[$m][1])
				Next
				WM_PAINT()
				ExitLoop(1)
			EndIf
			If _IsPressed("1B", $dll) Then
				While _IsPressed("1B", $dll)
					Sleep(10)
				WEnd
				Menu()
			EndIf
		EndIf
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
;~ 	   _GDIPlus_Shutdown()
				Exit

		EndSwitch


	WEnd

EndFunc   ;==>Tadarronnelachauve

Func PERSO($damage = 1)
	If $damage = 1 Then
		For $o = 0 To 7
			For $i = 20 To 23
				GUICtrlDelete($Player[$o][$i])
			Next
		Next
		$LOL2 = ""
		For $l = 0 To 5
			For $o = 0 To 3
				$LOL = $Player[$o][8]
				$LOL2 = $Player[$o + 1][8]
				If $LOL2 > $LOL And $LOL <> "" And $LOL2 <> "" Then
					For $p = 0 To 27
						$temp = $Player[$o][$p]
						$Player[$o][$p] = $Player[$o + 1][$p]
						$Player[$o + 1][$p] = $temp
					Next
				EndIf
			Next
		Next

		For $l = 0 To 3
			If $Player[$l][8] <> "" Then
				If $Player[$l][39] = "Au valhala" Then
					$Pic12 = GUICtrlCreatePic(@ScriptDir & "\Image\tete-de-mort-16657.jpg", 16, 48 + ($l * 72), 41, 41)
				ElseIf $Player[$l][13] = "Guerrier" Then
					$Pic12 = GUICtrlCreatePic(@ScriptDir & "\Image\guerrier.jpg", 16, 48 + ($l * 72), 41, 41)
				ElseIf $Player[$l][13] = "Magicien" Then
					$Pic12 = GUICtrlCreatePic(@ScriptDir & "\Image\magicien.jpg", 16, 48 + ($l * 72), 41, 41)
				ElseIf $Player[$l][13] = "Ingénieur" Then
					$Pic12 = GUICtrlCreatePic(@ScriptDir & "\Image\ingenieur.jpg", 16, 48 + ($l * 72), 41, 41)
				EndIf
				_GUICtrl_OnHoverRegister(-1, "PersoSEE", "Persoseeshutdown")
				$Player[$l][42] = $Pic12
				XPStyle(1)
				$Progress4 = GUICtrlCreateProgress(64, 54 + ($l * 72), 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
				GUICtrlSetData(-1, POURCENTAGE($Player[$l][17], $Player[$l][2]))
				GUICtrlSetColor(-1, 0x00FF00)
				GUICtrlSetBkColor(-1, 0x800000)
				GUICtrlSetTip(-1, "HP: " & $Player[$l][17] & "/" & $Player[$l][2]) ;A faire attention
				$Player[$l][20] = $Progress4

				$Progress5 = GUICtrlCreateProgress(64, 68 + ($l * 72), 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
				GUICtrlSetData(-1, POURCENTAGE($Player[$l][18], $Player[$l][3]))
				GUICtrlSetColor(-1, 0x00FFFF)
				GUICtrlSetBkColor(-1, 0x000080)
				GUICtrlSetTip(-1, "MANA: " & $Player[$l][18] & "/" & $Player[$l][3])
				$Player[$l][21] = $Progress5

				$Progress6 = GUICtrlCreateProgress(64, 80 + ($l * 72), 129, 9, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
				GUICtrlSetData(-1, POURCENTAGE(Int($Player[$l][19] / 100), Int($Player[$l][8] / 100)))
				GUICtrlSetColor(-1, 0xFFFF00)
				GUICtrlSetBkColor(-1, 0x808000)
				GUICtrlSetTip(-1, "STAM: " & Int($Player[$l][19] / 100) & "/" & Int($Player[$l][8] / 100))
				$Player[$l][22] = $Progress6

				XPStyle(0)
				$Label14 = GUICtrlCreateLabel("", 232, 40 + ($l * 72), 39, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
				$Player[$l][33] = $Label14
				$Label15 = GUICtrlCreateLabel("", 232, 80 + ($l * 72), 36, 20)
				GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
				$Player[$l][34] = $Label15
				For $y = 1 To 2
					If $Blueteams[$y] = $Player[$l][0] Then
						$Pic45 = GUICtrlCreatePic(@ScriptDir & "\Image\BLEU_BALON_365-2.jpg", 0, 48 + ($l * 72), 9, 41)

						GUICtrlSetTip(-1, "Team blue")
					ElseIf $Redteams[$y] = $Player[$l][0] Then
						$Pic45 = GUICtrlCreatePic(@ScriptDir & "\Image\carre_rouge.jpg", 0, 48 + ($l * 72), 9, 41)
						GUICtrlSetTip(-1, "Team red")
					EndIf
				Next
				$Player[$l][28] = $Pic45

;~ 				_ArrayDisplay($Player)
				$Pic4 = GUICtrlCreatePic(@ScriptDir & "\Image\maxresdefault.jpg", 0, 40 + ($l * 72), 201, 57, BitOR($WS_GROUP, $WS_CLIPSIBLINGS))
				$Player[$l][23] = $Pic4
				$lastgui = $Pic4

			EndIf

		Next
	ElseIf $damage = 0 Then
;~ 		_ArrayDisplay($Player)
		GUICtrlSetData($mode, "En cours :Réactualisation de l interface des perso")
		$modeactived = 0
		For $l = 0 To 3
			If $Player[$l][39] = "Au valhala" Then

			EndIf
			If $Player[$l][5] <> "" Then
				GUICtrlSetData($Player[$l][20], POURCENTAGE($Player[$l][17], $Player[$l][2]))
				GUICtrlSetTip($Player[$l][20], "HP: " & $Player[$l][17] & "/" & $Player[$l][2])
				GUICtrlSetData($Player[$l][21], POURCENTAGE($Player[$l][18], $Player[$l][3]))
				GUICtrlSetTip($Player[$l][21], "MANA: " & $Player[$l][18] & "/" & $Player[$l][3])
				GUICtrlSetData($Player[$l][22], POURCENTAGE(Int($Player[$l][19] / 100), Int($Player[$l][8] / 100)))
				GUICtrlSetTip($Player[$l][22], "STAM: " & Int($Player[$l][19] / 100) & "/" & Int($Player[$l][8] / 100))
				If $Player[$tour][0] = $Player[$l][0] Then
					GUICtrlSetData($Progress1, POURCENTAGE($Player[$l][17], $Player[$l][2]))

					GUICtrlSetData($Progress2, POURCENTAGE($Player[$l][18], $Player[$l][3]))

					GUICtrlSetData($Progress3, POURCENTAGE(Int($Player[$l][19] / 100), Int($Player[$l][8] / 100)))

					GUICtrlSetData($Label1, "HP: " & $Player[$l][17] & "/" & $Player[$l][2])

					GUICtrlSetData($Label2, "MANA: " & $Player[$l][18] & "/" & $Player[$l][3])

					GUICtrlSetData($Label3, "STAM: " & Int($Player[$l][19] / 100) & "/" & Int($Player[$l][8] / 100))


					For $o = 0 To 11
						For $y = 9 To 12

							If $Player[$l][$y] = $Competences[$o][0] Then

								If $Player[$l][18] < $Competences[$o][1] Then

									Switch $y
										Case 9
											If $desactiver1 = 0 Then
												GUICtrlSetImage($Compt1, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Mana1, 0xFF0000)
											Global $desactiver1 = 1
										Case 10
											If $desactiver2 = 0 Then
												GUICtrlSetImage($Compt2, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Mana2, 0xFF0000)
											Global $desactiver2 = 1
										Case 11
											If $desactiver3 = 0 Then
												GUICtrlSetImage($Compt3, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Mana3, 0xFF0000)
											Global $desactiver3 = 1
										Case 12
											If $desactiver4 = 0 Then
												GUICtrlSetImage($Compt4, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Mana4, 0xFF0000)
											Global $desactiver4 = 1
									EndSwitch
								EndIf
								If Int($Player[$l][19] / 100) < $Competences[$o][2] Then

									Switch $y
										Case 9
											If $desactiver1 = 0 Then
												GUICtrlSetImage($Compt1, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Stam1, 0xFF0000)
											Global $desactiver1 = 1
										Case 10
											If $desactiver2 = 0 Then
												GUICtrlSetImage($Compt2, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Stam2, 0xFF0000)
											Global $desactiver2 = 1
										Case 11
											If $desactiver3 = 0 Then
												GUICtrlSetImage($Compt3, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Stam3, 0xFF0000)
											Global $desactiver3 = 1
										Case 12
											If $desactiver4 = 0 Then
												GUICtrlSetImage($Compt4, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
											EndIf
											GUICtrlSetColor($Stam4, 0xFF0000)
											Global $desactiver4 = 1
									EndSwitch

								EndIf


							EndIf
						Next
					Next


					For $i = 0 To 47
						If $Case[$i][5] = $Player[$tour][0] Then
							$LOL = Floor($Case[$i][0] / 10)
							If $LOL = 1 Then
								$lettre = "A"
							ElseIf $LOL = 2 Then
								$lettre = "B"
							ElseIf $LOL = 3 Then
								$lettre = "C"
							ElseIf $LOL = 4 Then
								$lettre = "D"
							ElseIf $LOL = 5 Then
								$lettre = "E"
							ElseIf $LOL = 6 Then
								$lettre = "F"
							EndIf
							GUICtrlSetData($Label45, "Position actuelle : " & $lettre & ($Case[$i][0] - $LOL * 10))
							ExitLoop(1)
						EndIf
					Next
				EndIf
			EndIf
		Next
	EndIf
EndFunc   ;==>PERSO

Func POURCENTAGE($valeur, $valeurmax, $arrondi = "+")
	If $arrondi = 0 Then
		$resultat = $valeur * 100 / $valeurmax
	ElseIf $arrondi = "=" Then
		$resultat = $valeur * 100 / $valeurmax
		$resultat = Round($resultat)
	ElseIf $arrondi = "+" Then
		$resultat = $valeur * 100 / $valeurmax
		$resultat = Ceiling($resultat)
	ElseIf $arrondi = "-" Then
		$resultat = $valeur * 100 / $valeurmax
		$resultat = Floor($resultat)
	EndIf ;==>POURCENTAGE
	Return($resultat)
EndFunc   ;==>POURCENTAGE


Func XPStyle($OnOff = 1)
	If $OnOff And StringInStr(@OSType, "WIN32_NT") Then
		$XS_n = DllCall("uxtheme.dll", "int", "GetThemeAppProperties")
		DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
		Return 1
	ElseIf StringInStr(@OSType, "WIN32_NT") And IsArray($XS_n) Then
		DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", $XS_n[0])
		$XS_n = ""
		Return 1
	EndIf
	Return 0
EndFunc   ;==>XPStyle


Func SELECTIONNEPERSO()
;~ 	perso barre dxp avec lvl croissant + exp max croissant differente stat avec plus  un bouton cancel back et ok tete du perso

	$Redbutton = 0
	$Bluebutton = 0
	$folder = _FileListToArray(@ScriptDir & "\Data\Perso\", Default, 1)
	If IsArray($folder) = 1 Then
	Else

		MsgBox(48, "Error", "Vous n'avez de perso deja creer")
		Town()
	EndIf
	#Region ### START Koda GUI section ### Form=Q:\MMMMMMM\ISN\Projet isn\Koda\Select.kxf
	$Button666 = GUICtrlCreateButton("Back", 16, 688, 209, 57)
	Global $firstgui = $Button666
	$Fight = GUICtrlCreateButton("Fight !(Temporaire)", 1032, 688, 209, 57)
;~ 	GUICtrlSetState(-1, $GUI_DISABLE)
	$ListView1 = GUICtrlCreateListView("Name|Class|LVL|HP|MANA|AD|AP|Armor|MR|MV", 265, 8, 729, 745)

	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 150)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 80)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 5, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 6, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 7, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 8, 55)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 9, 55)
	Global $champ[1][17]
	For $o = 1 To $folder[0]
		Global $champ[1][17]
		$file = FileOpen(@ScriptDir & "\Data\Perso\" & $folder[$o])
		$adecrypter = FileRead($file)
		FileClose($file)
		$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4)
		$leeel = BinaryToString($leel)
		_FileCreate(@ScriptDir & "\Data\Perso\temp.txt")
		$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2)

		FileWrite($file, $leeel)

		$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|")

		FileClose($file)
		FileDelete(@ScriptDir & "\Data\Perso\temp.txt")


		GUICtrlCreateListViewItem($champ[0][0] & "|" & $champ[0][13] & "|" & $champ[0][14] & "|" & $champ[0][2] & "|" & $champ[0][3] & "|" & $champ[0][4] & "|" & $champ[0][5] & "|" & $champ[0][6] & "|" & $champ[0][7] & "|" & $champ[0][8], $ListView1)
		$LOL = StringReplace($folder[$o], ".txt", "")
		If $champ[0][0] <> $LOL Then

			FileCopy(@ScriptDir & "\Data\Perso\" & $folder[$o], @ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", 1)
			FileDelete(@ScriptDir & "\Data\Perso\" & $folder[$o])
			$folder[$o] = $champ[0][0] & ".txt"
		EndIf
	Next
;~ 	$ListView1_0 = GUICtrlCreateListViewItem("lol", $ListView1)
;~ 	$ListView1_1 = GUICtrlCreateListViewItem("|jhjhiu", $ListView1)
	$Blueteam = GUICtrlCreateListView("Nom|LVL", 1008, 184, 225, 97)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 150)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 55)
	$Redteam = GUICtrlCreateListView("Nom|LVL", 1008, 376, 225, 97)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 150)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 55)
	$Label16 = GUICtrlCreateLabel("Team blue :", 1016, 160, 60, 17)
	$Label26 = GUICtrlCreateLabel("Team red :", 1015, 355, 55, 17)
	$Addred = GUICtrlCreateButton("Add Red team", 1024, 480, 89, 25)
	$Leftred = GUICtrlCreateButton("Out of Red team", 1120, 480, 89, 25)
	$Addblue = GUICtrlCreateButton("Add Blue team", 1023, 291, 89, 25)
	$Leftblue = GUICtrlCreateButton("Out of Blue team", 1119, 291, 89, 25)
	$Label36 = GUICtrlCreateLabel("(Max 2)", 1100, 160, 39, 17)
	$Label46 = GUICtrlCreateLabel("(Max 2)", 1104, 352, 39, 17)
	$Radio1 = GUICtrlCreateRadio("Radio1", 1048, 568, 17, 17)
	$Radio2 = GUICtrlCreateRadio("Radio2", 1048, 600, 17, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	Global $Gameplaymode = "Warrior"
	$Label56 = GUICtrlCreateLabel("For fun", 1072, 568, 37, 17)
	$Label66 = GUICtrlCreateLabel("Normal (real death)", 1074, 600, 151, 17)
	Global $lastgui = $Label66
	#EndRegion ### END Koda GUI section ###
	For $o = 0 To 2
		$Blueteams[$o] = ""
		$Redteams[$o] = ""
	Next
	While 1
		$nMsg = GUIGetMsg()
		If $nMsg <> 0 Then
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit

				Case $Radio1
					Global $Gameplaymode = "Tapette"
					If _IsChecked($Radio2) Then
						GUICtrlSetState($Radio2, $GUI_UNCHECKED)

					EndIf

				Case $Radio2
					Global $Gameplaymode = "Warrior"
					If _IsChecked($Radio1) Then
						GUICtrlSetState($Radio1, $GUI_UNCHECKED)
					EndIf

				Case $Addblue
					If GUICtrlRead($ListView1) <> 0 Then
						$Array = StringSplit(GUICtrlRead(GUICtrlRead($ListView1)), "|")
						$name = $Array[1]
;~ 						$test = CHECKTEAM($name)
;~ 						If $test = 0 Then
;~ Va chercher le tableau du perso
						GUICtrlCreateListViewItem($name & "|" & $Array[3], $Blueteam)
						_GUICtrlListView_DeleteItemsSelected($ListView1)
;~ 						EndIf
						$Bluebutton += 1

						$Blueteams[0] = $Bluebutton
						$Blueteams[$Bluebutton] = $name
						If $Bluebutton = 2 Then
							GUICtrlSetState($Addblue, $GUI_DISABLE)
						EndIf
					EndIf
				Case $Addred
					If GUICtrlRead($ListView1) <> 0 Then
						$Array = StringSplit(GUICtrlRead(GUICtrlRead($ListView1)), "|")
						$name = $Array[1]
;~ 						$test = CHECKTEAM($name)
;~ 						If $test = 0 Then
;~ Va chercher le tableau du perso
						GUICtrlCreateListViewItem($name & "|" & $Array[3], $Redteam)
						_GUICtrlListView_DeleteItemsSelected($ListView1)
						$Redbutton += 1
						$Redteams[0] = $Redbutton
						$Redteams[$Redbutton] = $name
						If $Redbutton = 2 Then
							GUICtrlSetState($Addred, $GUI_DISABLE)
						EndIf
;~ 						EndIf
					EndIf
				Case $Leftblue
					If GUICtrlRead($Blueteam) <> 0 Then
						If $Bluebutton = 2 Then
							GUICtrlSetState($Addblue, $GUI_ENABLE)
						EndIf
						$Bluebutton -= 1


						$Array = StringSplit(GUICtrlRead(GUICtrlRead($Blueteam)), "|")
						$Blueteams[0] = $Bluebutton
						For $o = 1 To 2
							If $Blueteams[$o] = $Array[1] Then
								If $o = 1 Then
									$Blueteams[1] = $Blueteams[2]
								EndIf
								$Blueteams[2] = ""
							EndIf
						Next

						For $o = 1 To $folder[0]
							$XPTDR = StringReplace($folder[$o], ".txt", "")
							If $XPTDR = $Array[1] Then

								Global $champ[1][17]
								$file = FileOpen(@ScriptDir & "\Data\Perso\" & $folder[$o])
								$adecrypter = FileRead($file)
								FileClose($file)
								$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4)
								$leeel = BinaryToString($leel)
								_FileCreate(@ScriptDir & "\Data\Perso\temp.txt")
								$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2)
								FileWrite($file, $leeel)
								$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|")
								FileClose($file)
								FileDelete(@ScriptDir & "\Data\Perso\temp.txt")

								GUICtrlCreateListViewItem($champ[0][0] & "|" & $champ[0][13] & "|" & $champ[0][14] & "|" & $champ[0][2] & "|" & $champ[0][3] & "|" & $champ[0][4] & "|" & $champ[0][5] & "|" & $champ[0][6] & "|" & $champ[0][7] & "|" & $champ[0][8], $ListView1)
								_GUICtrlListView_DeleteItemsSelected($Blueteam)
								ExitLoop(1)
							EndIf
						Next
					EndIf
				Case $Leftred
					If GUICtrlRead($Redteam) <> 0 Then
						If $Redbutton = 2 Then
							GUICtrlSetState($Addred, $GUI_ENABLE)
						EndIf
						$Redbutton -= 1
						$Array = StringSplit(GUICtrlRead(GUICtrlRead($Redteam)), "|")
						$Redteams[0] = $Redbutton
						For $o = 1 To 2
							If $Redteams[$o] = $Array[1] Then
								If $o = 1 Then
									$Redteams[1] = $Redteams[2]
								EndIf
								$Redteams[2] = ""
							EndIf
						Next
						For $o = 1 To $folder[0]
							$XPTDR = StringReplace($folder[$o], ".txt", "")
							If $XPTDR = $Array[1] Then

								Global $champ[1][17]
								$file = FileOpen(@ScriptDir & "\Data\Perso\" & $folder[$o])
								$adecrypter = FileRead($file)
								FileClose($file)
								$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4)
								$leeel = BinaryToString($leel)
								_FileCreate(@ScriptDir & "\Data\Perso\temp.txt")
								$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2)
								FileWrite($file, $leeel)
								$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|")
								FileClose($file)
								FileDelete(@ScriptDir & "\Data\Perso\temp.txt")

								GUICtrlCreateListViewItem($champ[0][0] & "|" & $champ[0][13] & "|" & $champ[0][14] & "|" & $champ[0][2] & "|" & $champ[0][3] & "|" & $champ[0][4] & "|" & $champ[0][5] & "|" & $champ[0][6] & "|" & $champ[0][7] & "|" & $champ[0][8], $ListView1)
								_GUICtrlListView_DeleteItemsSelected($Redteam)
								ExitLoop(1)
							EndIf
						Next
					EndIf
				Case $Fight

					For $o = $firstgui To $lastgui
						GUICtrlDelete($o)
					Next
					Return 1
					ExitLoop(1)
				Case $Button666
					For $o = $firstgui To $lastgui
						GUICtrlDelete($o)
					Next
					ExitLoop(1)
			EndSwitch
		EndIf
;~ If
	WEnd
EndFunc   ;==>SELECTIONNEPERSO


Func _IsChecked($control)
	Return BitAND(GUICtrlRead($control), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

;~ Func CHECKTEAM($name)
;~ 	$LOL = 0
;~ 	For $o = 0 To 2
;~ 		If $Redteam[$o][0] = $name Then
;~ 			$LOL = 1
;~ 		EndIf
;~ 		If $Blueteam[$o][0] = $name Then
;~ 			$LOL = 1
;~ 		EndIf
;~ 	Next
;~ 	Return $LOL
;~ EndFunc   ;==>CHECKTEAM

Func CHARACTERVIEW($md, $lol45454 = 0)
	$LOL = 0
	$nombrepointadd = 0
	$hpadd = 0
	$manaadd = 0
	$adadd = 0
	$apadd = 0
	$armoradd = 0
	$mradd = 0
	$msadd = 0
	Global $champ[1][17]
	$folder = _FileListToArray(@ScriptDir & "\Data\Perso\", Default, 1)
	If IsArray($folder) = 1 Then
	Else

		MsgBox(48, "Error", "Vous n'avez de perso deja creer")
		Town()
	EndIf
	$file = FileOpen(@ScriptDir & "\Data\Perso\" & $folder[$md])
	$adecrypter = FileRead($file)
	FileClose($file)
	$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4)
	$leeel = BinaryToString($leel)
	_FileCreate(@ScriptDir & "\Data\Perso\temp.txt")
	$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2)
	FileWrite($file, $leeel)
	$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|")
	FileClose($file)
	FileDelete(@ScriptDir & "\Data\Perso\temp.txt")
	If $champ[0][16] = 0 Then
		$LOL = 1
	EndIf
	If $lol45454 = 0 Then
		#Region ### START Koda GUI section ### Form=I:\MMMMMMM\ISN\Projet isn\Koda\Character.kxf
		Global $Label1 = GUICtrlCreateLabel("Name :", 443, 32, 377, 45)
		Global $firstgui2 = $Label1
		GUICtrlSetFont(-1, 26, 400, 0, "MS UI Gothic")
		Global $Gauche = GUICtrlCreateButton("Gauche", 344, 32, 65, 49)
		Global $Droite = GUICtrlCreateButton("Droite", 856, 32, 65, 49)
		Global $Pic1 = GUICtrlCreatePic("", 992, 208, 145, 145)
		Global $Label2 = GUICtrlCreateLabel("Hp :", 120, 192, 81, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label3 = GUICtrlCreateLabel("Mana :", 104, 242, 100, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label4 = GUICtrlCreateLabel("AD :", 120, 291, 83, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label5 = GUICtrlCreateLabel("AP :", 120, 341, 81, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label6 = GUICtrlCreateLabel("Armor :", 104, 391, 103, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label7 = GUICtrlCreateLabel("Magic Resist :", 56, 440, 151, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label8 = GUICtrlCreateLabel("Mouvement Speed :", 16, 490, 186, 24)
		GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
		Global $Label9 = GUICtrlCreateLabel("LVL :", 424, 88, 95, 28)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Label10 = GUICtrlCreateLabel("Point :", 533, 88, 96, 28)
		GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
		Global $Progress1 = GUICtrlCreateProgress(416, 120, 441, 25, BitOR($PBS_SMOOTH, $WS_BORDER, $WS_CLIPSIBLINGS))
		Global $Button1 = GUICtrlCreateButton("Cancel", 32, 680, 129, 65)
		Global $Label11 = GUICtrlCreateLabel("Competence 1 :", 432, 256, 265, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		Global $Label12 = GUICtrlCreateLabel("Competence 2 :", 432, 288, 265, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		Global $Label13 = GUICtrlCreateLabel("Competence 3 :", 432, 320, 265, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		Global $Label14 = GUICtrlCreateLabel("Competence 4 :", 432, 352, 273, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		Global $Label15 = GUICtrlCreateLabel("Classe :", 649, 87, 206, 28)
		GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
		Global $Button3 = GUICtrlCreateButton("+", 280, 184, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button4 = GUICtrlCreateButton("+", 280, 232, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button5 = GUICtrlCreateButton("+", 280, 288, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button6 = GUICtrlCreateButton("+", 280, 336, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button7 = GUICtrlCreateButton("+", 280, 384, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button8 = GUICtrlCreateButton("+", 280, 432, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button9 = GUICtrlCreateButton("+", 280, 480, 33, 33)
		GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
		Global $Button2 = GUICtrlCreateButton("Accept", 1094, 682, 129, 65)
	EndIf
	Global $lastgui2 = $Button2
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	If $LOL = 0 Then
		For $o = $Button3 To $Button9
			GUICtrlSetState($o, $GUI_SHOW)
		Next
	ElseIf $LOL = 1 Then
		For $o = $Button3 To $Button9
			GUICtrlSetState($o, $GUI_HIDE)
		Next
	EndIf
	GUICtrlSetData($Label1, "Name : " & $champ[0][0])
	GUICtrlSetData($Label9, "LVL : " & $champ[0][14])
	GUICtrlSetData($Label10, "Point : " & $champ[0][16])
	$nombrepoint = $champ[0][16]
	$exp = POURCENTAGE($champ[0][15], $champ[0][14] * 100)

	GUICtrlSetData($Progress1, $exp)
	GUICtrlSetData($Label2, "Hp : " & $champ[0][2])
	GUICtrlSetData($Label3, "Mana : " & $champ[0][3])
	GUICtrlSetData($Label4, "AD : " & $champ[0][4])
	GUICtrlSetData($Label5, "AP : " & $champ[0][5])
	GUICtrlSetData($Label6, "Armor : " & $champ[0][6])
	GUICtrlSetData($Label7, "Magic Resist : " & $champ[0][7])
	GUICtrlSetData($Label8, "Mouvement Speed : " & $champ[0][8])
	GUICtrlSetData($Label15, "Classe : " & $champ[0][13])
	GUICtrlSetData($Label11, "Competence 1 : " & $champ[0][9])
	GUICtrlSetData($Label12, "Competence 2 : " & $champ[0][10])
	GUICtrlSetData($Label13, "Competence 3 : " & $champ[0][11])
	GUICtrlSetData($Label14, "Competence 4 : " & $champ[0][12])
;~ _ArrayDisplay($folder)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				For $o = $firstgui2 To $lastgui2
					GUICtrlDelete($o)
				Next
				Town()
			Case $Gauche
				$md -= 1
				If $md = 0 Then
					$md = $folder[0]
				EndIf
				If $nombrepointadd <> 0 Then
					$champ[0][1] = "image"
					$champ[0][2] += $hpadd
					$champ[0][3] += $manaadd
					$champ[0][4] += $adadd
					$champ[0][5] += $apadd
					$champ[0][6] += $armoradd
					$champ[0][7] += $mradd
					$champ[0][8] += $msadd
;~ 				$perso[0][9]=$competence1
;~ 				$perso[0][10]=$competence2
;~ 				$perso[0][11]=$competence3
;~ 				$perso[0][12]=$competence4
					$champ[0][16] = $nombrepoint - $nombrepointadd
					FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					_FileWriteFromArray(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $champ)
					$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					$tableauacrypte = FileRead($file)
					FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					FileClose($file)
					$tableauacrypte = _Crypt_EncryptData($tableauacrypte, "darkelle24", $CALG_RC4)
					_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $FO_APPEND)
					FileWrite($file, $tableauacrypte)
					FileClose($file)
				EndIf
				CHARACTERVIEW($md, 1)
			Case $Droite
				$md += 1
				If $md = $folder[0] + 1 Then
					$md = 1
				EndIf
				If $nombrepointadd <> 0 Then
					$champ[0][1] = "image"
					$champ[0][2] += $hpadd
					$champ[0][3] += $manaadd
					$champ[0][4] += $adadd
					$champ[0][5] += $apadd
					$champ[0][6] += $armoradd
					$champ[0][7] += $mradd
					$champ[0][8] += $msadd
;~ 				$perso[0][9]=$competence1
;~ 				$perso[0][10]=$competence2
;~ 				$perso[0][11]=$competence3
;~ 				$perso[0][12]=$competence4
					$champ[0][16] = $nombrepoint - $nombrepointadd
					FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					_FileWriteFromArray(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $champ)
					$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					$tableauacrypte = FileRead($file)
					FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					FileClose($file)
					$tableauacrypte = _Crypt_EncryptData($tableauacrypte, "darkelle24", $CALG_RC4)
					_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
					$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $FO_APPEND)
					FileWrite($file, $tableauacrypte)
					FileClose($file)
				EndIf
				CHARACTERVIEW($md, 1)
			Case $Button2

				$champ[0][1] = "image"
				$champ[0][2] += $hpadd
				$champ[0][3] += $manaadd
				$champ[0][4] += $adadd
				$champ[0][5] += $apadd
				$champ[0][6] += $armoradd
				$champ[0][7] += $mradd
				$champ[0][8] += $msadd
;~ 				$perso[0][9]=$competence1
;~ 				$perso[0][10]=$competence2
;~ 				$perso[0][11]=$competence3
;~ 				$perso[0][12]=$competence4
				$champ[0][16] = $nombrepoint - $nombrepointadd
				FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
				_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
				_FileWriteFromArray(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $champ)
				$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
				$tableauacrypte = FileRead($file)
				FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
				FileClose($file)
				$tableauacrypte = _Crypt_EncryptData($tableauacrypte, "darkelle24", $CALG_RC4)
				_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
				$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $FO_APPEND)
				FileWrite($file, $tableauacrypte)
				FileClose($file)

				For $o = $firstgui2 To $lastgui2
					GUICtrlDelete($o)
				Next
				Town()
		EndSwitch
		If $nMsg >= $Button3 And $Button9 >= $nMsg Then
			If $nombrepoint - $nombrepointadd <> 0 Then


				Switch $nMsg
					Case $Button3
						$hpadd += 4
						GUICtrlSetData($Label2, "Hp : " & $champ[0][2] + $hpadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button4
						$manaadd += 2
						GUICtrlSetData($Label3, "Mana : " & $champ[0][3] + $manaadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button5
						$adadd += 1
						GUICtrlSetData($Label4, "AD : " & $champ[0][4] + $adadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button6
						$apadd += 1
						GUICtrlSetData($Label5, "AP : " & $champ[0][5] + $apadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button7
						$armoradd += 1
						GUICtrlSetData($Label6, "Armor : " & $champ[0][6] + $armoradd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button8
						$mradd += 1
						GUICtrlSetData($Label7, "Magic Resist : " & $champ[0][7] + $mradd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button9
						$msadd += 1
						GUICtrlSetData($Label8, "Mouvement Speed : " & $champ[0][8] + $msadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
				EndSwitch
			Else
				For $o = $Button3 To $Button9
					GUICtrlSetState($o, $GUI_HIDE)
				Next
			EndIf
		EndIf
	WEnd

EndFunc   ;==>CHARACTERVIEW

Func Newcharacter($classe, $competence1, $competence2, $competence3, $competence4)
	Global $perso[1][17]
	#Region ### START Koda GUI section ### Form=n:\mmmmmmm\isn\projet isn\koda\character.kxf
	$Label1 = GUICtrlCreateLabel("Name :", 443, 32, 121, 45)
	GUICtrlSetFont(-1, 31, 400, 0, "MS UI Gothic")
	$firstgui3 = $Label1
	$Pic1 = GUICtrlCreatePic("", 1000, 192, 145, 145)
	$Label2 = GUICtrlCreateLabel("Hp :", 120, 192, 105, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label3 = GUICtrlCreateLabel("Mana :", 104, 242, 124, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label4 = GUICtrlCreateLabel("AD :", 120, 291, 107, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label5 = GUICtrlCreateLabel("AP :", 120, 341, 105, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label6 = GUICtrlCreateLabel("Armor :", 104, 391, 127, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label7 = GUICtrlCreateLabel("Magic Resist :", 56, 440, 175, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label8 = GUICtrlCreateLabel("Mouvement Speed :", 16, 490, 210, 24)
	GUICtrlSetFont(-1, 13, 400, 0, "MS Sans Serif")
	$Label10 = GUICtrlCreateLabel("Point :", 568, 88, 120, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button1 = GUICtrlCreateButton("Cancel", 32, 680, 129, 65)
	$Button2 = GUICtrlCreateButton("Accept", 1094, 682, 129, 65)
	$name = GUICtrlCreateInput("", 568, 48, 433, 21)
	GUICtrlSetLimit(-1, 13)
	$Button3 = GUICtrlCreateButton("Change d image de perso", 1000, 352, 145, 41)
	$default = GUICtrlCreateButton("Default", 507, 680, 241, 65)
	$Button4 = GUICtrlCreateButton("+", 240, 184, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button5 = GUICtrlCreateButton("+", 240, 240, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button6 = GUICtrlCreateButton("+", 240, 288, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button7 = GUICtrlCreateButton("+", 240, 336, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button8 = GUICtrlCreateButton("+", 240, 384, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button9 = GUICtrlCreateButton("+", 240, 432, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Button10 = GUICtrlCreateButton("+", 240, 480, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
	$Label9 = GUICtrlCreateLabel("Gold :", 1000, 416, 142, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$Button11 = GUICtrlCreateButton("100 gold = 1point compt", 1000, 448, 145, 33)
	$Button12 = GUICtrlCreateButton("Randomize", 280, 680, 121, 65)
	$lastgui3 = $Button12
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	$mmm = 1
	$hp = 700
	$mana = 600
	$ad = 0
	$ap = 0
	$armor = 50
	$mr = 50
	$ms = 300
	$hpadd = 0
	$manaadd = 0
	$adadd = 0
	$apadd = 0
	$armoradd = 0
	$mradd = 0
	$msadd = 0

	$nombrepointadd = 0
	$nombrepoint = Random(1000, 2000, 1)
	While $nombrepoint > 0
		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$hp += $LOL * 4

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$mana += $LOL * 2

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$ad += $LOL

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$ap += $LOL

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$hp += $LOL

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$armor += $LOL

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$mr += $LOL

		$LOL = Random(0, $nombrepoint, 1)
		$nombrepoint -= $LOL
		$ms += $LOL
	WEnd

	If $classe = "Guerrier" Then
		$hp += 1000
		$mana -= 500
		$ad += 150
		$armor += 100
		$mr += 100
	ElseIf $classe = "Magicien" Then
		$hp -= 250
		$mana += 1000
		$ap += 450
		$armor -= 50
		$ms -= 50
	ElseIf $classe = "Ingénieur" Then
		$hp += 350
		$mana += 750
		$ad += 300
		$ap += 300
		$ms += 100
	EndIf

	GUICtrlSetData($Label2, "Hp : " & $hp)
	GUICtrlSetData($Label3, "Mana : " & $mana)
	GUICtrlSetData($Label4, "AD : " & $ad)
	GUICtrlSetData($Label5, "AP : " & $ap)
	GUICtrlSetData($Label6, "Armor : " & $armor)
	GUICtrlSetData($Label7, "Magic Resist : " & $mr)
	GUICtrlSetData($Label8, "Mouvement Speed : " & $ms)

	$nombrepoint = Random(100, 150, 1)
	GUICtrlSetData($Label10, "Point : " & $nombrepoint)
	While 1
		If $nombrepoint = 0 And $mmm = 0 Then
			GUICtrlSetState($Button2, $GUI_ENABLE)
			$mmm = 1
		EndIf
		If $nombrepoint > 0 And $mmm = 1 Then
			GUICtrlSetState($Button2, $GUI_DISABLE)
			$mmm = 0
		EndIf
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				For $o = $firstgui3 To $lastgui3
					GUICtrlDelete($o)
				Next
				ClassCompt($classe)
			Case $Button12
				For $o = $firstgui3 To $lastgui3
					GUICtrlDelete($o)
				Next
				Newcharacter($classe, $competence1, $competence2, $competence3, $competence4)
			Case $Button2
				$lvl = 1
				$exp = 0
				$perso[0][0] = GUICtrlRead($name)
				$perso[0][1] = "image"
				$perso[0][2] = $hp + $hpadd
				$perso[0][3] = $mana + $manaadd
				$perso[0][4] = $ad + $adadd
				$perso[0][5] = $ap + $apadd
				$perso[0][6] = $armor + $armoradd
				$perso[0][7] = $mr + $mradd
				$perso[0][8] = $ms + $msadd
				$perso[0][9] = $competence1
				$perso[0][10] = $competence2
				$perso[0][11] = $competence3
				$perso[0][12] = $competence4
				$perso[0][13] = $classe
				$perso[0][14] = $lvl
				$perso[0][15] = $exp
				$perso[0][16] = $nombrepoint - $nombrepointadd
				_FileCreate(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt")
				_FileWriteFromArray(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt", $perso)
				$file = FileOpen(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt")
				$tableauacrypte = FileRead($file)
				FileDelete(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt")
				FileClose($file)
				$tableauacrypte = _Crypt_EncryptData($tableauacrypte, "darkelle24", $CALG_RC4)
				_FileCreate(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt")
				$file = FileOpen(@ScriptDir & "\Data\Perso\" & GUICtrlRead($name) & ".txt", $FO_APPEND)
				FileWrite($file, $tableauacrypte)
				FileClose($file)

				For $o = $firstgui3 To $lastgui3
					GUICtrlDelete($o)
				Next
				$lel = GUICtrlRead($name)
				Town()
			Case $default
				GUICtrlSetData($Label2, "Hp : " & $hp)
				GUICtrlSetData($Label3, "Mana : " & $mana)
				GUICtrlSetData($Label4, "AD : " & $ad)
				GUICtrlSetData($Label5, "AP : " & $ap)
				GUICtrlSetData($Label6, "Armor : " & $armor)
				GUICtrlSetData($Label7, "Magic Resist : " & $mr)
				GUICtrlSetData($Label8, "Mouvement Speed : " & $ms)
				GUICtrlSetData($Label10, "Point : " & $nombrepoint)
				$hpadd = 0
				$manaadd = 0
				$adadd = 0
				$apadd = 0
				$armoradd = 0
				$mradd = 0
				$msadd = 0
				$nombrepointadd = 0
		EndSwitch
		If $nMsg >= $Button4 And $Button10 >= $nMsg Then
			If $nombrepoint - $nombrepointadd <> 0 Then


				Switch $nMsg
					Case $Button4
						$hpadd += 4
						GUICtrlSetData($Label2, "Hp : " & $hp + $hpadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button5
						$manaadd += 2
						GUICtrlSetData($Label3, "Mana : " & $mana + $manaadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button6
						$adadd += 1
						GUICtrlSetData($Label4, "AD : " & $ad + $adadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button7
						$apadd += 1
						GUICtrlSetData($Label5, "AP : " & $ap + $apadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button8
						$armoradd += 1
						GUICtrlSetData($Label6, "Armor : " & $armor + $armoradd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button9
						$mradd += 1
						GUICtrlSetData($Label7, "Magic Resist : " & $mr + $mradd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
					Case $Button10
						$msadd += 1
						GUICtrlSetData($Label8, "Mouvement Speed : " & $ms + $msadd)
						$nombrepointadd += 1
						GUICtrlSetData($Label10, "Point : " & $nombrepoint - $nombrepointadd)
				EndSwitch
			Else
				GUICtrlSetState($Button2, $GUI_ENABLE)
			EndIf
		EndIf
	WEnd

EndFunc   ;==>Newcharacter
Func ClassCompt($classe = 0)
	$LOL = 0
	$test = 0
	#Region ### START Koda GUI section ### Form=N:\MMMMMMM\ISN\Projet isn\Koda\Competence class.kxf
	$Button1 = GUICtrlCreateButton("Cancel", 32, 672, 145, 57)
	$firstgui4 = $Button1
	$Button2 = GUICtrlCreateButton("Accept", 1079, 672, 145, 57)
	$Edit1 = GUICtrlCreateEdit("", 208, 88, 353, 401, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN))
	$Combo1 = GUICtrlCreateCombo("", 24, 88, 169, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "Guerrier|Magicien|Ingénieur", "Classe")
	Global $Combo2 = GUICtrlCreateCombo("Combo2", 624, 88, 129, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Combo3 = GUICtrlCreateCombo("Combo2", 784, 88, 129, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Combo4 = GUICtrlCreateCombo("Combo2", 944, 88, 129, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Combo5 = GUICtrlCreateCombo("Combo2", 1104, 88, 129, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Edit2 = GUICtrlCreateEdit("", 648, 272, 585, 169, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN))
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Global $Pic1 = GUICtrlCreatePic("", 648, 136, 89, 89)
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Pic2 = GUICtrlCreatePic("", 808, 136, 89, 89)
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Pic3 = GUICtrlCreatePic("", 968, 136, 89, 89)
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	Global $Pic4 = GUICtrlCreatePic("", 1128, 136, 89, 89)
	_GUICtrl_OnHoverRegister(-1, "LectureComptence")
	$Label1 = GUICtrlCreateLabel("Class :", 32, 40, 65, 29)
	GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
	$Label2 = GUICtrlCreateLabel("Competences :", 633, 38, 137, 29)
	GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
	$lastgui4 = $Label2
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	GUICtrlSetState($Button2, $GUI_DISABLE)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1

				For $o = $firstgui4 To $lastgui4
					GUICtrlDelete($o)
				Next
				Town()
			Case $Button2
				$lel = GUICtrlRead($Combo1)
				$competence1 = GUICtrlRead($Combo2)
				$competence2 = GUICtrlRead($Combo3)
				$competence3 = GUICtrlRead($Combo4)
				$competence4 = GUICtrlRead($Combo5)
				For $o = $firstgui4 To $lastgui4
					GUICtrlDelete($o)
				Next

				Newcharacter($lel, $competence1, $competence2, $competence3, $competence4)
		EndSwitch
		If GUICtrlRead($Combo1) = "Guerrier" And $LOL <> 1 Then
			GUICtrlSetData($Edit1, "Hp = +1500" & @CRLF & @CRLF & "Mana = -500" & @CRLF & @CRLF & "Armor = +100" & @CRLF & @CRLF & "MR = +100")
			GUICtrlSetData($Combo2, "", "")
			GUICtrlSetData($Combo3, "", "")
			GUICtrlSetData($Combo4, "", "")
			GUICtrlSetData($Combo5, "", "")
			GUICtrlSetData($Combo2, "Charge", "Charge")
			GUICtrlSetImage($Pic1, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo2) & ".jpg")
			GUICtrlSetData($Combo3, "ArmorUp", "ArmorUp")
			GUICtrlSetImage($Pic2, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo3) & ".jpg")
			GUICtrlSetData($Combo4, "Beyblade", "Beyblade")
			GUICtrlSetImage($Pic3, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo4) & ".jpg")
			GUICtrlSetData($Combo5, "Dunk", "Dunk")
			GUICtrlSetImage($Pic4, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo5) & ".jpg")
			$LOL = 1
		ElseIf GUICtrlRead($Combo1) = "Magicien" And $LOL <> 2 Then
			GUICtrlSetData($Edit1, "Hp = -250" & @CRLF & @CRLF & "Mana = +1000" & @CRLF & @CRLF & "Ap = +450" & @CRLF & @CRLF & "Armor = -50" & @CRLF & @CRLF & "MR = -50")
			GUICtrlSetData($Combo2, "", "")
			GUICtrlSetData($Combo3, "", "")
			GUICtrlSetData($Combo4, "", "")
			GUICtrlSetData($Combo5, "", "")
			GUICtrlSetData($Combo2, "Smite", "Smite")
			GUICtrlSetImage($Pic1, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo2) & ".jpg")
			GUICtrlSetData($Combo3, "Heal", "Heal")
			GUICtrlSetImage($Pic2, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo3) & ".jpg")
			GUICtrlSetData($Combo4, "Boost", "Boost")
			GUICtrlSetImage($Pic3, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo4) & ".jpg")
			GUICtrlSetData($Combo5, "FireBall", "FireBall")
			GUICtrlSetImage($Pic4, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo5) & ".jpg")
			$LOL = 2
		ElseIf GUICtrlRead($Combo1) = "Ingénieur" And $LOL <> 3 Then
			GUICtrlSetData($Edit1, "Mana = +750" & @CRLF & @CRLF & "Ap = +250" & @CRLF & @CRLF & "Ad = +250" & @CRLF & @CRLF & "Ms = +100")
			GUICtrlSetData($Combo2, "", "")
			GUICtrlSetData($Combo3, "", "")
			GUICtrlSetData($Combo4, "", "")
			GUICtrlSetData($Combo5, "", "")
			GUICtrlSetData($Combo2, "MultiShot", "MultiShot")
			GUICtrlSetImage($Pic1, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo2) & ".jpg")
			GUICtrlSetData($Combo3, "DamageUp", "DamageUp")
			GUICtrlSetImage($Pic2, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo3) & ".jpg")
			GUICtrlSetData($Combo4, "Rewind", "Rewind")
			GUICtrlSetImage($Pic3, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo4) & ".jpg")
			GUICtrlSetData($Combo5, "JusticeRain", "JusticeRain")
			GUICtrlSetImage($Pic4, @ScriptDir & "\Image\Compétences\reel\" & GUICtrlRead($Combo5) & ".jpg")
			$LOL = 3
		EndIf
		If $LOL <> 0 And $test = 0 Then
			GUICtrlSetState($Button2, $GUI_ENABLE)
			$test = 1
		EndIf
	WEnd

EndFunc   ;==>ClassCompt
Func LectureComptence($iCtrlID)
	If $iCtrlID = $Pic1 Then
		$iCtrlID = $Combo2
	ElseIf $iCtrlID = $Pic2 Then
		$iCtrlID = $Combo3
	ElseIf $iCtrlID = $Pic3 Then
		$iCtrlID = $Combo4
	ElseIf $iCtrlID = $Pic4 Then
		$iCtrlID = $Combo5
	EndIf
	Switch $iCtrlID
		Case $Combo2
			Switch GUICtrlRead($Combo2)
				Case "Charge"
					GUICtrlSetData($Edit2, "Charge :" & @CRLF & "Charge en ligne droite sur max 3 Case" & @CRLF & "Si rencontre un ennemi intflige 100 AD + *0.11 AD" & @CRLF & "Consomme: 50 mana + 2 Stamina" & @CRLF & "CoolDown: 2 tour")
				Case "Smite"
					GUICtrlSetData($Edit2, "Smite :" & @CRLF & "Selectionne un ennemi dans une range de 4 Case" & @CRLF & "Inflige: 200 AP + *0.5 AP" & @CRLF & "Consomme: 250 mana" & @CRLF & "CoolDown : 1 tour")
				Case "MultiShot"
					GUICtrlSetData($Edit2, "MultiShot :" & @CRLF & "Selectionne des cibles dans une range de 4 Case" & @CRLF & "Inflige: 100 AP + 100 AD +*0.35 AD" & @CRLF & "Consomme: 150 mana*Personne ciblé + 1 Stamina*Personne ciblé " & @CRLF & "CoolDown: 2 tour")
			EndSwitch
		Case $Combo3
			Switch GUICtrlRead($Combo3)
				Case "ArmorUp"
					GUICtrlSetData($Edit2, "ArmorUp :" & @CRLF & "Augmente l'Armure et la resitance magic du perso" & @CRLF & "Augmente: 100 Armor + 100 MR" & @CRLF & "Consomme: 250 Mana" & @CRLF & "CoolDown: 3 tour")
				Case "Heal"
					GUICtrlSetData($Edit2, "Heal :" & @CRLF & "Heal un joueur allié sur max 5 Case" & @CRLF & "Heal: 500*0.3 - (nbr de Case * 20)%" & @CRLF & "Consomme: 300 Mana" & @CRLF & "CoolDown: 2 tour")
				Case "DamageUp"
					GUICtrlSetData($Edit2, "DamageUp :" & @CRLF & "Augmente les dégats d'un perso sur max 3 Case" & @CRLF & "Augmente: 10 AD + *0.6 AD + 10 AP + *0.75 AP" & @CRLF & "Consomme: 400 Mana + 2 Stamina" & @CRLF & "CoolDown: 5 tour")
			EndSwitch

		Case $Combo4

			Switch GUICtrlRead($Combo4)
				Case "Beyblade"
					GUICtrlSetData($Edit2, "Beyblade :" & @CRLF & "Blesse ennemi et allier sur 2 Case" & @CRLF & "Inflige: 250 AD + *0.3 AD + *1.0 AP" & @CRLF & "Heal: 250 PV * nbr de cible" & @CRLF & "Consomme: 200 Mana + 1 Stamina" & @CRLF & "CoolDown: 3 tour")
				Case "Boost"
					GUICtrlSetData($Edit2, "Boost :" & @CRLF & "Redonne du mana ,de la vie et de la stamina range:3 rayon AOE:3" & @CRLF & "Heal: (150 PV + 150 Mana )*0.75 AP + 2 Stamina" & @CRLF & "Consomme: 600 Mana" & @CRLF & "CoolDown: 4 tour")
				Case "Mine"
					GUICtrlSetData($Edit2, "Mine :" & @CRLF & "Place une mine visble que par vous sur une range max 5 case et explose sur une range de 1 case" & @CRLF & "Inflige: 20% des pv manquant en AD + 0.2 AD + 0.3 AP" & @CRLF & "Consomme: 150 Mana" & @CRLF & "CoolDown: 2 tour")
			EndSwitch

		Case $Combo5

			Switch GUICtrlRead($Combo5)
				Case "Dunk"
					GUICtrlSetData($Edit2, "Dunk :" & @CRLF & "Finisher sur un ennemi sur max 2 Case" & @CRLF & "Inflige: 400 AD + *0.6 AD + 10 % pv manquant de la cible en AD" & @CRLF & "Gagne: Gagne 1 de Stamina + 150 de Mana si la cible meurt" & @CRLF & "Consomme: 300 Mana + 2 Stamina" & @CRLF & "CoolDown: 4 tour. Si la cible meurt 0 tour")
				Case "FireBall"
					GUICtrlSetData($Edit2, "FireBall :" & @CRLF & "Cible un ennemi et lance une boule de feu sur max 4 Case" & @CRLF & "Inflige: 600 AP + *0.5 AP" & @CRLF & "Consomme: 700 Mana" & @CRLF & "CoolDown: 2 tour")
				Case "JusticeRain"
					GUICtrlSetData($Edit2, "JusticeRain :" & @CRLF & "Cible une zone de 2*2 et lance une pluie de missile sur max 4 Case" & @CRLF & "Inflige: 350 AD + *0.5 AD + 350 AP + *0.5 AP" & @CRLF & "Consomme: 500 Mana + 3 Stamina" & @CRLF & "CoolDown: 3 tour")
			EndSwitch
	EndSwitch

EndFunc   ;==>LectureComptence
Func OPTION($goto = 0)
	Global $SoundID = 0
	$soundactivated = 0

	#Region ### START Koda GUI section ### Form=I:\MMMMMMM\programmation\Theo\Jeu.kxf

	$Slider1 = GUICtrlCreateSlider(284, 136, 689, 25)
	$Label1 = GUICtrlCreateLabel("OPTION", 550, 8, 157, 52)
	GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
	$Label2 = GUICtrlCreateLabel("SON :", 294, 104, 55, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Label3 = GUICtrlCreateLabel("100", 613, 112, 31, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$Cancel666 = GUICtrlCreateButton("Cancel", 24, 696, 161, 49)
	$Valider666 = GUICtrlCreateButton("Valider", 1064, 696, 161, 49)
	$Testeaudiobeep = GUICtrlCreateButton("Test Beep", 1000, 128, 65, 33)
	$Testeaudiomusique = GUICtrlCreateButton("Test Audio", 1096, 128, 65, 33)
	$Label4 = GUICtrlCreateLabel("Taux de rafraichissement des png :", 296, 200, 299, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Input1 = GUICtrlCreateInput("Input1", 608, 200, 57, 28, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	GUICtrlSetTip(-1, "Plus vous augmenter le rafraichissement moins le jeu laguera", "Info", 1)
	$activer = GUICtrlCreateCheckbox("Activer la gestion du sens du regard des perso", 296, 264, 433, 25)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Checkbox1 = GUICtrlCreateCheckbox("Sans skin", 296, 328, 153, 17)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Checkbox2 = GUICtrlCreateCheckbox("Sans effet visuel", 296, 384, 233, 25)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button1 = GUICtrlCreateButton("Default", 528, 704, 161, 49)
	$Button2 = GUICtrlCreateButton("Change Touche", 40, 128, 177, 57)
	#EndRegion ### END Koda GUI section ###
	SoundSetWaveVolume($Sound)
	GUICtrlSetData($Slider1, $Sound)
	GUICtrlSetData($Label3, $Sound)
;~ 	GUICtrlSetData($Input1, $refrechpng)
;~ $activatiedview= True
;~ Global $Withoutskin=False
;~ Global $Withoutspaceview=False
	If $activatiedview = "True" Then
		GUICtrlSetState($activer, $GUI_CHECKED)
	EndIf
	If $Withoutskin = "True" Then
		GUICtrlSetState($Checkbox1, $GUI_CHECKED)
	EndIf
	If $Withoutspaceview = "True" Then
		GUICtrlSetState($Checkbox2, $GUI_CHECKED)
	EndIf
	While 1
		If GUICtrlRead($Slider1) <> GUICtrlRead($Label3) Then
			GUICtrlSetData($Label3, GUICtrlRead($Slider1))
			SoundSetWaveVolume(GUICtrlRead($Slider1))
		EndIf

		If _IsChecked($Checkbox1) Then

			If BitAND(GUICtrlGetState($activer), 64) Then
				GUICtrlSetState($activer, $GUI_UNCHECKED)
				GUICtrlSetState($activer, $GUI_DISABLE)
			EndIf
		ElseIf BitAND(GUICtrlGetState($activer), 128) Then
			GUICtrlSetState($activer, $GUI_ENABLE)
		EndIf
		$nMsg6 = GUIGetMsg()
		Switch $nMsg6
			Case $Testeaudiomusique

				$path = FileOpenDialog("Charger Musique", @ScriptDir, "Musique (*.mp3;*.wav)|All (*.*)")



				Global $SoundID = _SoundOpen($path)
				Global $soundactivated = 1
				_SoundPlay($SoundID)

			Case $Button1
				GUICtrlSetState($activer, $GUI_CHECKED)
				SoundSetWaveVolume(100)
				GUICtrlSetData($Slider1, 100)
				GUICtrlSetData($Label3, 100)
;~ 				GUICtrlSetData($Input1, 100)
			Case $Testeaudiobeep

				Beep(Random(200, 800, 1), 600)

			Case $GUI_EVENT_CLOSE
				Exit
			Case $Valider666
				If _IsChecked($activer) Then
					$activatiedview = "True"
				Else
					$activatiedview = "False"
				EndIf
				If _IsChecked($Checkbox1) Then
					$Withoutskin = "True"
				Else
					$Withoutskin = "False"
				EndIf
				If _IsChecked($Checkbox2) Then
					$Withoutspaceview = "True"
				Else
					$Withoutspaceview = "False"
				EndIf
;~ 				$refrechpng = GUICtrlRead($Input1)
				$Sound = GUICtrlRead($Slider1)
				If $soundactivated <> 0 Then
					_SoundStop($SoundID)
					$soundactivated = 0
					$SoundID = 0
				EndIf
				$paraparaparametre = FileOpen(@ScriptDir & "\Data\Parametre.ini", 2)
				FileWrite($paraparaparametre, "Volume : " & $Sound & @CRLF)
;~ 				FileWrite($paraparaparametre, "Refreshpng : " & $refrechpng & @CRLF)
				FileWrite($paraparaparametre, "Activer la gestion du sens du regard des perso : " & $activatiedview & @CRLF)
				FileWrite($paraparaparametre, "Sans skin : " & $Withoutskin & @CRLF)
				FileWrite($paraparaparametre, "Sans effet visuel : " & $Withoutspaceview & @CRLF)
				FileWrite($paraparaparametre, "1 competence : " & $touchecompt1 & @CRLF)
				FileWrite($paraparaparametre, "2 competence : " & $touchecompt2 & @CRLF)
				FileWrite($paraparaparametre, "3 competence : " & $touchecompt3 & @CRLF)
				FileWrite($paraparaparametre, "4 competence : " & $touchecompt4 & @CRLF)
				FileWrite($paraparaparametre, "Next : " & $touchenext & @CRLF)
				FileWrite($paraparaparametre, "Move : " & $touchemove & @CRLF)
				FileClose($paraparaparametre)
				For $o = $Slider1 To $Button2
					GUICtrlDelete($o)
				Next
				If $goto = 0 Then
					Town()
				ElseIf $goto = 1 Then
					ExitLoop(1)
				EndIf


			Case $Cancel666
				For $o = $Slider1 To $Button2
					GUICtrlDelete($o)
				Next
				If $goto = 0 Then
					Town()
				ElseIf $goto = 1 Then
					
					ExitLoop(1)
				EndIf
			Case $Button2
				If _IsChecked($activer) Then
					$activatiedview = "True"
				Else
					$activatiedview = "False"
				EndIf
				If _IsChecked($Checkbox1) Then
					$Withoutskin = "True"
				Else
					$Withoutskin = "False"
				EndIf
				If _IsChecked($Checkbox2) Then
					$Withoutspaceview = "True"
				Else
					$Withoutspaceview = "False"
				EndIf
;~ 				$refrechpng = GUICtrlRead($Input1)
				$Sound = GUICtrlRead($Slider1)
				If $soundactivated <> 0 Then
					_SoundStop($SoundID)
					$soundactivated = 0
					$SoundID = 0
				EndIf
				$paraparaparametre = FileOpen(@ScriptDir & "\Data\Parametre.ini", 2)
				FileWrite($paraparaparametre, "Volume : " & $Sound & @CRLF)
;~ 				FileWrite($paraparaparametre, "Refreshpng : " & $refrechpng & @CRLF)
				FileWrite($paraparaparametre, "Activer la gestion du sens du regard des perso : " & $activatiedview & @CRLF)
				FileWrite($paraparaparametre, "Sans skin : " & $Withoutskin & @CRLF)
				FileWrite($paraparaparametre, "Sans effet visuel : " & $Withoutspaceview & @CRLF)
				FileWrite($paraparaparametre, "1 competence : " & $touchecompt1 & @CRLF)
				FileWrite($paraparaparametre, "2 competence : " & $touchecompt2 & @CRLF)
				FileWrite($paraparaparametre, "3 competence : " & $touchecompt3 & @CRLF)
				FileWrite($paraparaparametre, "4 competence : " & $touchecompt4 & @CRLF)
				FileWrite($paraparaparametre, "Next : " & $touchenext & @CRLF)
				FileWrite($paraparaparametre, "Move : " & $touchemove & @CRLF)
				FileClose($paraparaparametre)
				For $yesI = $Slider1 To $Button2
					GUICtrlSetState($yesI, $GUI_HIDE)
				Next
				Commande($goto)
				For $yesI = $Slider1 To $Button2
					GUICtrlSetState($yesI, $GUI_SHOW)
				Next
		EndSwitch
	WEnd


EndFunc   ;==>OPTION


Func COMPETENCE($numerocomptutiliseesetperso)
	$Competenceutilisee = $Player[$tour][8 + $numerocomptutiliseesetperso]
	For $o = 0 To 11
		If $Competences[$o][0] = $Competenceutilisee Then
			Global $rangcomptutilisee = $o
			ExitLoop(1)
		EndIf
	Next
;~ 	mode 1 permet de tracer juste les ligne droite
	$comptmode = StringSplit($Competences[$rangcomptutilisee][4], "|", $STR_NOCOUNT)

	For $i = 0 To 47
		If $Case[$i][5] = $Player[$tour][0] Then

;~ 	   skillshot un c est ltoute les cases dans le tableau afficher 2 c est ennemi 3 c est allier 4 ennemi et allier

			casecomptaffichage($comptmode[0], $i, $comptmode[1], $comptmode[2], $comptmode[3], $comptmode[4], $comptmode[5], $numerocomptutiliseesetperso)
			While _IsPressed("01", $dll) ;04 is Middle Click
				Sleep(10)
			WEnd
			ExitLoop(2)

		EndIf
	Next
EndFunc   ;==>COMPETENCE

Func casecomptaffichage($mode, $i, $range, $Skillshot, $Soimeme, $style, $AOE, $numerocomptutiliseesetperso)
	Global $LOL[47][3]
	Global $MMMM = $i
	$Stamina = $range
	$o = 0
	Global $Casejaune[47]
	$placeoriginal = $Case[$i][0]
;~ je calcul les lignes droite a partir du bohomme celle de gauche a droite

	$oka = 0
	$okb = 0
	For $rigtandleft = 1 To $Stamina
		$temp = $rigtandleft + $placeoriginal
		$lol45 = Abs((Int($temp / 10)) * 10 - $temp)
		If $lol45 < 9 And $oka <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$oka = 1
		EndIf
		$temp = Abs($rigtandleft - $placeoriginal)
		$lol45 = Abs((Int($temp / 10)) * 10 - $temp)
		If $lol45 > 0 And $okb <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$okb = 1
		EndIf

		If $okb = 1 And $oka = 1 Then
			ExitLoop(1)
		EndIf

	Next


	$compteur = 1



	$oka = 0
	$okb = 0

;~ 		Je commence a tracer la ligne droite de haut en bas en partant du perso
	For $upanddown = 1 To $Stamina
		$temp = $upanddown * 10 + $placeoriginal
		If $temp < 69 And $oka <> 1 Then
			$Casejaune[$o] = $temp
			$o += 1
		Else
			$oka = 1
		EndIf

		If $oka = 0 And $mode <> 1 Then
;~ puis celle sur le cote les plus  qui restrecissent de la partie inferieur si il es possible de tracer le bas
			$okaa = 0
			$okbb = 0
			For $rigtandleft = 1 To $Stamina - $compteur
				$temp2 = $rigtandleft + $temp
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)

				If $lol45 < 9 And $okaa <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1
				Else
					$okaa = 1
				EndIf
				$temp2 = Abs($rigtandleft - $temp)
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)
				If $lol45 > 0 And $okbb <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1

				Else
					$okbb = 1
				EndIf
				If $okbb = 1 And $okaa = 1 Then
					ExitLoop(1)
				EndIf
			Next
		EndIf


		$temp = Abs($upanddown * 10 - $placeoriginal)

		If $temp > 10 And $okb <> 1 Then
			$Casejaune[$o] = $temp
;~ 			   ConsoleWrite("1:"&$o&@CRLF)
			$o += 1
		Else
			$okb = 1
		EndIf

		If $okb = 0 And $mode <> 1 Then
;~ puis celle sur le cote les plus  qui restrecissent de la partie supérier si il es possible de tracer le haut
			$okaa = 0
			$okbb = 0
			For $rigtandleft = 1 To $Stamina - $compteur
				$temp2 = $rigtandleft + $temp
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)

				If $lol45 < 9 And $lol45 > 0 And $okaa <> 1 Then
					$Casejaune[$o] = $temp2
;~ 				ConsoleWrite("3:"&$o&"  "&$lol45&"  "&$temp2&@CRLF)
					$o += 1

				Else
					$okaa = 1
				EndIf
				$temp2 = Abs($rigtandleft - $temp)
				$lol45 = Abs((Int($temp2 / 10)) * 10 - $temp2)
				If $lol45 > 0 And $lol45 < 9 And $okbb <> 1 Then
					$Casejaune[$o] = $temp2
					$o += 1

				Else
					$okbb = 1
				EndIf
				If $okbb = 1 And $okaa = 1 Then
					ExitLoop(1)
				EndIf
			Next
		EndIf

		If $okb = 1 And $oka = 1 Then
			ExitLoop(1)
		EndIf
		$compteur += 1
	Next
	Global $marrant[48][6]
	$lookatmydab = 0
;~ _ArrayDisplay($Casejaune)
	If $Skillshot <> 1 Then

		For $y = 1 To 2
			If $Blueteams[$y] = $Player[$tour][0] Then
				$teamallier = "bleu"
				ExitLoop(1)
			ElseIf $Redteams[$y] = $Player[$tour][0] Then
				$teamallier = "rouge"
				ExitLoop(1)
			EndIf
		Next

		For $o = 0 To 47
			For $a = 0 To 40
				If $Case[$o][0] = $Casejaune[$a] Then
					If $Case[$o][5] <> "" Then
						$nom = $Case[$o][5]
						For $y = 1 To 2
							If $Blueteams[$y] = $nom Then
								$team = "bleu"
								ExitLoop(1)
							ElseIf $Redteams[$y] = $nom Then
								$team = "rouge"
								ExitLoop(1)
							EndIf
						Next
						If $Skillshot = 2 Or $Skillshot = 4 Then
							If $team <> $teamallier Then
								For $e = 0 To 5
									$marrant[$lookatmydab][$e] = $Case[$o][$e]
								Next
								$lookatmydab += 1
							EndIf
						EndIf
						If $Skillshot = 3 Or $Skillshot = 4 Then
							If $team = $teamallier Then

								For $e = 0 To 5
									$marrant[$lookatmydab][$e] = $Case[$o][$e]
								Next
								$lookatmydab += 1
							EndIf
						EndIf
					EndIf
				EndIf
			Next
		Next
	Else

		For $o = 0 To 47
			For $a = 0 To 40
				If $Case[$o][0] = $Casejaune[$a] Then
					For $e = 0 To 5
						$marrant[$lookatmydab][$e] = $Case[$o][$e]
					Next
					$lookatmydab += 1
				EndIf
			Next
		Next
	EndIf
	If $Soimeme = 1 Then
		For $e = 0 To 5
			$marrant[$lookatmydab][$e] = $Case[$MMMM][$e]
		Next
		$lookatmydab += 1
	EndIf
	If $style = 1 Then
		$carre = @ScriptDir & "\Image\carre_rouge.jpg"
	ElseIf $style = 2 Then
		$carre = @ScriptDir & "\Image\green-300x3001.jpg"
	EndIf

	Global $ClickDummy6 = GUICtrlCreateDummy()
	$e = 0
	If $style <> 3 Then
		For $o = 0 To 46
			If $marrant[$o][0] <> "" Then
				$picrandom = GUICtrlCreatePic($carre, $marrant[$o][1], $marrant[$o][3], $marrant[$o][2] - $marrant[$o][1], $marrant[$o][4] - $marrant[$o][3])
				If $marrant[$o][5] <> "" Then
					_GUICtrl_OnHoverRegister(-1, "Gestiondegats")
				EndIf
				$LOL[$e][0] = $o
				$LOL[$e][1] = $picrandom
				$LOL[$e][2] = $marrant[$o][5]
				WM_PAINT()
				$e += 1
			Else
				ExitLoop(1)
			EndIf
		Next
	ElseIf $style = 3 Then
		For $o = 0 To 46
			If $marrant[$o][0] <> "" Then

				If $marrant[$o][5] <> "" Then
					$carre = @ScriptDir & "\Image\carre_rouge.jpg"
					$picrandom = GUICtrlCreatePic($carre, $marrant[$o][1], $marrant[$o][3], $marrant[$o][2] - $marrant[$o][1], $marrant[$o][4] - $marrant[$o][3])
					_GUICtrl_OnHoverRegister(-1, "Gestiondegats")

				Else
					$carre = @ScriptDir & "\Image\lol.jpg"
					$picrandom = GUICtrlCreatePic($carre, $marrant[$o][1], $marrant[$o][3], $marrant[$o][2] - $marrant[$o][1], $marrant[$o][4] - $marrant[$o][3])
					_GUICtrl_OnHoverRegister(-1, "Gestiondegats")
				EndIf
				$LOL[$e][0] = $o
				$LOL[$e][1] = $picrandom
				$LOL[$e][2] = $marrant[$o][5]
				WM_PAINT()
				$e += 1
			Else
				ExitLoop(1)
			EndIf
		Next
	EndIf



	Phase3($marrant, $LOL, $numerocomptutiliseesetperso, $AOE)

EndFunc   ;==>casecomptaffichage

Func Gestiondegats($iCtrlID)
	Global $activeted = $iCtrlID
	GUICtrlSendToDummy($ClickDummy6)
EndFunc   ;==>Gestiondegats

Func Phase3(ByRef $marrant, ByRef $LOL, $numerocomptutiliseesetperso, $AOE)
	WM_PAINT()
;~ 	$tourbloquer = 0
;~    marrant je suis pas encore sur qu il soit utile
	$boostMR = 0
	$mana = 0
	$kill = 0
	$Resetdispo = 0
	$Resetok = 0
	$stam = 0
	$MoveAttackactived = 0
	$MoveAttack = 0
	$heal = 0
	$boostARMOR = 0
	$boostAD = 0
	$boostAP = 0
	$ResetCooldown = 0
	$healthlefttargetad = 0
	$healthlefttargetap = 0
	$healself = 0
	$degatsbrutad = $Competences[$rangcomptutilisee][5]
	$activerdegatsbrutad = "ready"
	$degatsbrutap = $Competences[$rangcomptutilisee][6]
	$activerdegatsbrutap = "ready"
	$ELSEeffect = $Competences[$rangcomptutilisee][7]
	$activerELSEeffect = "ready"
	$testAD = StringSplit($degatsbrutad, "|")
	$degatsbrutad = 00
	$wait = 0
	If $testAD[1] = 0 Then
		$activerdegatsbrutad = "desactiver"
	EndIf
	$testAP = StringSplit($degatsbrutap, "|")
	$degatsbrutap = 00
	If $testAP[1] = 0 Then
		$activerdegatsbrutap = "desactiver"
	EndIf

	If $ELSEeffect <> "" Then

		$testELSE = StringSplit($ELSEeffect, "|")
		$ELSEeffect = 00
	Else
		$activerELSEeffect = "desactiver"
	EndIf


	For $y = 1 To $testAD[0]
		If StringInStr($testAD[$y], "*Healthlefttarget") <> 0 Then
			$healthlefttargetad = $testAD[$y]
		Else
			$healthlefttargetad = 0
			If StringInStr($testAD[$y], "*AD") <> 0 Then
				StringReplace($testAD[$y], "*AD", "")
				$transvase = $testAD[$y] * $Player[$tour][4]
				$testAD[$y] = $transvase
			EndIf
			$degatsbrutad += $testAD[$y]
		EndIf
	Next

	For $y = 1 To $testAP[0]
		If StringInStr($testAP[$y], "*Healthlefttarget") Then
			$healthlefttargetap = $testAP[$y]
		Else
			$healthlefttargetap = 0
			If StringInStr($testAP[$y], "*AP") <> 0 Then
				StringReplace($testAP[$y], "*AP", "")
				$transvase = $testAP[$y] * $Player[$tour][5]
				$testAP[$y] = $transvase
			EndIf
			$degatsbrutap += $testAP[$y]
		EndIf
	Next
;~ 	ceci est de la merde en boite ma bien casser les pied on peut comparer une string avec un nombre sauf 0 ou 1
;~ 	$test=2
;~ If "bonjour"<> 0 Then
;~ 	ConsoleWrite("ok"&@CRLF)
;~ 	EndIf

	If $activerELSEeffect = "ready" Then


		For $y = 1 To $testELSE[0]

			If StringInStr($testELSE[$y], "+MR") <> 0 Then
				StringReplace($testELSE[$y], "+MR", "")

				$boostMR += $testELSE[$y]


			ElseIf StringInStr($testELSE[$y], "+Armor") <> 0 Then
				StringReplace($testELSE[$y], "+Armor", "")

				$boostARMOR += $testELSE[$y]
			ElseIf StringInStr($testELSE[$y], "Healself") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "Healself", "")
				If StringInStr($testELSE[$y], "*nbrCible") <> 0 Then
					$testELSE[$y] = StringReplace($testELSE[$y], "*nbrCible", "")
					$target = 0
					For $o = 0 To 46
						If $marrant[$o][5] = "" Then
							ExitLoop(1)
						Else
							$target += 1
						EndIf

					Next
					$healself = $target * $testELSE[$y]

				Else
					$healself = $testELSE[$y]
				EndIf
			ElseIf StringInStr($testELSE[$y], "+AD") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "+AD", "")
				$boostAD += $testELSE[$y]
				If StringInStr($testELSE[$y + 1], "*AD") <> 0 Then
					$testELSE[$y + 1] = StringReplace($testELSE[$y + 1], "*AD", "")
					$boostAD += Floor($testELSE[$y + 1] * $Player[$tour][4])
				EndIf
			ElseIf StringInStr($testELSE[$y], "+AP") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "+AP", "")
				$boostAP += $testELSE[$y]
				If StringInStr($testELSE[$y + 1], "*AP") <> 0 Then
					$testELSE[$y + 1] = StringReplace($testELSE[$y + 1], "*AP", "")
					$boostAP += Floor($testELSE[$y + 1] * $Player[$tour][5])
				EndIf
			ElseIf StringInStr($testELSE[$y], "Heal") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "Heal", "")
				$heal += $testELSE[$y]
				If StringInStr($testELSE[$y + 1], "*AP") <> 0 Then
					$testELSE[$y + 1] = StringReplace($testELSE[$y + 1], "*AP", "")
					$heal += Floor($Player[$tour][5] * $testELSE[$y + 1])
				EndIf
			ElseIf StringInStr($testELSE[$y], "Mana") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "Mana", "")
				$mana += $testELSE[$y]
				If StringInStr($testELSE[$y + 1], "*AP") <> 0 Then
					$testELSE[$y + 1] = StringReplace($testELSE[$y + 1], "*AP", "")
					$mana += Floor($Player[$tour][5] * $testELSE[$y + 1])
				EndIf
			ElseIf StringInStr($testELSE[$y], "+Stam") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "+Stam", "")
				$stam += $testELSE[$y]
			ElseIf StringInStr($testELSE[$y], "ResetCooldown") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "ResetCooldown", "")
				$ResetCooldown = 1

			ElseIf StringInStr($testELSE[$y], "Reset") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "Reset", "")

				$Resetdispo += $testELSE[$y]
			ElseIf StringInStr($testELSE[$y], "Move/Attack") <> 0 Then
				$testELSE[$y] = StringReplace($testELSE[$y], "Move/Attack", "")

				$MoveAttack += $testELSE[$y]
				$MoveAttackactived = 1

				If StringInStr($testELSE[$y + 1], "*AD") <> 0 Then
					$testELSE[$y + 1] = StringReplace($testELSE[$y + 1], "*AD", "")
					$MoveAttack += Floor($testELSE[$y + 1] * $Player[$tour][4])
				EndIf
			EndIf
		Next
	EndIf
	$Activetedlabel1 = 0
	$Activetedlabel2 = 0
	$Activetedlabel3 = 0
	$Activetedlabel4 = 0
	$playervisee = ""
	While 1
		If $marrant[0][0] = "" Then
			ExitLoop(1)
		EndIf
;~ 		$tourbloquer += 1
;~ 		If $tourbloquer = $refrechpng Then
;~ 			WM_PAINT()

;~ 			$tourbloquer = 0
;~ 		EndIf
		If BitAND(WinGetState($Form1), 16) And $active = 1 Then

			$active = 0
		EndIf
		If BitAND(WinGetState($Form1), 8) And $active = 0 Then

			WM_PAINT()
			$active = 1
		EndIf
;~ 		ConsoleWrite(1&@CRLF)
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE

				Exit
;~ 			Case $ClickDummy7
;~ 				Global $MoveAttackactived = 2
			Case $ClickDummy6

				For $o = 0 To 46
					If $LOL[$o][1] = $activeted Then

						If $LOL[$o][2] <> "" Then

							For $y = 0 To 3
								If $LOL[$o][2] = $Player[$y][0] Then
									For $test = 0 To 47

										If $Case[$test][0] = $marrant[$o][0] Then
											direction($MMMM, $test)

										EndIf
									Next
									$effetad = 0
									$effetap = 0
									If $Activetedlabel1 <> 0 Then
										GUICtrlSetData($Activetedlabel1, "")
									EndIf
									If $Activetedlabel2 <> 0 Then
										GUICtrlSetData($Activetedlabel2, "")
									EndIf
									If $Activetedlabel3 <> 0 Then
										GUICtrlSetData($Activetedlabel3, "")
									EndIf
									If $Activetedlabel4 <> 0 Then
										GUICtrlSetData($Activetedlabel4, "")
									EndIf

									If $healthlefttargetad <> 0 Then
										$effetad += ($Player[$y][2] - $Player[$y][17]) * $healthlefttargetad
									EndIf
									If $activerdegatsbrutad = "ready" Then
										If Floor($degatsbrutad + $effetad - ($Player[$y][6] / 2)) > 0 Then
											GUICtrlSetData($Player[$y][33], "-" & Floor($degatsbrutad + $effetad - ($Player[$y][6] / 2)))
										Else
											GUICtrlSetData($Player[$y][33], "-" & 0)
										EndIf
										GUICtrlSetColor($Player[$y][33], 0xFF7600)
									EndIf

									If $healthlefttargetap <> 0 Then
										$effetap += ($Player[$y][2] - $Player[$y][17]) * $healthlefttargetap
									EndIf
									If $activerdegatsbrutap = "ready" Then

										If Floor($degatsbrutap + $effetap - ($Player[$y][7] / 2)) > 0 Then
											GUICtrlSetData($Player[$y][34], "-" & Floor($degatsbrutap + $effetap - ($Player[$y][7] / 2)))
										Else
											GUICtrlSetData($Player[$y][34], "-" & 0)
										EndIf
										GUICtrlSetColor($Player[$y][34], 0x06D8FF)
									EndIf

									If $activerELSEeffect = "ready" Then
										If $boostAD <> 0 Then
											GUICtrlSetData($Player[$y][33], "+" & $boostAD)
											GUICtrlSetColor($Player[$y][33], 0xFF7600)
										EndIf
										If $boostAP <> 0 Then
											GUICtrlSetData($Player[$y][34], "+" & $boostAP)
											GUICtrlSetColor($Player[$y][34], 0x06D8FF)
										EndIf

										If $healself <> 0 Then

											GUICtrlSetData($Player[$tour][33], "+" & $healself)
											GUICtrlSetColor($Player[$tour][33], 0x3CEB08)
										EndIf

										If $boostMR <> 0 Then
											GUICtrlSetData($Player[$y][33], "+" & $boostMR)
											GUICtrlSetColor($Player[$y][33], 0x000000)
										EndIf
										If $boostARMOR <> 0 Then
											GUICtrlSetData($Player[$y][34], "+" & $boostARMOR)
											GUICtrlSetColor($Player[$y][34], 0x000000)
										EndIf
										If $stam <> 0 Then
											GUICtrlSetData($Player[$y][33], "+" & $stam)
											GUICtrlSetColor($Player[$y][33], 0x3CEB08)
										EndIf
										If $heal <> 0 Then
											GUICtrlSetData($Player[$y][33], "+" & $heal)
											GUICtrlSetColor($Player[$y][33], 0x3CEB08)
										EndIf
										If $mana <> 0 Then
											GUICtrlSetData($Player[$y][34], "+" & $mana)
											GUICtrlSetColor($Player[$y][34], 0x000000)
										EndIf
										If $ResetCooldown <> 0 Then
											GUICtrlSetData($Player[$y][33], "RAC")
											GUICtrlSetColor($Player[$y][33], 0x000000)
										EndIf
										If $MoveAttackactived <> 0 Then
											$MoveAttackactived = 1
										EndIf
									EndIf
									$Activetedlabel1 = $Player[$y][33]
									$Activetedlabel2 = $Player[$y][34]
									$Activetedlabel3 = $Player[$tour][33]
									$Activetedlabel4 = $Player[$tour][34]
									$playervisee = $y


									$wait = 1

									ExitLoop(2)





								EndIf
							Next
						ElseIf $LOL[$o][2] = "" And $MoveAttackactived = 1 Then
							$MoveAttackactived = 2
							$wait = 1
						EndIf
					EndIf

				Next





		EndSwitch
		If BitAND(WinGetState($Form1), 8) Then
			$dll = DllOpen("user32.dll")

			If _IsPressed("1B", $dll) Then
				While _IsPressed("1B", $dll)
					Sleep(10)
				WEnd
				Menu()
			EndIf

			$test = _IsPressed("01", $dll)
			If $test And $wait = 1 Then
				$Array = MouseGetPos()
				While _IsPressed("01", $dll) ;04 is Middle Click
					Sleep(10)
				WEnd
				For $test = 0 To 47
;~  $test=0
;~ While $test<=47


;~ ConsoleWrite($Array[0] &">"& $CASECALCUL[$i][1] &"  "& $Array[0]&"<"& $CASECALCUL[$n][2] &"  "& $Array[1]  &">"& $CASECALCUL[$n][3] &"  "&$Array[1] &"<"& $CASECALCUL[$n][4]&@CRLF)

					If $Array[0] > $CASECALCUL[$test][1] And $Array[0] < $CASECALCUL[$test][2] And $Array[1] > $CASECALCUL[$test][3] And $Array[1] < $CASECALCUL[$test][4] Then


						For $r = 0 To 46
							If $Case[$test][0] = $marrant[$r][0] Then


;~ 							If $Case[$test][5] = $Player[$playervisee][0] Then
								phrasehisto(@CRLF & @CRLF & "[" & @HOUR & ":" & @MIN & "]" & " : " & "Le joueur ' " & $Player[$tour][0] & " ' a utilisée la compétence ' " & $Competences[$rangcomptutilisee][0] & " ' mais ca lui a consommé " & $Competences[$rangcomptutilisee][1] & " de mana et " & $Competences[$rangcomptutilisee][2] & " de stamina" & @CRLF & "Grace a ca il a pu :", 8, $Player[$tour][0], 0xEB139B, $Competences[$rangcomptutilisee][0], 0xE6DB12)
;~ 								If $playerinAOE <> "" Then
;~ 									$partoutatis = StringSplit($playerinAOE, "|")
;~ 									_ArrayDisplay($partoutatis)
;~ 								EndIf
;~ 								For
								If $activerdegatsbrutad = "ready" Then

									If Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2)) > 0 Then
										If($Player[$playervisee][17] - Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2))) <= 0 Then

											$kill = 1
										Else
											$Player[$playervisee][17] -= Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2))
										EndIf
										phrasehisto(@CRLF & " -Infliger " & Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2)) & " de damage AD a ' " & $Player[$playervisee][0] & " '", Default, Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2)), 0x06D8FF, $Player[$playervisee][0], 0xEB139B)
									ElseIf Floor($degatsbrutad + $effetad - ($Player[$playervisee][6] / 2)) <= 0 Then
										phrasehisto(@CRLF & " -Infliger 0 de damage AD a ' " & $Player[$playervisee][0] & " '", Default, 0, 0x06D8FF, $Player[$playervisee][0], 0xEB139B)
									EndIf
								EndIf
								If $activerdegatsbrutap = "ready" Then

									If Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2)) > 0 Then
										If($Player[$playervisee][17] - Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2))) <= 0 Then

											$kill = 1

										Else
											$Player[$playervisee][17] -= Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2))
										EndIf
										phrasehisto(@CRLF & " -Infliger " & Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2)) & " de damage AP a ' " & $Player[$playervisee][0] & " '", Default, Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2)), 0xFF7600, $Player[$playervisee][0], 0xEB139B)
									ElseIf Floor($degatsbrutap + $effetap - ($Player[$playervisee][7] / 2)) <= 0 Then
										phrasehisto(@CRLF & " -Infliger 0 de damage AP a ' " & $Player[$playervisee][0] & " '", Default, 0, 0xFF7600, $Player[$playervisee][0], 0xEB139B)

									EndIf
								EndIf
								If $activerELSEeffect = "ready" Then
									If $boostAD <> 0 Then
										$Player[$playervisee][4] += $boostAD
										phrasehisto(@CRLF & " -Donné un boost de " & $boostAD & " d' Attaque physique a ' " & $Player[$playervisee][0] & " '", Default, $Player[$playervisee][0], 0xEB139B, $boostAD, 0x06D8FF)
									EndIf
									If $boostAP <> 0 Then
										$Player[$playervisee][5] += $boostAP
										phrasehisto(@CRLF & " -Donné un boost de " & $boostAP & " de Damage magic a ' " & $Player[$playervisee][0] & " '", Default, $Player[$playervisee][0], 0xEB139B, $boostAP, 0xFF7600)
									EndIf

									If $healself <> 0 Then
										$Player[$tour][17] += $healself
										If $Player[$tour][17] > $Player[$tour][2] Then
											$Player[$tour][17] = $Player[$tour][2]
										EndIf
										phrasehisto(@CRLF & " -Ce heal lui meme de " & $healself & " hp", Default, $healself, 0x3CEB08)
									EndIf

									If $boostMR <> 0 Then
										$Player[$playervisee][7] += $boostMR
										phrasehisto(@CRLF & " -Donné un boost de " & $boostMR & " de Magic resist a ' " & $Player[$playervisee][0] & " '", Default, $Player[$playervisee][0], 0xEB139B)
									EndIf
									If $boostARMOR <> 0 Then
										$Player[$playervisee][6] += $boostARMOR
										phrasehisto(@CRLF & " -Donné un boost de " & $boostARMOR & " d'Armure a ' " & $Player[$playervisee][0] & " '", Default, $Player[$playervisee][0], 0xEB139B)
									EndIf
									If $heal <> 0 Then
										$Player[$playervisee][17] += $heal
										If $Player[$playervisee][17] > $Player[$playervisee][2] Then
											$Player[$playervisee][17] = $Player[$playervisee][2]
										EndIf
										phrasehisto(@CRLF & " -Heal ' " & $Player[$playervisee][0] & " ' de " & $heal & " hp", Default, $Player[$playervisee][0], 0xEB139B, $heal, 0x3CEB08)
									EndIf
									If $mana <> 0 Then
										$Player[$playervisee][18] += $mana
										If $Player[$playervisee][18] > $Player[$playervisee][3] Then
											$Player[$playervisee][18] = $Player[$playervisee][3]
										EndIf
										phrasehisto(@CRLF & " -Rend a ' " & $Player[$playervisee][0] & " ' " & $mana & " de mana", Default, $Player[$playervisee][0], 0xEB139B)
									EndIf
									If $stam <> 0 Then
										$Player[$playervisee][19] += $stam * 100
										If $Player[$playervisee][19] > $Player[$playervisee][8] Then
											$Player[$playervisee][19] = $Player[$playervisee][8]
										EndIf
										phrasehisto(@CRLF & " -Rend a ' " & $Player[$playervisee][0] & " ' " & $stam & " de stamina", Default, $Player[$playervisee][0], 0xEB139B)

									EndIf
;~ 								ConsoleWrite($MoveAttackactived & @CRLF)
									If $MoveAttackactived <> 0 Then

										If $MoveAttackactived = 1 Then
											If Floor($MoveAttack - ($Player[$playervisee][6] / 2)) > 0 Then
												If($Player[$playervisee][17] - Floor($MoveAttack - ($Player[$playervisee][6] / 2))) <= 0 Then

													$kill = 1
												Else
													$Player[$playervisee][17] -= Floor($MoveAttack - ($Player[$playervisee][6] / 2))
												EndIf
												phrasehisto(@CRLF & " -Infliger " & Floor($MoveAttack - ($Player[$playervisee][6] / 2)) & " de damage AD a ' " & $Player[$playervisee][0] & " '", Default, Floor($MoveAttack - ($Player[$playervisee][6] / 2)), 0x06D8FF, $Player[$playervisee][0], 0xEB139B)
											ElseIf Floor($MoveAttack - ($Player[$playervisee][6] / 2)) <= 0 Then
												phrasehisto(@CRLF & " -Infliger 0 de damage AD a ' " & $Player[$playervisee][0] & " '", Default, 0, 0x06D8FF, $Player[$playervisee][0], 0xEB139B)
											EndIf


										EndIf



										For $n = 0 To 46
											If $LOL[$n][1] = $activeted Then

												For $test = 0 To 47

													If $Case[$test][0] = $marrant[$n][0] Then
														$i = $test
														$verticale = Floor($Case[$MMMM][0] / 10) - Floor($Case[$i][0] / 10)
														$horizontale = ($Case[$MMMM][0] - Floor($Case[$MMMM][0] / 10) * 10) - ($Case[$i][0] - Floor($Case[$i][0] / 10) * 10)

														If $MoveAttackactived = 1 Then


															If $verticale > 0 Then
																$i += 8
															ElseIf $verticale < 0 Then
																$i -= 8
															ElseIf $verticale = 0 Then
																If $horizontale > 0 Then
																	$i += 1
																ElseIf $horizontale < 0 Then
																	$i -= 1
																EndIf
															EndIf

														EndIf

														If $horizontale <> 0 Or $verticale <> 0 Then
															$LOL1 = Floor($Case[$MMMM][0] / 10)
															If $LOL1 = 1 Then
																$lettre1 = "A"
															ElseIf $LOL1 = 2 Then
																$lettre1 = "B"
															ElseIf $LOL1 = 3 Then
																$lettre1 = "C"
															ElseIf $LOL1 = 4 Then
																$lettre1 = "D"
															ElseIf $LOL1 = 5 Then
																$lettre1 = "E"
															ElseIf $LOL1 = 6 Then
																$lettre1 = "F"
															EndIf

															$LOL2 = Floor($Case[$i][0] / 10)

															If $LOL2 = 1 Then
																$lettre2 = "A"
															ElseIf $LOL2 = 2 Then
																$lettre2 = "B"
															ElseIf $LOL2 = 3 Then
																$lettre2 = "C"
															ElseIf $LOL2 = 4 Then
																$lettre2 = "D"
															ElseIf $LOL2 = 5 Then
																$lettre2 = "E"
															ElseIf $LOL2 = 6 Then
																$lettre2 = "F"
															EndIf

															$Case[$MMMM][5] = ""
															$Case[$i][5] = $Player[$tour][0]
															phrasehisto(@CRLF & " -Se deplacé de la case " & $lettre1 & ($Case[$MMMM][0] - $LOL1 * 10) & " jusqu'a la case " & $lettre2 & ($Case[$i][0] - $LOL2 * 10), Default)
															For $5 = 0 To 46
																GUICtrlDelete($LOL[$5][1])
															Next
															PERSO(0)


															For $o = 0 To 3
																If $Player[$o][0] = $Player[$tour][0] Then
																	$pionx = $Player[$o][24]
																	$pionxa = $Player[$o][25]
																	$piony = $Player[$o][26]
																	$pionya = $Player[$o][27]

																	$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", $pionx, $piony, $pionxa, $pionya)
																	GUICtrlDelete($Pic667)

																	$Player[$o][24] = $Case[$i][1]
																	$Player[$o][26] = $Case[$i][3] - 1
																	$Player[$o][25] = $Case[$i][2] - $Case[$i][1] - 3
																	$Player[$o][27] = $Case[$i][4] - $Case[$i][3] + 3.5
																	WM_PAINT()
																EndIf
															Next

														EndIf
														ExitLoop(2)

													EndIf
												Next
											EndIf
										Next
									EndIf

									If $ResetCooldown <> 0 Then
										If $tour = $playervisee Then
											If $Player[$tour][29] <> 0 Then
												GUICtrlSetImage($Compt1, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][9] & ".jpg")
												Global $desactiver1 = 0
												GUICtrlDelete($Player[$playervisee][35])
												$compteur1 = 0
											EndIf
											If $Player[$tour][30] <> 0 Then
												GUICtrlSetImage($Compt2, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][10] & ".jpg")
												Global $desactiver2 = 0
												GUICtrlDelete($Player[$playervisee][36])
												$compteur2 = 0
											EndIf
											If $Player[$tour][31] <> 0 Then
												GUICtrlSetImage($Compt3, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][11] & ".jpg")
												Global $desactiver3 = 0
												GUICtrlDelete($Player[$playervisee][37])
												$compteur3 = 0
											EndIf
											If $Player[$tour][32] <> 0 Then
												GUICtrlSetImage($Compt4, @ScriptDir & "\Image\Compétences\reel\" & $Player[$tour][12] & ".jpg")
												Global $desactiver4 = 0
												GUICtrlDelete($Player[$playervisee][38])
												$compteur4 = 0
											EndIf
										EndIf
										For $o = 1 To 4
											$Player[$playervisee][28 + $o] = 0
										Next
										phrasehisto(@CRLF & " -Reset tous les cooldown de ' " & $Player[$playervisee][0] & " ' ", Default, $Player[$playervisee][0], 0xEB139B)

									EndIf

								EndIf

								If $kill = 1 Then
									$Player[$playervisee][17] = 0
									$Player[$playervisee][39] = "Au valhala"
									$Player[$playervisee][18] = 0
									$Player[$playervisee][19] = 0
									GUICtrlSetImage($Player[$playervisee][42], @ScriptDir & "\Image\tete-de-mort-16657.jpg")

									If $Blueteams[0] = 2 Then
										$killed = 0
										For $o = 0 To 3
											If $Blueteams[1] = $Player[$o][0] Then
												If $Player[$o][39] = "Au valhala" Then
													$killed += 1
												EndIf
											ElseIf $Blueteams[2] = $Player[$o][0] Then

												If $Player[$o][39] = "Au valhala" Then
													$killed += 1
												EndIf
											EndIf
										Next
										If $killed = 2 Then
											For $dab = 0 To 150
												GUICtrlDelete($dab)
											Next
											Endgame(2, "R")
										EndIf
									Else
										For $o = 0 To 3
											If $Blueteams[1] = $Player[$o][0] Then
												If $Player[$o][39] = "Au valhala" Then
													For $dab = 0 To 150
														GUICtrlDelete($dab)
													Next
													Endgame(1, "R")
												EndIf
											EndIf
										Next
									EndIf
									If $Redteams[0] = 2 Then
										$killed = 0
										For $o = 0 To 3
											If $Redteams[1] = $Player[$o][0] Then
												If $Player[$o][39] = "Au valhala" Then
													$killed += 1
												EndIf
											ElseIf $Redteams[2] = $Player[$o][0] Then
												If $Player[$o][39] = "Au valhala" Then
													$killed += 1
												EndIf
											EndIf
										Next
										If $killed = 2 Then
											For $dab = 0 To 150
												GUICtrlDelete($dab)
											Next
											Endgame(2, "B")
										EndIf
									Else
										For $o = 0 To 3
											If $Redteams[1] = $Player[$o][0] Then
												If $Player[$o][39] = "Au valhala" Then
													For $dab = 0 To 150
														GUICtrlDelete($dab)
													Next
													Endgame(1, "B")
												EndIf
											EndIf
										Next
									EndIf

									$pionx = $Player[$playervisee][24]
									$pionxa = $Player[$playervisee][25]
									$piony = $Player[$playervisee][26]
									$pionya = $Player[$playervisee][27]

									$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", $pionx, $piony, $pionxa, $pionya)
									GUICtrlDelete($Pic667)
									For $o = 0 To 47
										If $Case[$o][5] = $Player[$playervisee][0] Then
											$Case[$o][5] = ""
											ExitLoop(1)
										EndIf
									Next
									If $Resetdispo <> 0 Then
										$Resetok = 1
									EndIf

									phrasehisto(@CRLF & " -Tuer ' " & $Player[$playervisee][0] & " '", Default, $Player[$playervisee][0], 0xEB139B)


								EndIf


								If $MoveAttackactived = 0 Then

									For $5 = 0 To 46
										GUICtrlDelete($LOL[$5][1])
									Next
								EndIf
								If $Activetedlabel1 <> 0 Then
									GUICtrlSetData($Activetedlabel1, "")
								EndIf

								If $Activetedlabel2 <> 0 Then

									GUICtrlSetData($Activetedlabel2, "")
								EndIf
								If $Activetedlabel3 <> 0 Then
									GUICtrlSetData($Activetedlabel3, "")
								EndIf
								If $Activetedlabel4 <> 0 Then
									GUICtrlSetData($Activetedlabel4, "")
								EndIf


								$Player[$tour][18] -= $Competences[$rangcomptutilisee][1]
								$Player[$tour][19] -= $Competences[$rangcomptutilisee][2] * 100

								If $Resetok = 0 Then
									$Player[$tour][28 + $numerocomptutiliseesetperso] = $Competences[$rangcomptutilisee][3]
									If $numerocomptutiliseesetperso = 1 Then
										$dsldslsd = $Compt1
										$x1label = 708
										$compteur1 = 1
										Global $desactiver1 = 1
									ElseIf $numerocomptutiliseesetperso = 2 Then
										$dsldslsd = $Compt2
										$x1label = 812
										$compteur2 = 1
										Global $desactiver2 = 1
									ElseIf $numerocomptutiliseesetperso = 3 Then
										$dsldslsd = $Compt3
										$x1label = 907
										$compteur3 = 1
										Global $desactiver3 = 1
									ElseIf $numerocomptutiliseesetperso = 4 Then
										$dsldslsd = $Compt4
										$x1label = 1005
										$compteur4 = 1
										Global $desactiver4 = 1
									EndIf

									GUICtrlSetImage($dsldslsd, @ScriptDir & "\Image\Compétences\desactiver\" & $Player[$tour][8 + $numerocomptutiliseesetperso] & ".jpg")
									$rprprp = GUICtrlCreateLabel("", $x1label, 698, 28, 56)
									$Player[$tour][34 + $numerocomptutiliseesetperso] = $rprprp
									GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
									GUICtrlSetColor(-1, 0xFF0000)
									GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

									GUICtrlSetData($rprprp, $Player[$tour][28 + $numerocomptutiliseesetperso])
;~ $oldtext=GUICtrlRead($historique)
;~ GUICtrlSetData($historique,$oldtext&@CRLF&@CRLF&"Le joueur "&$Player[$tour]&"

								ElseIf $Resetok = 1 Then


									$Player[$tour][19] += (Ceiling($Resetdispo - Floor($Resetdispo))) * 100
									If $Player[$tour][19] > $Player[$tour][8] Then
										$Player[$tour][19] = $Player[$tour][8]
									EndIf

									$Player[$tour][18] += Floor($Resetdispo)
									If $Player[$tour][18] > $Player[$tour][3] Then
										$Player[$tour][18] = $Player[$tour][3]
									EndIf

									phrasehisto(@CRLF & " - Vu que ' " & $Player[$tour][0] & " ' a tuer quelqu'un il a obtenu un reset du cooldown de ' " & $Competences[$rangcomptutilisee][0] & " ' et a gagné " & Ceiling($Resetdispo - Floor($Resetdispo)) & " de stamina et " & Floor($Resetdispo) & " de mana", Default, $Player[$tour][0], 0xEB139B, $Competences[$rangcomptutilisee][0], 0xE6DB12)
								EndIf
								PERSO(0)


								WM_PAINT()

								ExitLoop(3)
							ElseIf $marrant[$r][0] = "" Then
								WM_PAINT()

								ExitLoop(2)
							EndIf
;~ 					EndIf
						Next
					EndIf



				Next
				
			ElseIf $test Then

				$Array2 = MouseGetPos()
				
				Global $aPos = WinGetPos("JEU")
				


;~

				If $Array2[0] > 680 + $aPos[0] And $Array2[0] < 680 + 73 + $aPos[0] And $Array2[1] > 680 + $aPos[1] And $Array2[1] < 680 + 73 + $aPos[1] Then
					If $desactiver1 = 0 Then
					While _IsPressed($touchecompt1, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(1)
					WEnd
					ExitLoop(3)
				EndIf
				ElseIf $Array2[0] > 784 + $aPos[0] And $Array2[0] < 784 + 73 + $aPos[0] And $Array2[1] > 680 + $aPos[1] And $Array2[1] < 680 + 73 + $aPos[1] Then
					If $desactiver2 = 0 Then
					While _IsPressed($touchecompt2, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(2)
					WEnd
					ExitLoop(3)
				EndIf
				ElseIf $Array2[0] > 880 + $aPos[0] And $Array2[0] < 880 + 73 + $aPos[0] And $Array2[1] > 680 + $aPos[1] And $Array2[1] < 680 + 73 + $aPos[1] Then
					If $desactiver2 = 0 Then
					While _IsPressed($touchecompt2, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(3)
					WEnd
					ExitLoop(3)
				EndIf
				ElseIf $Array2[0] > 976 + $aPos[0] And $Array2[0] < 976 + 73 + $aPos[0] And $Array2[1] > 680 + $aPos[1] And $Array2[1] < 680 + 73 + $aPos[1] Then
					If $desactiver2 = 0 Then
					While _IsPressed($touchecompt2, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(4)
					WEnd
					ExitLoop(3)
				EndIf
				EndIf
				

			ElseIf _IsPressed("02", $dll) Then

				For $e = 0 To 46
					GUICtrlDelete($LOL[$e][1])
				Next
				If $Activetedlabel1 <> 0 Then
					GUICtrlSetData($Activetedlabel1, "")
				EndIf
				If $Activetedlabel2 <> 0 Then
					GUICtrlSetData($Activetedlabel2, "")
				EndIf
				If $Activetedlabel3 <> 0 Then
					GUICtrlSetData($Activetedlabel3, "")
				EndIf
				If $Activetedlabel4 <> 0 Then
					GUICtrlSetData($Activetedlabel4, "")
				EndIf
				WM_PAINT()
				ExitLoop(1)


			ElseIf _IsPressed($touchecompt1, $dll) Then
				If $desactiver1 = 0 Then
					While _IsPressed($touchecompt1, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(1)
					WEnd
					ExitLoop(3)
				EndIf
			ElseIf _IsPressed($touchecompt2, $dll) Then
				If $desactiver2 = 0 Then
					While _IsPressed($touchecompt2, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(2)
					WEnd
					ExitLoop(3)
				EndIf
			ElseIf _IsPressed($touchecompt3, $dll) Then
				If $desactiver3 = 0 Then
					While _IsPressed($touchecompt3, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(3)
					WEnd
					ExitLoop(3)
				EndIf
			ElseIf _IsPressed($touchecompt4, $dll) Then
				If $desactiver4 = 0 Then
					While _IsPressed($touchecompt4, $dll)
						Sleep(10)
					WEnd
					For $e = 0 To 46
						GUICtrlDelete($LOL[$e][1])
					Next
					If $Activetedlabel1 <> 0 Then
						GUICtrlSetData($Activetedlabel1, "")
					EndIf
					If $Activetedlabel2 <> 0 Then
						GUICtrlSetData($Activetedlabel2, "")
					EndIf
					If $Activetedlabel3 <> 0 Then
						GUICtrlSetData($Activetedlabel3, "")
					EndIf
					If $Activetedlabel4 <> 0 Then
						GUICtrlSetData($Activetedlabel4, "")
					EndIf
					WM_PAINT()

					While 1 ;probleme resout en attendant de trouver une soluce
						COMPETENCE(4)
					WEnd
					ExitLoop(3)
				EndIf
			EndIf
		EndIf


	WEnd

EndFunc   ;==>Phase3

Func phrasehisto($phrase, $caractplus = 0, $moachercher1 = "", $couleur1 = 0, $moachercher2 = "", $couleur2 = 0, $moachercher3 = "", $couleur3 = 0)

	$firstchar2 = _GUICtrlRichEdit_GetLineCount($historique) + 1
	_GUICtrlRichEdit_AppendText($historique, $phrase)
	If $moachercher1 <> "" And $couleur1 <> 0 Then
		$firstchar = _GUICtrlRichEdit_GetFirstCharPosOnLine($historique, $firstchar2)
		$mot = _GUICtrlRichEdit_FindTextInRange($historique, $moachercher1, $firstchar + $caractplus)
		_GUICtrlRichEdit_SetSel($historique, $mot[0], $mot[1], True)
		_GUICtrlRichEdit_SetCharColor($historique, $couleur1)
		If $moachercher2 <> "" And $couleur2 <> 0 Then
			$mot = _GUICtrlRichEdit_FindTextInRange($historique, $moachercher2, $firstchar + $caractplus)
			_GUICtrlRichEdit_SetSel($historique, $mot[0], $mot[1], True)
			_GUICtrlRichEdit_SetCharColor($historique, $couleur2)
			If $moachercher3 <> "" And $couleur3 <> 0 Then
				$mot = _GUICtrlRichEdit_FindTextInRange($historique, $moachercher3, $firstchar + $caractplus)
				_GUICtrlRichEdit_SetSel($historique, $mot[0], $mot[1], True)
				_GUICtrlRichEdit_SetCharColor($historique, $couleur3)
			EndIf
		EndIf
	EndIf
	_GUICtrlRichEdit_ScrollToCaret($historique)
	_GUICtrlRichEdit_Deselect($historique)
EndFunc   ;==>phrasehisto

Func Endgame($kill, $teamwinner)
	_GDIPlus_ImageDispose($guerrierdroite)
	_GDIPlus_ImageDispose($guerriergauche)
	_GDIPlus_ImageDispose($ingenieurdroite)
	_GDIPlus_ImageDispose($ingenieurgauche)
	_GDIPlus_ImageDispose($magiciendroite)
	_GDIPlus_ImageDispose($magiciengauche)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_ImageDispose($qdpkqojk)
	_GDIPlus_ImageDispose($moche)
	_GUICtrlRichEdit_Destroy($historique)
	_GDIPlus_Shutdown()
	$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", 0, 0, 1256, 761)

	GUICtrlDelete($Pic667)
	$xp = 0
	$Label111 = GUICtrlCreateLabel("Ecran Finale", 520, 0, 236, 49)
	GUICtrlSetFont(-1, 34, 400, 0, "MS PGothic")
	$Edit111 = GUICtrlCreateEdit("", 896, 176, 273, 409, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $ES_WANTRETURN))

	$ListView111 = GUICtrlCreateListView("Nom|LVL|XP|Etat", 40, 184, 337, 137)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 180)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 50)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 50)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 50)
	$Continuerptdr = GUICtrlCreateButton("Continuer", 456, 656, 369, 97)
	$Progress121 = GUICtrlCreateProgress(40, 384, 337, 25, BitOR($PBS_SMOOTH, $WS_BORDER, $WS_CLIPSIBLINGS))

	$xp = $kill * 150
	_GUICtrlEdit_AppendText($Edit111, "Reward :")
	_GUICtrlEdit_AppendText($Edit111, @CRLF & "XP :")
	_GUICtrlEdit_AppendText($Edit111, @CRLF & @CRLF & "+ Kill = " & $kill * 150)
	$Label112 = GUICtrlCreateLabel("LVL :", 56, 360, 77, 17)
	$Label113 = GUICtrlCreateLabel("Point :", 274, 360, 77, 17)
	$Label114 = GUICtrlCreateLabel("Nom :", 111, 416, 216, 17)


	If $teamwinner = "B" Then
		If $Blueteams[0] = 2 Then
			$Label115 = GUICtrlCreateLabel("LVL :", 56, 461, 77, 17)
			$Label116 = GUICtrlCreateLabel("Nom :", 111, 517, 216, 17)
			$Label117 = GUICtrlCreateLabel("Point :", 274, 457, 77, 17)
			$Progress122 = GUICtrlCreateProgress(40, 480, 337, 25, BitOR($PBS_SMOOTH, $WS_BORDER, $WS_CLIPSIBLINGS))
		EndIf
		$xp += Floor(3000 / $tourscomplet)
		_GUICtrlEdit_AppendText($Edit111, @CRLF & "+ Nombre de tours " & $tourscomplet & " = " & Floor(3000 / $tourscomplet))
		$lvlwinner = 0
		$lvllooser = 0
		For $o = 0 To 3
			If $Player[$o][0] = $Blueteams[1] Then
				$lvlwinner += $Player[$o][14]

			ElseIf $Blueteams[0] = 2 And $Player[$o][0] = $Blueteams[2] Then
				$lvlwinner += $Player[$o][14]

			ElseIf $Player[$o][0] = $Redteams[1] Then
				$lvllooser += $Player[$o][14]
			ElseIf $Redteams[0] = 2 And $Player[$o][0] = $Redteams[2] Then
				$lvllooser += $Player[$o][14]
			EndIf
		Next
		If($lvlwinner - $lvllooser) >= 4 Then
			_GUICtrlEdit_AppendText($Edit111, @CRLF & "- Level de différence " & ($lvlwinner - $lvllooser) & " = " & ($lvlwinner - $lvllooser) * 75)
			$xp -= ($lvlwinner - $lvllooser) * 75
			If $xp < 0 Then
				$xp = 0
			EndIf
		ElseIf($lvllooser - $lvlwinner) >= 4 Then
			_GUICtrlEdit_AppendText($Edit111, @CRLF & "+ Level de différence " & ($lvllooser - $lvlwinner) & " = " & ($lvllooser - $lvlwinner) * 100)
			$xp += ($lvllooser - $lvlwinner) * 100
		EndIf
		_GUICtrlEdit_AppendText($Edit111, @CRLF & @CRLF & "Resultat xp = " & Floor($xp))
		For $t = 0 To 3

			If $Player[$t][0] = $Blueteams[1] Then
				GUICtrlSetData($Label114, "Nom : " & $Player[$t][0])
				$Player[$t][15] += Floor($xp)
				_GUICtrlEdit_AppendText($Edit111, @CRLF)
				For $o = 0 To 3
					If $Player[$t][15] >= ($Player[$t][14] * 100) Then
						$Player[$t][15] = $Player[$t][15] - $Player[$t][14] * 100
						$Player[$t][14] += 1
						_GUICtrlEdit_AppendText($Edit111, @CRLF & $Player[$t][0] & " est passer level " & $Player[$t][14])
						$Player[$t][16] += 10
					Else
						ExitLoop(1)
					EndIf
				Next
				ouverturereicritureandsave($Player[$t][0], $Player[$t][14], $Player[$t][16], $Player[$t][15])
				$exp = POURCENTAGE($Player[$t][15], $Player[$t][14] * 100)
				GUICtrlSetData($Progress121, $exp)
				GUICtrlSetData($Label112, "LVL : " & $Player[$t][14])
				GUICtrlSetData($Label113, "Point : " & $Player[$t][16])
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)

			ElseIf $Blueteams[0] = 2 And $Player[$t][0] = $Blueteams[2] Then

				GUICtrlSetData($Label114, "Nom : " & $Player[$t][0])
				$Player[$t][15] += Floor($xp)
				_GUICtrlEdit_AppendText($Edit111, @CRLF)
				For $o = 0 To 3
					If $Player[$t][15] >= ($Player[$t][14] * 100) Then
						$Player[$t][15] = $Player[$t][15] - $Player[$t][14] * 100
						$Player[$t][14] += 1
						_GUICtrlEdit_AppendText($Edit111, @CRLF & $Player[$t][0] & " est passer level " & $Player[$t][14])
						$Player[$t][16] += 10
					Else
						ExitLoop(1)
					EndIf
				Next
				ouverturereicritureandsave($Player[$t][0], $Player[$t][14], $Player[$t][16], $Player[$t][15])
				$exp = POURCENTAGE($Player[$t][15], $Player[$t][14] * 100)
				GUICtrlSetData($Progress122, $exp)
				GUICtrlSetData($Label115, "LVL : " & $Player[$t][14])
				GUICtrlSetData($Label117, "Point : " & $Player[$t][16])
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			ElseIf $Player[$t][0] = $Redteams[1] Then
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			ElseIf $Redteams[0] = 2 And $Player[$t][0] = $Redteams[2] Then
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			EndIf

		Next
	ElseIf $teamwinner = "R" Then
		If $Redteams[0] = 2 Then

			$Label115 = GUICtrlCreateLabel("LVL :", 56, 461, 77, 17)
			$Label116 = GUICtrlCreateLabel("Nom :", 111, 517, 216, 17)
			$Label117 = GUICtrlCreateLabel("Point :", 274, 457, 77, 17)
			$Progress122 = GUICtrlCreateProgress(40, 480, 337, 25, BitOR($PBS_SMOOTH, $WS_BORDER, $WS_CLIPSIBLINGS))
		EndIf
		$xp += Floor(3000 / $tourscomplet)
		_GUICtrlEdit_AppendText($Edit111, @CRLF & "+ Nombre de tours " & $tourscomplet & " = " & Floor(3000 / $tourscomplet))
		$lvlwinner = 0
		$lvllooser = 0
		For $o = 0 To 3
			If $Player[$o][0] = $Redteams[1] Then
				$lvlwinner += $Player[$o][14]
			ElseIf $Redteams[0] = 2 And $Player[$o][0] = $Redteams[2] Then
				$lvlwinner += $Player[$o][14]

			ElseIf $Player[$o][0] = $Blueteams[1] Then
				$lvllooser += $Player[$o][14]
			ElseIf $Blueteams[0] = 2 And $Player[$o][0] = $Blueteams[2] Then
				$lvllooser += $Player[$o][14]
			EndIf
		Next
		If($lvlwinner - $lvllooser) >= 4 Then
			_GUICtrlEdit_AppendText($Edit111, @CRLF & "- Level de différence " & ($lvlwinner - $lvllooser) & " = " & ($lvlwinner - $lvllooser) * 75)
			$xp -= ($lvlwinner - $lvllooser) * 75
			If $xp < 0 Then
				$xp = 0
			EndIf
		ElseIf($lvllooser - $lvlwinner) >= 4 Then
			_GUICtrlEdit_AppendText($Edit111, @CRLF & "+ Level de différence " & ($lvllooser - $lvlwinner) & " = " & ($lvllooser - $lvlwinner) * 100)
			$xp += ($lvllooser - $lvlwinner) * 100
		EndIf
		_GUICtrlEdit_AppendText($Edit111, @CRLF & @CRLF & "Resultat xp = " & Floor($xp))
		For $t = 0 To 3

			If $Player[$t][0] = $Redteams[1] Then
				GUICtrlSetData($Label114, "Nom : " & $Player[$t][0])
				$Player[$t][15] += Floor($xp)
				_GUICtrlEdit_AppendText($Edit111, @CRLF)
				For $o = 0 To 3
					If $Player[$t][15] >= ($Player[$t][14] * 100) Then
						$Player[$t][15] = $Player[$t][15] - $Player[$t][14] * 100
						$Player[$t][14] += 1
						_GUICtrlEdit_AppendText($Edit111, @CRLF & $Player[$t][0] & " est passer level " & $Player[$t][14])
						$Player[$t][16] += 10
					Else
						ExitLoop(1)
					EndIf
				Next
				ouverturereicritureandsave($Player[$t][0], $Player[$t][14], $Player[$t][16], $Player[$t][15])
				$exp = POURCENTAGE($Player[$t][15], $Player[$t][14] * 100)
				GUICtrlSetData($Progress121, $exp)
				GUICtrlSetData($Label112, "LVL : " & $Player[$t][14])
				GUICtrlSetData($Label113, "Point : " & $Player[$t][16])
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			ElseIf $Redteams[0] = 2 And $Player[$t][0] = $Redteams[2] Then

				GUICtrlSetData($Label114, "Nom : " & $Player[$t][0])
				$Player[$t][15] += Floor($xp)
				_GUICtrlEdit_AppendText($Edit111, @CRLF)
				For $o = 0 To 3
					If $Player[$t][15] >= ($Player[$t][14] * 100) Then
						$Player[$t][15] = $Player[$t][15] - $Player[$t][14] * 100
						$Player[$t][14] += 1
						_GUICtrlEdit_AppendText($Edit111, @CRLF & $Player[$t][0] & " est passer level " & $Player[$t][14])
						$Player[$t][16] += 10
					Else
						ExitLoop(1)
					EndIf
				Next

				ouverturereicritureandsave($Player[$t][0], $Player[$t][14], $Player[$t][16], $Player[$t][15])
				$exp = POURCENTAGE($Player[$t][15], $Player[$t][14] * 100)
				GUICtrlSetData($Progress122, $exp)
				GUICtrlSetData($Label115, "LVL : " & $Player[$t][14])
				GUICtrlSetData($Label117, "Point : " & $Player[$t][16])
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			ElseIf $Player[$t][0] = $Blueteams[1] Then
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			ElseIf $Blueteams[0] = 2 And $Player[$t][0] = $Blueteams[2] Then
				GUICtrlCreateListViewItem($Player[$t][0] & "|" & $Player[$t][14] & "|" & $Player[$t][15] & "|" & $Player[$t][16], $ListView111)
			EndIf

		Next
	EndIf
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE

				Exit
			Case $Continuerptdr
				For $r = 0 To 40
					GUICtrlDelete($r)
				Next
				Town()
		EndSwitch
	WEnd
EndFunc   ;==>Endgame

Func ouverturereicritureandsave($nom, $lvl, $point, $xp)
	Global $champ[1][17]
	$file = FileOpen(@ScriptDir & "\Data\Perso\" & $nom & ".txt") ;ouvre un fichier texte
	$adecrypter = FileRead($file) ;lis le fichier texte
	FileClose($file) ;ferme le fichier texte
	$leel = _Crypt_DecryptData($adecrypter, "darkelle24", $CALG_RC4) ;decrypte le texte grace au mdp darkelle24 et renvoie un code binaire
	$leeel = BinaryToString($leel) ;permet de convertir du binaire en texte
	_FileCreate(@ScriptDir & "\Data\Perso\temp.txt") ;creer un fichier texte
	$file = FileOpen(@ScriptDir & "\Data\Perso\temp.txt", 2) ;ouvre un fichier texte en mode ecriture et suppression de ce qu il y avait avant
	FileWrite($file, $leeel) ;ecrit le texte dechiffrer dans le nouveau fichier texte
	$test = _FileReadToArray(@ScriptDir & "\Data\Perso\temp.txt", $champ, $FRTA_NOCOUNT, "|") ;permet de convertir le texte du fichier texte en tableau grace au marqueur |
	FileClose($file)
	FileDelete(@ScriptDir & "\Data\Perso\temp.txt")
	$champ[0][14] = $lvl
	$champ[0][15] = $xp
	$champ[0][16] = $point
	FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
	_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
	_FileWriteFromArray(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $champ)
	$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
	$tableauacrypte = FileRead($file)
	FileDelete(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
	FileClose($file)
	$tableauacrypte = _Crypt_EncryptData($tableauacrypte, "darkelle24", $CALG_RC4)
	_FileCreate(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt")
	$file = FileOpen(@ScriptDir & "\Data\Perso\" & $champ[0][0] & ".txt", $FO_APPEND)
	FileWrite($file, $tableauacrypte)
	FileClose($file)
EndFunc   ;==>ouverturereicritureandsave



Func direction($dep, $fin)
	If $activatiedview = "True" Then
		$horizontale = ($Case[$fin][0] - Floor($Case[$fin][0] / 10) * 10) - ($Case[$dep][0] - Floor($Case[$dep][0] / 10) * 10)
		If $horizontale > 0 Then
			If $Player[$tour][40] <> "droite" Then
				$pionx = $Player[$tour][24]
				$pionxa = $Player[$tour][25]
				$piony = $Player[$tour][26]
				$pionya = $Player[$tour][27]

				$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", $pionx, $piony, $pionxa, $pionya)
				GUICtrlDelete($Pic667)
			EndIf
			$Player[$tour][40] = "droite"
		ElseIf $horizontale < 0 Then
			If $Player[$tour][40] <> "gauche" Then
				$pionx = $Player[$tour][24]
				$pionxa = $Player[$tour][25]
				$piony = $Player[$tour][26]
				$pionya = $Player[$tour][27]

				$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", $pionx, $piony, $pionxa, $pionya)
				GUICtrlDelete($Pic667)
			EndIf
			$Player[$tour][40] = "gauche"
		EndIf
	EndIf

EndFunc   ;==>direction

Func Menu()
	$Pic667 = GUICtrlCreatePic(@ScriptDir & "\Image\efface.jpg", 0, 0, 1256, 761)
	GUICtrlDelete($Pic667)
	For $dab = 0 To 150
		GUICtrlSetState($dab, $GUI_HIDE)
	Next
	WinSetState($historique, "", @SW_HIDE)



	$Resume = GUICtrlCreateButton("Resume", 450, 136, 353, 73)
	$Option = GUICtrlCreateButton("Option", 448, 256, 353, 73)
	$townmenu = GUICtrlCreateButton("Town", 448, 372, 353, 73)
	$Exit = GUICtrlCreateButton("Exit", 448, 488, 353, 73)
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Option
				For $yesI = $Resume To $Exit
					GUICtrlSetState($yesI, $GUI_HIDE)
				Next
				OPTION(1)
				For $yesI = $Resume To $Exit
					GUICtrlSetState($yesI, $GUI_SHOW)
				Next
			Case $Resume
				For $yesI = $Resume To $Exit
					GUICtrlDelete($yesI)
				Next
				For $dab = 0 To 150
					GUICtrlSetState($dab, $GUI_SHOW)
				Next
				WinSetState($historique, "", @SW_SHOW)
				WM_PAINT()
				ExitLoop(1)

			Case $Exit
				Exit
			Case $townmenu

				_GDIPlus_ImageDispose($guerrierdroite)
				_GDIPlus_ImageDispose($guerriergauche)
				_GDIPlus_ImageDispose($ingenieurdroite)
				_GDIPlus_ImageDispose($ingenieurgauche)
				_GDIPlus_ImageDispose($magiciendroite)
				_GDIPlus_ImageDispose($magiciengauche)
				_GDIPlus_ImageDispose($hImage2)
				_GDIPlus_ImageDispose($qdpkqojk)
				_GDIPlus_ImageDispose($moche)
				_GDIPlus_Shutdown()
				For $dab = 0 To 150
					GUICtrlDelete($dab)
				Next
				Town()
			Case $GUI_EVENT_CLOSE
				Exit

		EndSwitch
	WEnd
EndFunc   ;==>Menu

Func PersoSEE($iCtrlID)
;~ 	ConsoleWrite($iCtrlID&@CRLF)

	For $yesI = 0 To 3
;~ 		ConsoleWrite($Player[$yesI][7] & @CRLF)
		If $Player[$yesI][42] = $iCtrlID Then

			$MDRXPTDR = $yesI
			ExitLoop(1)
		EndIf
	Next
	$aMousePos = MouseGetPos()
;~ 	ConsoleWrite($MDRXPTDR&@CRLF)
	$bof = GUICreate($Player[$MDRXPTDR][0], 348, 322, $aMousePos[0] + 10, $aMousePos[1] + 10, BitOR($WS_POPUP, $WS_BORDER), $WS_EX_TOPMOST, $Form1)
	GUISetBkColor(0x000000, $bof)
	GUISetState(@SW_SHOW, $bof)

	XPStyle(1)
	$Hpmdr = GUICtrlCreateProgress(96, 64, 241, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
	GUICtrlSetColor(-1, 0x00FF00)
	GUICtrlSetBkColor(-1, 0x800000)
	GUICtrlSetData(-1, POURCENTAGE($Player[$MDRXPTDR][17], $Player[$MDRXPTDR][2]))
	$Manamdr = GUICtrlCreateProgress(96, 104, 241, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
	GUICtrlSetColor(-1, 0x00FFFF)
	GUICtrlSetBkColor(-1, 0x000080)
	GUICtrlSetData(-1, POURCENTAGE($Player[$MDRXPTDR][18], $Player[$MDRXPTDR][3]))
	$Stammdr = GUICtrlCreateProgress(96, 144, 241, 25, BitOR($PBS_SMOOTH, $WS_CLIPSIBLINGS))
	GUICtrlSetColor(-1, 0xFFFF00)
	GUICtrlSetBkColor(-1, 0x808000)
	GUICtrlSetData(-1, POURCENTAGE(Int($Player[$MDRXPTDR][19] / 100), Int($Player[$MDRXPTDR][8] / 100)))
	XPStyle(0)
	$hplabelmdr = GUICtrlCreateLabel("Text", 96, 68, 241, 25, $SS_CENTER, $WS_EX_TOPMOST)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetData(-1, "HP: " & $Player[$MDRXPTDR][17] & "/" & $Player[$MDRXPTDR][2])
	$manalabelmdr = GUICtrlCreateLabel("Label1", 96, 108, 241, 25, $SS_CENTER, $WS_EX_TOPMOST)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetData(-1, "MANA: " & $Player[$MDRXPTDR][18] & "/" & $Player[$MDRXPTDR][3])
	$stamlabelmdr = GUICtrlCreateLabel("Label1", 96, 148, 241, 25, $SS_CENTER, $WS_EX_TOPMOST)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetData(-1, "STAM: " & Int($Player[$MDRXPTDR][19] / 100) & "/" & Int($Player[$MDRXPTDR][8] / 100))
	If $Player[$MDRXPTDR][39] = "Au valhala" Then
		$visageperso = GUICtrlCreatePic(@ScriptDir & "\Image\tete-de-mort-16657.jpg", 5, 64, 81, 81)
	ElseIf $Player[$MDRXPTDR][13] = "Guerrier" Then
		$visageperso = GUICtrlCreatePic(@ScriptDir & "\Image\guerrier.jpg", 5, 64, 81, 81)
	ElseIf $Player[$MDRXPTDR][13] = "Magicien" Then
		$visageperso = GUICtrlCreatePic(@ScriptDir & "\Image\magicien.jpg", 5, 64, 81, 81)
	ElseIf $Player[$MDRXPTDR][13] = "Ingénieur" Then
		$visageperso = GUICtrlCreatePic(@ScriptDir & "\Image\ingenieur.jpg", 5, 64, 81, 81)
	EndIf
	$Nomperso = GUICtrlCreateLabel("Label1", 2, 8, 340, 28, $SS_CENTER, $WS_EX_TOPMOST)
	GUICtrlSetFont(-1, 15, 800, 0, "MS Sans Serif")
	GUICtrlSetData($Nomperso, $Player[$MDRXPTDR][0])
	GUICtrlSetColor(-1, 0xFF0000)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)


	If $Player[$MDRXPTDR][29] <> 0 Then

		$spec1 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\desactiver\" & $Player[$MDRXPTDR][9] & ".jpg", 5, 240, 73, 73)
		GUICtrlCreateLabel("", 30, 260, 28, 56, $SS_CENTER)
		GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xFF0000)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetData(-1, $Player[$MDRXPTDR][29])
		$desactiver1spec = 1

	Else
		$spec1 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$MDRXPTDR][9] & ".jpg", 5, 240, 73, 73)
		$desactiver1spec = 0
	EndIf
	If $Player[$MDRXPTDR][30] <> 0 Then


		$spec2 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\desactiver\" & $Player[$MDRXPTDR][10] & ".jpg", 93, 240, 73, 73)
		GUICtrlCreateLabel("", 115, 260, 28, 56, $SS_CENTER)
		GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xFF0000)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		GUICtrlSetData(-1, $Player[$MDRXPTDR][30])
		$desactiver2spec = 1

	Else
		$spec2 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$MDRXPTDR][10] & ".jpg", 93, 240, 73, 73)
		$desactiver2spec = 0
	EndIf
	If $Player[$MDRXPTDR][31] <> 0 Then


		$spec3 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\desactiver\" & $Player[$MDRXPTDR][11] & ".jpg", 181, 240, 73, 73)
		GUICtrlCreateLabel("", 200, 260, 28, 56, $SS_CENTER)
		GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xFF0000)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		GUICtrlSetData(-1, $Player[$MDRXPTDR][31])
		$desactiver3spec = 1

	Else
		$spec3 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$MDRXPTDR][11] & ".jpg", 181, 240, 73, 73)
		$desactiver3spec = 0
	EndIf
	If $Player[$MDRXPTDR][32] <> 0 Then

		$spec4 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\desactiver\" & $Player[$MDRXPTDR][12] & ".jpg", 269, 240, 73, 73)
		GUICtrlCreateLabel("", 285, 260, 28, 56, $SS_CENTER)
		GUICtrlSetFont(-1, 35, 400, 0, "MS Sans Serif")
		GUICtrlSetColor(-1, 0xFF0000)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		GUICtrlSetData(-1, $Player[$MDRXPTDR][32])
		$desactiver4spec = 1

	Else
		$spec4 = GUICtrlCreatePic(@ScriptDir & "\Image\Compétences\reel\" & $Player[$MDRXPTDR][12] & ".jpg", 269, 240, 73, 73)
		$desactiver4spec = 0
	EndIf
	$Stam1spec = GUICtrlCreateLabel("", 6, 296, 32, 17)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

	$Mana1spec = GUICtrlCreateLabel("", 45, 296, 32, 17, $SS_RIGHT)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

	$Stam2spec = GUICtrlCreateLabel("", 94, 296, 32, 17)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	$Mana2spec = GUICtrlCreateLabel("", 133, 296, 32, 17, $SS_RIGHT)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	$Mana3spec = GUICtrlCreateLabel("", 221, 296, 32, 17, $SS_RIGHT)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	$Stam3spec = GUICtrlCreateLabel("", 182, 296, 32, 17)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	$Mana4spec = GUICtrlCreateLabel("", 309, 296, 32, 17, $SS_RIGHT)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	$Stam4spec = GUICtrlCreateLabel("", 270, 296, 32, 17)
	GUICtrlSetFont(-1, 4, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xC8C8C8)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	For $o = 0 To 11
		For $y = 9 To 12

			If $Player[$MDRXPTDR][$y] = $Competences[$o][0] Then
				Switch $y
					Case 9
						GUICtrlSetData($Stam1spec, $Competences[$o][2])
						GUICtrlSetData($Mana1spec, $Competences[$o][1])
					Case 10
						GUICtrlSetData($Stam2spec, $Competences[$o][2])
						GUICtrlSetData($Mana2spec, $Competences[$o][1])
					Case 11
						GUICtrlSetData($Stam3spec, $Competences[$o][2])
						GUICtrlSetData($Mana3spec, $Competences[$o][1])
					Case 12
						GUICtrlSetData($Stam4spec, $Competences[$o][2])
						GUICtrlSetData($Mana4spec, $Competences[$o][1])

				EndSwitch

				If $Player[$MDRXPTDR][18] < $Competences[$o][1] Then

					Switch $y
						Case 9
							If $desactiver1spec = 0 Then
								GUICtrlSetImage($spec1, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Mana1spec, 0xFF0000)
							Global $desactiver1spec = 1
						Case 10
							If $desactiver2spec = 0 Then
								GUICtrlSetImage($spec2, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Mana2spec, 0xFF0000)
							Global $desactiver2spec = 1
						Case 11
							If $desactiver3spec = 0 Then
								GUICtrlSetImage($spec3, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Mana3spec, 0xFF0000)
							Global $desactiver3spec = 1
						Case 12
							If $desactiver4spec = 0 Then
								GUICtrlSetImage($spec4, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Mana4spec, 0xFF0000)
							Global $desactiver4spec = 1
					EndSwitch
				EndIf
				If Int($Player[$MDRXPTDR][19] / 100) < $Competences[$o][2] Then

					Switch $y
						Case 9
							If $desactiver1spec = 0 Then
								GUICtrlSetImage($spec1, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Stam1spec, 0xFF0000)
							Global $desactiver1spec = 1
						Case 10
							If $desactiver2spec = 0 Then
								GUICtrlSetImage($spec2, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Stam2spec, 0xFF0000)
							Global $desactiver2spec = 1
						Case 11
							If $desactiver3spec = 0 Then
								GUICtrlSetImage($spec3, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Stam3spec, 0xFF0000)
							Global $desactiver3spec = 1
						Case 12
							If $desactiver4spec = 0 Then
								GUICtrlSetImage($spec4, @ScriptDir & "\Image\Compétences\desactiver\" & $Competences[$o][0] & ".jpg")
							EndIf
							GUICtrlSetColor($Stam4spec, 0xFF0000)
							Global $desactiver4spec = 1
					EndSwitch

				EndIf
			EndIf
		Next
	Next

	For $i = 0 To 47
		If $Case[$i][5] = $Player[$MDRXPTDR][0] Then
			$LOL = Floor($Case[$i][0] / 10)
			If $LOL = 1 Then
				$lettre = "A"
			ElseIf $LOL = 2 Then
				$lettre = "B"
			ElseIf $LOL = 3 Then
				$lettre = "C"
			ElseIf $LOL = 4 Then
				$lettre = "D"
			ElseIf $LOL = 5 Then
				$lettre = "E"
			ElseIf $LOL = 6 Then
				$lettre = "F"
			EndIf
			$posperso = GUICtrlCreateLabel("Position actuelle : " & $lettre & ($Case[$i][0] - $LOL * 10), 8, 192, 172, 25)
			GUICtrlSetFont(-1, 11, 800, 0, "MS Sans Serif")
			GUICtrlSetColor(-1, 0x3399FF)
			ExitLoop(1)
		EndIf
	Next

	$LVLSPEC = GUICtrlCreateLabel("LVL : " & $Player[$MDRXPTDR][14], 8, 152, 69, 17)
	GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFF0000)
	$Player[$MDRXPTDR][41] = $bof

	GUICtrlCreateLabel("Arm :" & $Player[$MDRXPTDR][6], 232, 184, 53, 17)
	GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFE9A2E)
	GUICtrlCreateLabel("AD :" & $Player[$MDRXPTDR][4], 168, 184, 53, 17)
	GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFE9A2E)
	GUICtrlCreateLabel("AP :" & $Player[$MDRXPTDR][5], 168, 208, 53, 17)
	GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFE9A2E)
	GUICtrlCreateLabel("MR :" & $Player[$MDRXPTDR][7], 232, 208, 53, 17)
	GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFE9A2E)
	GUICtrlCreateLabel("MS :" & $Player[$MDRXPTDR][8], 292, 197, 53, 17)
	GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
	GUICtrlSetColor(-1, 0xFE9A2E)

EndFunc   ;==>PersoSEE
Func Persoseeshutdown($iCtrlID)
	For $yesI = 0 To 3
		If $Player[$yesI][42] = $iCtrlID Then
			$MDRXPTDR = $yesI
			ExitLoop(1)
		EndIf
	Next
	GUIDelete($Player[$MDRXPTDR][41])
	WM_PAINT()
EndFunc   ;==>Persoseeshutdown

Func Commande($goto)
	$Label1 = GUICtrlCreateLabel("COMMANDE", 508, 8, 241, 52)
	GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
	$Cancel666 = GUICtrlCreateButton("Cancel", 24, 696, 161, 49)
	$Valider = GUICtrlCreateButton("Valider", 1064, 696, 161, 49)
	$Button1 = GUICtrlCreateButton("Default", 528, 704, 161, 49)
	$Label2 = GUICtrlCreateLabel("1 competence :", 72, 112, 135, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button2 = GUICtrlCreateButton("", 216, 104, 185, 41)
	$Label3 = GUICtrlCreateLabel("2 competence :", 72, 168, 135, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button3 = GUICtrlCreateButton("", 216, 160, 185, 41)
	$Label4 = GUICtrlCreateLabel("4 competence :", 72, 280, 135, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button4 = GUICtrlCreateButton("", 216, 272, 185, 41)
	$Label5 = GUICtrlCreateLabel("3 competence :", 72, 224, 135, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button5 = GUICtrlCreateButton("", 216, 216, 185, 41)
	$Label6 = GUICtrlCreateLabel("Move :", 144, 392, 61, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button6 = GUICtrlCreateButton("", 216, 384, 185, 41)
	$Label7 = GUICtrlCreateLabel("Next :", 152, 336, 53, 28, $SS_RIGHT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Button7 = GUICtrlCreateButton("", 216, 328, 185, 41)

	Tabledescommandes(0, $touchecompt1, $Button2)
	Tabledescommandes(0, $touchecompt2, $Button3)
	Tabledescommandes(0, $touchecompt3, $Button5)
	Tabledescommandes(0, $touchecompt4, $Button4)
	Tabledescommandes(0, $touchenext, $Button6)
	Tabledescommandes(0, $touchemove, $Button7)
	While 1
		$nMsg6 = GUIGetMsg()
		Switch $nMsg6

			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button2
				Tabledescommandes(1, $touchecompt1, $Button2)
			Case $Button3
				Tabledescommandes(1, $touchecompt2, $Button3)
			Case $Button4
				Tabledescommandes(1, $touchecompt4, $Button4)
			Case $Button5
				Tabledescommandes(1, $touchecompt3, $Button5)
			Case $Button6
				Tabledescommandes(1, $touchenext, $Button6)
			Case $Button7
				Tabledescommandes(1, $touchemove, $Button7)
			Case $Cancel666
				For $o = $Label1 To $Button7
					GUICtrlDelete($o)
				Next
				ExitLoop(1)
			Case $Valider
				$touchecompt1 = Tabledescommandes(2, GUICtrlRead($Button2))
				$touchecompt2 = Tabledescommandes(2, GUICtrlRead($Button3))
				$touchecompt3 = Tabledescommandes(2, GUICtrlRead($Button5))
				$touchecompt4 = Tabledescommandes(2, GUICtrlRead($Button4))
				$touchenext = Tabledescommandes(2, GUICtrlRead($Button6))
				$touchemove = Tabledescommandes(2, GUICtrlRead($Button7))
				$paraparaparametre = FileOpen(@ScriptDir & "\Data\Parametre.ini", 2)
				FileWrite($paraparaparametre, "Volume : " & $Sound & @CRLF)
;~ 				FileWrite($paraparaparametre, "Refreshpng : " & $refrechpng & @CRLF)
				FileWrite($paraparaparametre, "Activer la gestion du sens du regard des perso : " & $activatiedview & @CRLF)
				FileWrite($paraparaparametre, "Sans skin : " & $Withoutskin & @CRLF)
				FileWrite($paraparaparametre, "Sans effet visuel : " & $Withoutspaceview & @CRLF)
				FileWrite($paraparaparametre, "1 competence : " & $touchecompt1 & @CRLF)
				FileWrite($paraparaparametre, "2 competence : " & $touchecompt2 & @CRLF)
				FileWrite($paraparaparametre, "3 competence : " & $touchecompt3 & @CRLF)
				FileWrite($paraparaparametre, "4 competence : " & $touchecompt4 & @CRLF)
				FileWrite($paraparaparametre, "Next : " & $touchenext & @CRLF)
				FileWrite($paraparaparametre, "Move : " & $touchemove & @CRLF)
				FileClose($paraparaparametre)
				For $o = $Label1 To $Button7
					GUICtrlDelete($o)
				Next
				ExitLoop(1)
		EndSwitch
	WEnd

EndFunc   ;==>Commande

Func Tabledescommandes($etape, $lettreachercher = "", $boutton = "")
	If $etape = 0 Then
		For $artchoung = 0 to 110
			If $commande[$artchoung][0] = $lettreachercher Then
				GUICtrlSetData($boutton, $commande[$artchoung][1])
				ExitLoop(1)
			EndIf
		Next
	ElseIf $etape = 1 Then
		$artchoung = 0
		GUICtrlSetData($boutton, "Pressez une touche")
		While 1
;~  $nMsg6 = GUIGetMsg()
;~ 		Switch $nMsg6
;~ Case $GUI_EVENT_CLOSE
;~ 				Exit
;~ 			 EndSwitch
;~ 			 If _IsPressed($commande[$artchoung][0],$dll) Then
;~ 				GUICtrlSetData($boutton,$commande[$artchoung][1])
;~ 				Else
;~ 			  $artchoung+=1
;~ 			  If $artchoung>110 Then
;~ 				 $artchoung=0
;~ 				 EndIf
;~ EndIf
			For $artchoung = 0 To 110
				If _IsPressed($commande[$artchoung][0], $dll) Then
					GUICtrlSetData($boutton, $commande[$artchoung][1])
					ExitLoop(2)
				EndIf
			Next
			If _IsPressed("02", $dll) Then
				Tabledescommandes(0, $lettreachercher, $boutton)
				ExitLoop(1)
			EndIf
			$nMsg65 = GUIGetMsg()
			Switch $nMsg65

				Case $GUI_EVENT_CLOSE
					Exit
			EndSwitch
		WEnd
	ElseIf $etape = 2 Then
		For $artchoung = 0 to 110
			If $commande[$artchoung][1] = $lettreachercher Then
				Return $commande[$artchoung][0]
				ExitLoop(1)
			EndIf
		Next
	EndIf
EndFunc   ;==>Tabledescommandes
